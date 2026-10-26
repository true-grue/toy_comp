    LI r0, #0
    LI r1, #9
    SUB r0, r0, r1
    ST [y], r0
@4:
    LD r0, [y]
    LI r1, #9
    LE r0, r0, r1
    JZ @201, r0
    LI r0, #0
    LI r1, #24
    SUB r0, r0, r1
    ST [x], r0
@13:
    LD r0, [x]
    LI r1, #16
    LE r0, r0, r1
    JZ @193, r0
    LI r0, #0
    ST [zr], r0
    LI r0, #0
    ST [zi], r0
    LI r0, #0
    ST [i], r0
    LI r0, #0
    ST [escaped], r0
@26:
    LD r0, [i]
    LI r1, #16
    LT r0, r0, r1
    JZ @157, r0
    LI r0, #256
    LD r1, [zr]
    LD r2, [zr]
    MUL r1, r1, r2
    LD r2, [zi]
    LD r3, [zi]
    MUL r2, r2, r3
    ADD r1, r1, r2
    LT r0, r0, r1
    JZ @46, r0
    LD r0, [i]
    ST [escaped], r0
    LI r0, #16
    ST [i], r0
    JMP @155
@46:
    LD r0, [zr]
    LD r1, [zr]
    MUL r0, r0, r1
    LD r1, [zi]
    LD r2, [zi]
    MUL r1, r1, r2
    SUB r0, r0, r1
    ST [value], r0
    LI r0, #0
    ST [q], r0
    LI r0, #0
    LD r1, [value]
    LE r0, r0, r1
    JZ @77, r0
@61:
    LI r0, #8
    LD r1, [value]
    LE r0, r0, r1
    JZ @75, r0
    LD r0, [value]
    LI r1, #8
    SUB r0, r0, r1
    ST [value], r0
    LD r0, [q]
    LI r1, #1
    ADD r0, r0, r1
    ST [q], r0
    JMP @61
@75:
    JMP @95
@77:
@78:
    LD r0, [value]
    LI r1, #0
    LI r2, #8
    SUB r1, r1, r2
    LE r0, r0, r1
    JZ @94, r0
    LD r0, [value]
    LI r1, #8
    ADD r0, r0, r1
    ST [value], r0
    LD r0, [q]
    LI r1, #1
    SUB r0, r0, r1
    ST [q], r0
    JMP @78
@94:
@95:
    LI r0, #2
    LD r1, [zr]
    MUL r0, r0, r1
    LD r1, [zi]
    MUL r0, r0, r1
    ST [value], r0
    LD r0, [q]
    LD r1, [x]
    ADD r0, r0, r1
    ST [zr], r0
    LI r0, #0
    ST [q], r0
    LI r0, #0
    LD r1, [value]
    LE r0, r0, r1
    JZ @128, r0
@112:
    LI r0, #8
    LD r1, [value]
    LE r0, r0, r1
    JZ @126, r0
    LD r0, [value]
    LI r1, #8
    SUB r0, r0, r1
    ST [value], r0
    LD r0, [q]
    LI r1, #1
    ADD r0, r0, r1
    ST [q], r0
    JMP @112
@126:
    JMP @146
@128:
@129:
    LD r0, [value]
    LI r1, #0
    LI r2, #8
    SUB r1, r1, r2
    LE r0, r0, r1
    JZ @145, r0
    LD r0, [value]
    LI r1, #8
    ADD r0, r0, r1
    ST [value], r0
    LD r0, [q]
    LI r1, #1
    SUB r0, r0, r1
    ST [q], r0
    JMP @129
@145:
@146:
    LD r0, [q]
    LD r1, [y]
    ADD r0, r0, r1
    ST [zi], r0
    LD r0, [i]
    LI r1, #1
    ADD r0, r0, r1
    ST [i], r0
@155:
    JMP @26
@157:
    LI r0, #32
    LI r1, #0
    LD r2, [escaped]
    LT r1, r1, r2
    LI r2, #14
    LI r3, #3
    LD r4, [escaped]
    LE r3, r3, r4
    LI r4, #12
    LI r5, #6
    LD r6, [escaped]
    LE r5, r5, r6
    LI r6, #0
    LI r7, #16
    SUB r6, r6, r7
    LI r7, #10
    LD r8, [escaped]
    LE r7, r7, r8
    LI r8, #0
    LI r9, #7
    SUB r8, r8, r9
    MUL r7, r7, r8
    ADD r6, r6, r7
    MUL r5, r5, r6
    ADD r4, r4, r5
    MUL r3, r3, r4
    ADD r2, r2, r3
    MUL r1, r1, r2
    ADD r0, r0, r1
    OUT r0
    LD r0, [x]
    LI r1, #1
    ADD r0, r0, r1
    ST [x], r0
    JMP @13
@193:
    LI r0, #10
    OUT r0
    LD r0, [y]
    LI r1, #1
    ADD r0, r0, r1
    ST [y], r0
    JMP @4
@201:
