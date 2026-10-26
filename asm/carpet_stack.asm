    PUSH #27
    ST [size]
    PUSH #0
    ST [y]
@4:
    LD [y]
    LD [size]
    LT 
    JZ @110
    PUSH #0
    ST [x]
@11:
    LD [x]
    LD [size]
    LT 
    JZ @102
    LD [x]
    ST [xx]
    LD [y]
    ST [yy]
    PUSH #0
    ST [hole]
    PUSH #0
    ST [digit]
@24:
    LD [digit]
    PUSH #3
    LT 
    JZ @90
    LD [xx]
    ST [rx]
    PUSH #0
    ST [qx]
@33:
    PUSH #3
    LD [rx]
    LE 
    JZ @47
    LD [rx]
    PUSH #3
    SUB 
    ST [rx]
    LD [qx]
    PUSH #1
    ADD 
    ST [qx]
    JMP @33
@47:
    LD [yy]
    ST [ry]
    PUSH #0
    ST [qy]
@52:
    PUSH #3
    LD [ry]
    LE 
    JZ @66
    LD [ry]
    PUSH #3
    SUB 
    ST [ry]
    LD [qy]
    PUSH #1
    ADD 
    ST [qy]
    JMP @52
@66:
    LD [hole]
    PUSH #1
    LD [hole]
    SUB 
    LD [rx]
    PUSH #1
    EQ 
    MUL 
    LD [ry]
    PUSH #1
    EQ 
    MUL 
    ADD 
    ST [hole]
    LD [qx]
    ST [xx]
    LD [qy]
    ST [yy]
    LD [digit]
    PUSH #1
    ADD 
    ST [digit]
    JMP @24
@90:
    PUSH #35
    PUSH #3
    LD [hole]
    MUL 
    SUB 
    OUT 
    LD [x]
    PUSH #1
    ADD 
    ST [x]
    JMP @11
@102:
    PUSH #10
    OUT 
    LD [y]
    PUSH #1
    ADD 
    ST [y]
    JMP @4
@110:
