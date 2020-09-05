;-------------------------------------------------------------------------------
;
; qSMW - HandleSpriteKicked.asm
;
; Freed ROM: none
; Taken ROM: none
; Freed RAM: none
; Taken RAM: none
;
;-------------------------------------------------------------------------------

incsrc "Macro/Skip.asm"

; remove useless call
%Skip($01996E, 3)
