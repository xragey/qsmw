;-------------------------------------------------------------------------------
;
; qSMW - InvertAccumulator.asm
;
; Freed ROM: $01804A (x4); $01CCEC (x4)
; Taken ROM: none
; Freed RAM: none
; Taken RAM: none
;
;-------------------------------------------------------------------------------

incsrc "Macro/Free.asm"

; remove subroutines
%Free($01804A, $01804D)
%Free($01CCEC, $01CCEF)

; inline the routines
org $0197DA : eor #$FF : inc a
org $0197E1 : eor #$FF : inc a
org $01C45C : eor #$FF : inc a
