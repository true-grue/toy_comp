import ast
from itertools import count
from dataclasses import replace
from sim import Cmd, Imm, Mem, Stack, Reg, Label

OPS = {ast.Add: 'ADD', ast.Sub: 'SUB', ast.Mult: 'MUL',
       ast.Eq: 'EQ', ast.Lt: 'LT', ast.LtE: 'LE'}

Temp = count()


def rewrite_labels(code):
    labels = {cmd.dst: Label(i) for i, cmd in enumerate(code)
              if cmd.op == 'LABEL'}
    return [replace(cmd, dst=labels.get(cmd.dst, cmd.dst))
            for cmd in code]
