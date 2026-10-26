    LI r0, #10
    ST [n], r0
    LI r0, #0
    ST [a], r0
    LI r0, #1
    ST [b], r0
    LI r0, #0
    ST [i], r0
@8:
    LD r0, [i]
    LD r1, [n]
    LT r0, r0, r1
    JZ @26, r0
    LD r0, [a]
    LD r1, [b]
    ADD r0, r0, r1
    ST [b], r0
    LD r0, [b]
    LD r1, [a]
    SUB r0, r0, r1
    ST [a], r0
    LD r0, [i]
    LI r1, #1
    ADD r0, r0, r1
    ST [i], r0
    JMP @8
@26:
    LD r0, [a]
    OUT r0
