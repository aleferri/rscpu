
.dw 0
.dw 0
.dw 0
.dw 0

.dw 0
.dw 0
.dw 0
.dw 0

.dw 0
.dw 0
.dw 0
.dw 0

.dw 0
.dw 0
.dw 0
.dw 0

.include "globals.s"

__shadow:   .dw 0xF

.advance 0x0200                         ; in reality 0x100

__boot:     LIT     6
            STA     _arg0
            SHR     _arg0
            LIT     3
            SUB     _arg0
            JZE     .ok
            JMP     __init.hard_err
.ok:
            LIT     __init.print
            STA     _ra
            LIT     0
            ADD     _ioptr
            STA     _arg1
            JMP     __split_bin
            
.include "lib.s"

__init:     LIT     1
			JZE     .hard_err			; one or both of LIT/JZE not working
            STA     __shadow
            LIT     0
            ADD     __shadow
            JZE     .hard_err           ; one or both of STA/ADD not working even in the base case
            LIT     4
            STA     __shadow
            LIT     3
            INC     __shadow
            LIT     5
            SUB     __shadow
            JZE     .selftest
            LIT     0x12
            JMP     .hard_err
            
.selftest:	LIT     3					; require working lit/sta/add/jze/jmp, test the other instructions    
			STA     __shadow
			LIT     15
			ADD     __shadow
			LIT     3
			SUB     __shadow
			JZE     .oksub
			LIT     0x10		; Math error
			JMP     .hard_err
.oksub:		LIT     4
            STA     _ix0
            LIT     0
            AND     _ix0
            JZE     .print
            LIT     0x11
            JMP     .hard_err
.okand:     LIT     0xFF
;.oknor:
;.okinc:
;.okldi:
;.oksti:

.print:		LIT     0                   ; _ix0 = 0xFFF0
            ADD     _ioptr              

.dg0:       STA     _arg1
            LIT     8
            STA     _arg0
            LIT     .dg1
            STA     _ra
            JMP     __split_bin

.dg1:       LIT     46
            STA     _arg0
            LIT     .dg2
            STA     _ra
            JMP     __split_bin
			
.dg2:		LIT     17
            STA     _arg0
            LIT     .wait
            STA     _ra
            JMP     __split_bin
			
.wait:      LIT     0xF
            LIT     0xE
            LIT     0xD
            JZE     .hard_err
            JMP     .wait
            LIT     0xF
            LIT     0xE
            LIT     0xD
			
.hard_err:  LIT     0
            JMP     .hard_err
           