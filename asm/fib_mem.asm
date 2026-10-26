    LI [0], #10
    MOV [n], [0]
    LI [1], #0
    MOV [a], [1]
    LI [2], #1
    MOV [b], [2]
    LI [3], #0
    MOV [i], [3]
@8:
    LT [6], [i], [n]
    JZ @19, [6]
    ADD [7], [a], [b]
    MOV [b], [7]
    SUB [8], [b], [a]
    MOV [a], [8]
    LI [10], #1
    ADD [9], [i], [10]
    MOV [i], [9]
    JMP @8
@19:
    OUT [a]
