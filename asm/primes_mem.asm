    LI [0], #50
    MOV [limit], [0]
    LI [1], #2
    MOV [n], [1]
@4:
    LE [4], [n], [limit]
    JZ @42, [4]
    LI [5], #2
    MOV [d], [5]
    LI [6], #1
    MOV [prime], [6]
@11:
    LT [9], [d], [n]
    JZ @30, [9]
    MOV [rest], [n]
@15:
    LE [12], [d], [rest]
    JZ @21, [12]
    SUB [13], [rest], [d]
    MOV [rest], [13]
    JMP @15
@21:
    LI [16], #0
    LT [15], [16], [rest]
    MUL [14], [prime], [15]
    MOV [prime], [14]
    LI [18], #1
    ADD [17], [d], [18]
    MOV [d], [17]
    JMP @11
@30:
    LI [22], #1
    EQ [21], [prime], [22]
    JZ @36, [21]
    OUT [n]
    JMP @37
@36:
@37:
    LI [24], #1
    ADD [23], [n], [24]
    MOV [n], [23]
    JMP @4
@42:
