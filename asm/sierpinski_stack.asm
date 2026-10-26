    PUSH #20
    ST [size]
    PUSH #0
    ST [row]
@4:
    LD [row]
    LD [size]
    LT 
    JZ @104
    PUSH #0
    ST [col]
@11:
    LD [col]
    LD [row]
    LE 
    JZ @96
    LD [col]
    ST [a]
    LD [row]
    LD [col]
    SUB 
    ST [b]
    PUSH #0
    ST [common]
@24:
    PUSH #0
    LD [a]
    LT 
    JZ @84
    LD [a]
    ST [ra]
    PUSH #0
    ST [qa]
@33:
    PUSH #2
    LD [ra]
    LE 
    JZ @47
    LD [ra]
    PUSH #2
    SUB 
    ST [ra]
    LD [qa]
    PUSH #1
    ADD 
    ST [qa]
    JMP @33
@47:
    LD [b]
    ST [rb]
    PUSH #0
    ST [qb]
@52:
    PUSH #2
    LD [rb]
    LE 
    JZ @66
    LD [rb]
    PUSH #2
    SUB 
    ST [rb]
    LD [qb]
    PUSH #1
    ADD 
    ST [qb]
    JMP @52
@66:
    PUSH #0
    LD [common]
    LD [ra]
    PUSH #1
    EQ 
    LD [rb]
    PUSH #1
    EQ 
    MUL 
    ADD 
    LT 
    ST [common]
    LD [qa]
    ST [a]
    LD [qb]
    ST [b]
    JMP @24
@84:
    PUSH #35
    LD [common]
    PUSH #3
    MUL 
    SUB 
    OUT 
    LD [col]
    PUSH #1
    ADD 
    ST [col]
    JMP @11
@96:
    PUSH #10
    OUT 
    LD [row]
    PUSH #1
    ADD 
    ST [row]
    JMP @4
@104:
