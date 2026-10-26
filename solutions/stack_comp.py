import ast
from tools import Temp, OPS, rewrite_labels
from sim import Cmd, Imm, Mem, Stack, Label


def comp_expr(expr):
    match expr:
        case ast.Constant(val):
            return [Cmd('PUSH', Stack(), Imm(val))]
        case ast.Name(name):
            return [Cmd('LD', Stack(), Mem(name))]
        case (ast.BinOp(left, op, right) |
              ast.Compare(left, ops=[op], comparators=[right])):
            left_code = comp_expr(left)
            right_code = comp_expr(right)
            return (left_code + right_code + [Cmd(OPS[type(op)], Stack(),
                                                  Stack(), Stack())])


def comp_stmt(stmt):
    match stmt:
        case ast.Assign([ast.Name(name)], expr):
            code = comp_expr(expr)
            return code + [Cmd('ST', Mem(name), Stack())]
        case ast.While(test, block):
            head, end = next(Temp), next(Temp)
            return [
                Cmd('LABEL', Label(head)),
                *comp_expr(test),
                Cmd('JZ', Label(end), Stack()),
                *comp_block(block),
                Cmd('JMP', Label(head)),
                Cmd('LABEL', Label(end))
            ]
        case ast.If(test, body, orelse):
            els, end = next(Temp), next(Temp)
            return [
                *comp_expr(test),
                Cmd('JZ', Label(els), Stack()),
                *comp_block(body),
                Cmd('JMP', Label(end)),
                Cmd('LABEL', Label(els)),
                *comp_block(orelse),
                Cmd('LABEL', Label(end))
            ]
        case ast.Expr(ast.Call(ast.Name('out'), [expr])):
            code = comp_expr(expr)
            return code + [Cmd('OUT', None, Stack())]


def comp_block(block):
    return sum((comp_stmt(stmt) for stmt in block), [])


def comp(src):
    return rewrite_labels(comp_block(ast.parse(src).body))
