    PUSH #0
    PUSH #9
    SUB 
    ST [y]
@4:
    LD [y]
    PUSH #9
    LE 
    JZ @201
    PUSH #0
    PUSH #24
    SUB 
    ST [x]
@13:
    LD [x]
    PUSH #16
    LE 
    JZ @193
    PUSH #0
    ST [zr]
    PUSH #0
    ST [zi]
    PUSH #0
    ST [i]
    PUSH #0
    ST [escaped]
@26:
    LD [i]
    PUSH #16
    LT 
    JZ @157
    PUSH #256
    LD [zr]
    LD [zr]
    MUL 
    LD [zi]
    LD [zi]
    MUL 
    ADD 
    LT 
    JZ @46
    LD [i]
    ST [escaped]
    PUSH #16
    ST [i]
    JMP @155
@46:
    LD [zr]
    LD [zr]
    MUL 
    LD [zi]
    LD [zi]
    MUL 
    SUB 
    ST [value]
    PUSH #0
    ST [q]
    PUSH #0
    LD [value]
    LE 
    JZ @77
@61:
    PUSH #8
    LD [value]
    LE 
    JZ @75
    LD [value]
    PUSH #8
    SUB 
    ST [value]
    LD [q]
    PUSH #1
    ADD 
    ST [q]
    JMP @61
@75:
    JMP @95
@77:
@78:
    LD [value]
    PUSH #0
    PUSH #8
    SUB 
    LE 
    JZ @94
    LD [value]
    PUSH #8
    ADD 
    ST [value]
    LD [q]
    PUSH #1
    SUB 
    ST [q]
    JMP @78
@94:
@95:
    PUSH #2
    LD [zr]
    MUL 
    LD [zi]
    MUL 
    ST [value]
    LD [q]
    LD [x]
    ADD 
    ST [zr]
    PUSH #0
    ST [q]
    PUSH #0
    LD [value]
    LE 
    JZ @128
@112:
    PUSH #8
    LD [value]
    LE 
    JZ @126
    LD [value]
    PUSH #8
    SUB 
    ST [value]
    LD [q]
    PUSH #1
    ADD 
    ST [q]
    JMP @112
@126:
    JMP @146
@128:
@129:
    LD [value]
    PUSH #0
    PUSH #8
    SUB 
    LE 
    JZ @145
    LD [value]
    PUSH #8
    ADD 
    ST [value]
    LD [q]
    PUSH #1
    SUB 
    ST [q]
    JMP @129
@145:
@146:
    LD [q]
    LD [y]
    ADD 
    ST [zi]
    LD [i]
    PUSH #1
    ADD 
    ST [i]
@155:
    JMP @26
@157:
    PUSH #32
    PUSH #0
    LD [escaped]
    LT 
    PUSH #14
    PUSH #3
    LD [escaped]
    LE 
    PUSH #12
    PUSH #6
    LD [escaped]
    LE 
    PUSH #0
    PUSH #16
    SUB 
    PUSH #10
    LD [escaped]
    LE 
    PUSH #0
    PUSH #7
    SUB 
    MUL 
    ADD 
    MUL 
    ADD 
    MUL 
    ADD 
    MUL 
    ADD 
    OUT 
    LD [x]
    PUSH #1
    ADD 
    ST [x]
    JMP @13
@193:
    PUSH #10
    OUT 
    LD [y]
    PUSH #1
    ADD 
    ST [y]
    JMP @4
@201:
