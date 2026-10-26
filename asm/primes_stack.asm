    PUSH #50
    ST [limit]
    PUSH #2
    ST [n]
@4:
    LD [n]
    LD [limit]
    LE 
    JZ @57
    PUSH #2
    ST [d]
    PUSH #1
    ST [prime]
@13:
    LD [d]
    LD [n]
    LT 
    JZ @42
    LD [n]
    ST [rest]
@20:
    LD [d]
    LD [rest]
    LE 
    JZ @30
    LD [rest]
    LD [d]
    SUB 
    ST [rest]
    JMP @20
@30:
    LD [prime]
    PUSH #0
    LD [rest]
    LT 
    MUL 
    ST [prime]
    LD [d]
    PUSH #1
    ADD 
    ST [d]
    JMP @13
@42:
    LD [prime]
    PUSH #1
    EQ 
    JZ @50
    LD [n]
    OUT 
    JMP @51
@50:
@51:
    LD [n]
    PUSH #1
    ADD 
    ST [n]
    JMP @4
@57:
