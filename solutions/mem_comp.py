import ast
from tools import Temp, OPS, rewrite_labels
from sim import Cmd, Imm, Mem, Label


def comp_expr(expr):
    match expr:
        case ast.Constant(val):
            dst = Mem(next(Temp))
            return [Cmd('LI', dst, Imm(val))], dst
        case ast.Name(name):
            return [], Mem(name)
        case (ast.BinOp(left, op, right) |
              ast.Compare(left, ops=[op], comparators=[right])):
            dst = Mem(next(Temp))
            left_code, left_dst = comp_expr(left)
            right_code, right_dst = comp_expr(right)
            return (left_code + right_code + [Cmd(OPS[type(op)], dst,
                                                  left_dst, right_dst)]), dst


def comp_stmt(stmt):
    match stmt:
        case ast.Assign([ast.Name(name)], expr):
            code, code_dst = comp_expr(expr)
            return code + [Cmd('MOV', Mem(name), code_dst)]
        case ast.While(test, block):
            head, end = next(Temp), next(Temp)
            test_code, test_dst = comp_expr(test)
            return [
                Cmd('LABEL', Label(head)),
                *test_code,
                Cmd('JZ', Label(end), test_dst),
                *comp_block(block),
                Cmd('JMP', Label(head)),
                Cmd('LABEL', Label(end))
            ]
        case ast.If(test, body, orelse):
            els, end = next(Temp), next(Temp)
            test_code, test_dst = comp_expr(test)
            return [
                *test_code,
                Cmd('JZ', Label(els), test_dst),
                *comp_block(body),
                Cmd('JMP', Label(end)),
                Cmd('LABEL', Label(els)),
                *comp_block(orelse),
                Cmd('LABEL', Label(end))
            ]
        case ast.Expr(ast.Call(ast.Name('out'), [expr])):
            code, code_dst = comp_expr(expr)
            return code + [Cmd('OUT', None, code_dst)]


def comp_block(block):
    return sum((comp_stmt(stmt) for stmt in block), [])


def comp(src):
    return rewrite_labels(comp_block(ast.parse(src).body))
