;-------------------------------------------------------------------------------
;
; qSMW - MarioFireball.asm
;
; Freed ROM: $02A040 (xE)
; Taken ROM: none
; Freed RAM: none
; Taken RAM: none
;
;-------------------------------------------------------------------------------

incsrc "Macro/Move.asm"
incsrc "Macro/Remap.asm"
incsrc "Macro/Repoint.asm"

; Remove redundant offscreen check
%RemapByte($029FB2, $79, $70)
%Move($029FB3, $029FC2, 141)
%RepointWord($02A0EA, $A045, $A036)
