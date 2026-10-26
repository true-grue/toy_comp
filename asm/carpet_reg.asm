    LI r0, #27
    ST [size], r0
    LI r0, #0
    ST [y], r0
@4:
    LD r0, [y]
    LD r1, [size]
    LT r0, r0, r1
    JZ @110, r0
    LI r0, #0
    ST [x], r0
@11:
    LD r0, [x]
    LD r1, [size]
    LT r0, r0, r1
    JZ @102, r0
    LD r0, [x]
    ST [xx], r0
    LD r0, [y]
    ST [yy], r0
    LI r0, #0
    ST [hole], r0
    LI r0, #0
    ST [digit], r0
@24:
    LD r0, [digit]
    LI r1, #3
    LT r0, r0, r1
    JZ @90, r0
    LD r0, [xx]
    ST [rx], r0
    LI r0, #0
    ST [qx], r0
@33:
    LI r0, #3
    LD r1, [rx]
    LE r0, r0, r1
    JZ @47, r0
    LD r0, [rx]
    LI r1, #3
    SUB r0, r0, r1
    ST [rx], r0
    LD r0, [qx]
    LI r1, #1
    ADD r0, r0, r1
    ST [qx], r0
    JMP @33
@47:
    LD r0, [yy]
    ST [ry], r0
    LI r0, #0
    ST [qy], r0
@52:
    LI r0, #3
    LD r1, [ry]
    LE r0, r0, r1
    JZ @66, r0
    LD r0, [ry]
    LI r1, #3
    SUB r0, r0, r1
    ST [ry], r0
    LD r0, [qy]
    LI r1, #1
    ADD r0, r0, r1
    ST [qy], r0
    JMP @52
@66:
    LD r0, [hole]
    LI r1, #1
    LD r2, [hole]
    SUB r1, r1, r2
    LD r2, [rx]
    LI r3, #1
    EQ r2, r2, r3
    MUL r1, r1, r2
    LD r2, [ry]
    LI r3, #1
    EQ r2, r2, r3
    MUL r1, r1, r2
    ADD r0, r0, r1
    ST [hole], r0
    LD r0, [qx]
    ST [xx], r0
    LD r0, [qy]
    ST [yy], r0
    LD r0, [digit]
    LI r1, #1
    ADD r0, r0, r1
    ST [digit], r0
    JMP @24
@90:
    LI r0, #35
    LI r1, #3
    LD r2, [hole]
    MUL r1, r1, r2
    SUB r0, r0, r1
    OUT r0
    LD r0, [x]
    LI r1, #1
    ADD r0, r0, r1
    ST [x], r0
    JMP @11
@102:
    LI r0, #10
    OUT r0
    LD r0, [y]
    LI r1, #1
    ADD r0, r0, r1
    ST [y], r0
    JMP @4
@110:
