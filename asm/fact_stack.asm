    PUSH #5
    ST [n]
    PUSH #1
    ST [r]
@4:
    PUSH #1
    LD [n]
    LT 
    JZ @18
    LD [r]
    LD [n]
    MUL 
    ST [r]
    LD [n]
    PUSH #1
    SUB 
    ST [n]
    JMP @4
@18:
    LD [r]
    OUT 
