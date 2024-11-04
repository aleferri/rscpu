
__init:     JMP     __reset
			LIT     0
			JZE     .hard_error         ; jmp didn't work

__ix0:      .dh 0
__ix1:      .dh 0
__ix2:      .dh 0
__ix3:      .dh 0
__sp:       .dh 0
__ra:       .dh 0
__shadow:   .dh 0

.org        0x400

__reset:    LIT     1
			JZE     .hard_error			; one or both of LIT/JZE not working
            STA     __shadow
            LIT     0
            ADD     __shadow
            JZE     .hard_error         ; one or both of STA/ADD not working even in the base case
            
.selftest:	LIT     3					; require working lit/sta/add/jze/jmp, test the other instructions    
			STA     __shadow
			LIT     7
			ADD     __shadow
			LIT     0xA
			SUB     __shadow
			JZE     .okadd
			LIT     0x10		; ADD error
			JMP     .error
.okadd:		LIT     3
			STA     __shadow
			SUB     __shadow
			JZE     .oksub
			LIT     0x11        ; SUB error
.oksub:
.okand:
.oknor:
.okinc:
.okldi:
.oksti:

.print:		LIT     0x0FFF
            STA     __ix0
.lsl_0:     ADD     __ix0
            STA     __ix0
.lsl_1:     ADD     __ix0
            STA     __ix0
.lsl_2:     ADD     __ix0
            STA     __ix0
.lsl_3:     ADD     __ix0
            STA     __ix0               ; __ix0 = 0xFFF0
			
.hello:		STA     __ix1               ; __ix1 = 0xFFF0
            LIT     0x0
            
.d0:		STI     __ix1
			INC     __ix1
.d1:        STI     __ix1
			INC     __ix1
.d2:		STI     __ix1
			INC     __ix1
.d3:		STI     __ix1
			INC     __ix1
			
.wait:      LIT     0x0
            JZE     .wait
			
.hard_error: