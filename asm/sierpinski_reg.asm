    LI r0, #20
    ST [size], r0
    LI r0, #0
    ST [row], r0
@4:
    LD r0, [row]
    LD r1, [size]
    LT r0, r0, r1
    JZ @104, r0
    LI r0, #0
    ST [col], r0
@11:
    LD r0, [col]
    LD r1, [row]
    LE r0, r0, r1
    JZ @96, r0
    LD r0, [col]
    ST [a], r0
    LD r0, [row]
    LD r1, [col]
    SUB r0, r0, r1
    ST [b], r0
    LI r0, #0
    ST [common], r0
@24:
    LI r0, #0
    LD r1, [a]
    LT r0, r0, r1
    JZ @84, r0
    LD r0, [a]
    ST [ra], r0
    LI r0, #0
    ST [qa], r0
@33:
    LI r0, #2
    LD r1, [ra]
    LE r0, r0, r1
    JZ @47, r0
    LD r0, [ra]
    LI r1, #2
    SUB r0, r0, r1
    ST [ra], r0
    LD r0, [qa]
    LI r1, #1
    ADD r0, r0, r1
    ST [qa], r0
    JMP @33
@47:
    LD r0, [b]
    ST [rb], r0
    LI r0, #0
    ST [qb], r0
@52:
    LI r0, #2
    LD r1, [rb]
    LE r0, r0, r1
    JZ @66, r0
    LD r0, [rb]
    LI r1, #2
    SUB r0, r0, r1
    ST [rb], r0
    LD r0, [qb]
    LI r1, #1
    ADD r0, r0, r1
    ST [qb], r0
    JMP @52
@66:
    LI r0, #0
    LD r1, [common]
    LD r2, [ra]
    LI r3, #1
    EQ r2, r2, r3
    LD r3, [rb]
    LI r4, #1
    EQ r3, r3, r4
    MUL r2, r2, r3
    ADD r1, r1, r2
    LT r0, r0, r1
    ST [common], r0
    LD r0, [qa]
    ST [a], r0
    LD r0, [qb]
    ST [b], r0
    JMP @24
@84:
    LI r0, #35
    LD r1, [common]
    LI r2, #3
    MUL r1, r1, r2
    SUB r0, r0, r1
    OUT r0
    LD r0, [col]
    LI r1, #1
    ADD r0, r0, r1
    ST [col], r0
    JMP @11
@96:
    LI r0, #10
    OUT r0
    LD r0, [row]
    LI r1, #1
    ADD r0, r0, r1
    ST [row], r0
    JMP @4
@104:
