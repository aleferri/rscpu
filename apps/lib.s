
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