    LI [0], #5
    MOV [n], [0]
    LI [1], #1
    MOV [r], [1]
@4:
    LI [5], #1
    LT [4], [5], [n]
    JZ @14, [4]
    MUL [6], [r], [n]
    MOV [r], [6]
    LI [8], #1
    SUB [7], [n], [8]
    MOV [n], [7]
    JMP @4
@14:
    OUT [r]
