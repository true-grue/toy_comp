    LI r0, #5
    ST [n], r0
    LI r0, #1
    ST [r], r0
@4:
    LI r0, #1
    LD r1, [n]
    LT r0, r0, r1
    JZ @18, r0
    LD r0, [r]
    LD r1, [n]
    MUL r0, r0, r1
    ST [r], r0
    LD r0, [n]
    LI r1, #1
    SUB r0, r0, r1
    ST [n], r0
    JMP @4
@18:
    LD r0, [r]
    OUT r0
