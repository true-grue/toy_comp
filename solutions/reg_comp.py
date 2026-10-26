import ast
from tools import Temp, OPS, rewrite_labels
from sim import Cmd, Imm, Mem, Stack, Reg, Label


def push(regs):
    reg = Reg(len(regs))
    regs.append(reg)
    return reg


def comp_expr(expr, regs):
    match expr:
        case ast.Constant(val):
            return [Cmd('LI', push(regs), Imm(val))]
        case ast.Name(name):
            return [Cmd('LD', push(regs), Mem(name))]
        case (ast.BinOp(left, op, right) |
              ast.Compare(left, ops=[op], comparators=[right])):
            left_code = comp_expr(left, regs)
            right_code = comp_expr(right, regs)
            right = regs.pop()
            left = regs.pop()
            return (left_code + right_code +
                    [Cmd(OPS[type(op)], push(regs), left, right)])


def comp_stmt(stmt):
    match stmt:
        case ast.Assign([ast.Name(name)], expr):
            regs = []
            code = comp_expr(expr, regs)
            return code + [Cmd('ST', Mem(name), regs.pop())]
        case ast.While(test, block):
            head, end = next(Temp), next(Temp)
            regs = []
            test_code = comp_expr(test, regs)
            return [
                Cmd('LABEL', Label(head)),
                *test_code,
                Cmd('JZ', Label(end), regs.pop()),
                *comp_block(block),
                Cmd('JMP', Label(head)),
                Cmd('LABEL', Label(end))
            ]
        case ast.If(test, body, orelse):
            els, end = next(Temp), next(Temp)
            regs = []
            test_code = comp_expr(test, regs)
            return [
                *test_code,
                Cmd('JZ', Label(els), regs.pop()),
                *comp_block(body),
                Cmd('JMP', Label(end)),
                Cmd('LABEL', Label(els)),
                *comp_block(orelse),
                Cmd('LABEL', Label(end))
            ]
        case ast.Expr(ast.Call(ast.Name('out'), [expr])):
            regs = []
            code = comp_expr(expr, regs)
            return code + [Cmd('OUT', None, regs.pop())]


def comp_block(block):
    return sum((comp_stmt(stmt) for stmt in block), [])


def comp(src):
    return rewrite_labels(comp_block(ast.parse(src).body))
