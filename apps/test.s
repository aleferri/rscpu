
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

__boot:     LIT     0
            LIT     4
            JMP     __init
            LIT     0

__init:     LIT     1
			JZE     .hard_err			; one or both of LIT/JZE not working
            STA     __shadow
            LIT     0
            ADD     __shadow
            JZE     .hard_err           ; one or both of STA/ADD not working even in the base case
            
.selftest:	LIT     3					; require working lit/sta/add/jze/jmp, test the other instructions    
			STA     __shadow
			LIT     7
			ADD     __shadow
			LIT     0xA
			SUB     __shadow
			JZE     .okadd
			LIT     0x10		; ADD error
			JMP     .hard_err
.okadd:		LIT     3
			STA     __shadow
			SUB     __shadow
			JZE     .oksub
			LIT     0x11        ; SUB error
.oksub:     AND     _ix0
;.okand:
;.oknor:
;.okinc:
;.okldi:
;.oksti:

.print:		LIT     0                   ; __ix0 = 0xFFF0
            ADD     _ioptr
            STA     _ix0
			
.hello:		STA     _ix1               ; __ix1 = 0xFFF0
            LIT     0
            
.d0:		STI     _ix1
			INC     _ix1
.d1:        STI     _ix1
			INC     _ix1
.d2:		STI     _ix1
			INC     _ix1
.d3:		STI     _ix1
			INC     _ix1
			
.wait:      LIT     0
            JZE     .wait
			
.hard_err:  LIT     0
            JMP     .hard_err