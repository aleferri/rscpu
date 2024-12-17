
__return:       LIT     0
                ADD     _const_jmp
                ADD     _ra
                STA     _trampoline
                JMP     _trampoline

; memcopy: src, dest, n
__memcopy:      LIT     0
                ADD     _arg2
                JZE     __return
.loop:          LDI     _arg0
                STI     _arg1
                INC     _arg0
                INC     _arg1
                LIT     0
                ADD     _arg2
                SUB     _const_1
                STA     _arg2
                JZE     __return
                JMP     .loop
                
                
; memset: v, dest, n
__memset:       LIT     0
                ADD     _arg2
                JZE     __return
.loop:          LIT     0
                ADD     _arg0
                STI     _arg1
                INC     _arg1
                LIT     0
                ADD     _arg2
                SUB     _const_1
                STA     _arg2
                JZE     __return
                JMP     .loop
                
                
__split_bin:    LIT     0x7F
                AND     _arg0
                STA     _arg0
                LIT     _pow2_units
                STA     _ix0
                LIT     _pow2_tens
                STA     _ix1
                LIT     0
                STA     _g0                 ; units
                STA     _g1                 ; tens
.loop:          LIT     1
                AND     _arg0
                JZE     .skip
                LDI     _ix0
                ADD     _g0
                STA     _g0
                LDI     _ix1
                ADD     _g1
                STA     _g1
.skip:          INC    _ix0
                INC    _ix1
                SHR    _arg0
                LIT    0
                ADD    _arg0
                JZE    .adjust
                JMP    .loop
.adjust:        LIT    10
                STA    _g3
                LIT    0
                ADD    _g0
                AND    _const_jmp
                JZE    .skip2
                JMP    .print
.skip2:         LIT    0
                ADD    _g0
                SUB    _g3
                STA    _g0
                INC    _g1
.print:         LIT    0
                ADD    _g1
                STI    _arg1
                INC    _arg1
                LIT    0
                ADD    _g0
                STI    _arg1
                INC    _arg1
                JMP    __return
                