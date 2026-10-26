    LI r0, #50
    ST [limit], r0
    LI r0, #2
    ST [n], r0
@4:
    LD r0, [n]
    LD r1, [limit]
    LE r0, r0, r1
    JZ @57, r0
    LI r0, #2
    ST [d], r0
    LI r0, #1
    ST [prime], r0
@13:
    LD r0, [d]
    LD r1, [n]
    LT r0, r0, r1
    JZ @42, r0
    LD r0, [n]
    ST [rest], r0
@20:
    LD r0, [d]
    LD r1, [rest]
    LE r0, r0, r1
    JZ @30, r0
    LD r0, [rest]
    LD r1, [d]
    SUB r0, r0, r1
    ST [rest], r0
    JMP @20
@30:
    LD r0, [prime]
    LI r1, #0
    LD r2, [rest]
    LT r1, r1, r2
    MUL r0, r0, r1
    ST [prime], r0
    LD r0, [d]
    LI r1, #1
    ADD r0, r0, r1
    ST [d], r0
    JMP @13
@42:
    LD r0, [prime]
    LI r1, #1
    EQ r0, r0, r1
    JZ @50, r0
    LD r0, [n]
    OUT r0
    JMP @51
@50:
@51:
    LD r0, [n]
    LI r1, #1
    ADD r0, r0, r1
    ST [n], r0
    JMP @4
@57:
