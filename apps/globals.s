

_ix0:   .dw 0
_ix1:   .dw 0
_ix2:   .dw 0
_ix3:   .dw 0

_arg0:  .dw 0
_arg1:  .dw 0
_arg2:  .dw 0
_arg3:  .dw 0

_g0:    .dw 0
_g1:    .dw 0
_g2:    .dw 0
_g3:    .dw 0

_ra:    .dw 0
_sp:    .dw 0


_const_1: .dw 1
_const_2: .dw 2
_const_4: .dw 4
_const_jmp: .dw 0x8000

_protected:     JMP __terror
                JMP __terror
_trampoline:    .dw 0
                JMP __terror
                JMP __terror
                
_ioptr:     .dw 0xFFF0


__terror:   LDI 0
            JMP __terror