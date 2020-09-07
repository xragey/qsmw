;-------------------------------------------------------------------------------
;
; qSMW - WaterSlopeCheck.asm
;
; Rewrites part of the sprite object interaction routine, specifically the check
; to see if a tile is a sloped water tile, to use a lookup table instead of a
; sequential check.
;
; Code provided by Alcaro.
;
; Freed ROM: none
; Taken ROM: 146 bytes
; Freed RAM: none
; Taken RAM: none
;
;-------------------------------------------------------------------------------

incsrc "Common/Header.asm"

assert read2($03A1C6) == $FFFF, "Area was not reclaimed (Bnk3CallSprMain.asm)"

org $00F04D
	phx
	tax
	lda.l (SlopedWaterTiles-$6E)|!long,x
	lsr
	plx
	rtl
warnpc $00F05C

org $03A1C6
SlopedWaterTiles:
	db                                                         $00,$00
	db $00,$01,$01,$00,$00,$00,$01,$01,$00,$00,$00,$01,$01,$00,$00,$00
	db $00,$01,$00,$00,$00,$00,$01,$00,$00,$00,$01,$01,$00,$00,$00,$01
	db $01,$00,$00,$00,$01,$01,$00,$00,$00,$01,$01,$00,$00,$00,$01,$01
	db $00,$00,$00,$01,$01,$00,$00,$00,$01,$01,$00,$00,$00,$01,$01,$00
	db $00,$00,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
warnpc $03A258
