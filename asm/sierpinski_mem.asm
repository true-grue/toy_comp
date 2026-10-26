    LI [0], #20
    MOV [size], [0]
    LI [1], #0
    MOV [row], [1]
@4:
    LT [4], [row], [size]
    JZ @80, [4]
    LI [5], #0
    MOV [col], [5]
@9:
    LE [8], [col], [row]
    JZ @73, [8]
    MOV [a], [col]
    SUB [9], [row], [col]
    MOV [b], [9]
    LI [10], #0
    MOV [common], [10]
@17:
    LI [14], #0
    LT [13], [14], [a]
    JZ @63, [13]
    MOV [ra], [a]
    LI [15], #0
    MOV [qa], [15]
@24:
    LI [19], #2
    LE [18], [19], [ra]
    JZ @35, [18]
    LI [21], #2
    SUB [20], [ra], [21]
    MOV [ra], [20]
    LI [23], #1
    ADD [22], [qa], [23]
    MOV [qa], [22]
    JMP @24
@35:
    MOV [rb], [b]
    LI [24], #0
    MOV [qb], [24]
@39:
    LI [28], #2
    LE [27], [28], [rb]
    JZ @50, [27]
    LI [30], #2
    SUB [29], [rb], [30]
    MOV [rb], [29]
    LI [32], #1
    ADD [31], [qb], [32]
    MOV [qb], [31]
    JMP @39
@50:
    LI [34], #0
    LI [38], #1
    EQ [37], [ra], [38]
    LI [40], #1
    EQ [39], [rb], [40]
    MUL [36], [37], [39]
    ADD [35], [common], [36]
    LT [33], [34], [35]
    MOV [common], [33]
    MOV [a], [qa]
    MOV [b], [qb]
    JMP @17
@63:
    LI [42], #35
    LI [44], #3
    MUL [43], [common], [44]
    SUB [41], [42], [43]
    OUT [41]
    LI [46], #1
    ADD [45], [col], [46]
    MOV [col], [45]
    JMP @9
@73:
    LI [47], #10
    OUT [47]
    LI [49], #1
    ADD [48], [row], [49]
    MOV [row], [48]
    JMP @4
@80:
