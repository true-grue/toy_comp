    LI [0], #27
    MOV [size], [0]
    LI [1], #0
    MOV [y], [1]
@4:
    LT [4], [y], [size]
    JZ @85, [4]
    LI [5], #0
    MOV [x], [5]
@9:
    LT [8], [x], [size]
    JZ @78, [8]
    MOV [xx], [x]
    MOV [yy], [y]
    LI [9], #0
    MOV [hole], [9]
    LI [10], #0
    MOV [digit], [10]
@18:
    LI [14], #3
    LT [13], [digit], [14]
    JZ @68, [13]
    MOV [rx], [xx]
    LI [15], #0
    MOV [qx], [15]
@25:
    LI [19], #3
    LE [18], [19], [rx]
    JZ @36, [18]
    LI [21], #3
    SUB [20], [rx], [21]
    MOV [rx], [20]
    LI [23], #1
    ADD [22], [qx], [23]
    MOV [qx], [22]
    JMP @25
@36:
    MOV [ry], [yy]
    LI [24], #0
    MOV [qy], [24]
@40:
    LI [28], #3
    LE [27], [28], [ry]
    JZ @51, [27]
    LI [30], #3
    SUB [29], [ry], [30]
    MOV [ry], [29]
    LI [32], #1
    ADD [31], [qy], [32]
    MOV [qy], [31]
    JMP @40
@51:
    LI [37], #1
    SUB [36], [37], [hole]
    LI [39], #1
    EQ [38], [rx], [39]
    MUL [35], [36], [38]
    LI [41], #1
    EQ [40], [ry], [41]
    MUL [34], [35], [40]
    ADD [33], [hole], [34]
    MOV [hole], [33]
    MOV [xx], [qx]
    MOV [yy], [qy]
    LI [43], #1
    ADD [42], [digit], [43]
    MOV [digit], [42]
    JMP @18
@68:
    LI [45], #35
    LI [47], #3
    MUL [46], [47], [hole]
    SUB [44], [45], [46]
    OUT [44]
    LI [49], #1
    ADD [48], [x], [49]
    MOV [x], [48]
    JMP @9
@78:
    LI [50], #10
    OUT [50]
    LI [52], #1
    ADD [51], [y], [52]
    MOV [y], [51]
    JMP @4
@85:
