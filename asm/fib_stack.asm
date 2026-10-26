    PUSH #10
    ST [n]
    PUSH #0
    ST [a]
    PUSH #1
    ST [b]
    PUSH #0
    ST [i]
@8:
    LD [i]
    LD [n]
    LT 
    JZ @26
    LD [a]
    LD [b]
    ADD 
    ST [b]
    LD [b]
    LD [a]
    SUB 
    ST [a]
    LD [i]
    PUSH #1
    ADD 
    ST [i]
    JMP @8
@26:
    LD [a]
    OUT 
