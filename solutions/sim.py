import operator
from dataclasses import dataclass, replace


@dataclass(frozen=True)
class Cpu:
    code: list
    mem: dict
    stack: list
    regs: list
    outs: list
    pc: int = 0


@dataclass(frozen=True)
class Cmd:
    op: str
    dst: object = None
    src1: object = None
    src2: object = None


@dataclass(frozen=True)
class Imm:
    val: int


@dataclass(frozen=True)
class Mem:
    addr: int


@dataclass(frozen=True)
class Stack:
    pass


@dataclass(frozen=True)
class Reg:
    n: int


@dataclass(frozen=True)
class Label:
    addr: int


def alu(op, src1, src2):
    return int(getattr(operator, op.lower())(src1, src2))


def read(cpu, src):
    match src:
        case Imm(val):
            return val
        case Mem(addr):
            return cpu.mem[addr]
        case Stack():
            return cpu.stack.pop()
        case Reg(n):
            return cpu.regs[n]


def write(cpu, dst, val):
    match dst:
        case Mem(addr):
            cpu.mem[addr] = val
        case Stack():
            cpu.stack.append(val)
        case Reg(n):
            cpu.regs[n] = val


def step(cpu, cmd):
    pc = cpu.pc + 1
    match cmd:
        case Cmd('LI' | 'MOV' | 'LD' | 'ST' | 'PUSH', dst, src1):
            write(cpu, dst, read(cpu, src1))
        case Cmd('ADD' | 'SUB' | 'MUL' | 'EQ' | 'LT' | 'LE',
                 dst, src1, src2):
            src2 = read(cpu, src2)
            src1 = read(cpu, src1)
            write(cpu, dst, alu(cmd.op, src1, src2))
        case Cmd('JZ', Label(dst), src1):
            if not read(cpu, src1):
                pc = dst
        case Cmd('OUT', _, src1):
            cpu.outs.append(read(cpu, src1))
        case Cmd('JMP', Label(dst)):
            pc = dst
    return replace(cpu, pc=pc)


def sim(code, regs_size=16):
    cpu = Cpu(code, {}, [], [0] * regs_size, [])
    while cpu.pc < len(cpu.code):
        cpu = step(cpu, cpu.code[cpu.pc])
    return cpu
