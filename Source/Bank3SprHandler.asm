;-------------------------------------------------------------------------------
;
; qSMW - Bank3SprHandler.asm
;
; Vanilla SMW handles the sprites in bank 3 with an awkward if-else chain, which
; adds quite a bit of processing time to certain sprites, especially those at
; the tail end of the chain. This rewrites the routine to use ExecutePtr instead
; which saves both cycles and rom.
;
; Freed ROM: $03A19C-$03A258 (xBD)
; Taken ROM: none
; Freed RAM: none
; Taken RAM: none
;
;-------------------------------------------------------------------------------

incsrc "Common/Header.asm"
incsrc "Macro/Free.asm"

org $03A118
Bank3SprHandler:
	phb
	phk
	plb
	lda $9E,x
	cmp #$A0
	bcc .HandleLowIds

.CallExecutePtr
	sbc #$A0
	pea .Return-1
	jsl $0086DF|!long

.Pointers
	dw $A259 ; A0 - Bowser
	dw $B163 ; A1 - Bowling ball
	dw $B2A9 ; A2 - Mechakoopa

; Utilize otherwise unused pointer table space (A3-A7)
.HandleLowIds
	cmp #$1B
	bne .HandleOtherLowIds
	jsr $8012

.Return
	plb
	rtl
	db $00

.PointersCntd
	dw $9F38 ; A8 - Blargg
	dw $9890 ; A9 - Reznor
	dw $96F6 ; AA - Fishbone
	dw $9517 ; AB - Rex
	dw $9423 ; AC - Wooden spike
	dw $9423 ; AD - Wooden spike
	dw $9065 ; AE - Fishin' Boo
	dw $0000 ; AF
	dw $8F7A ; B0 - Boo stream
	dw $8492 ; B1 - Snake block
	dw $9214 ; B2 - Falling spike
	dw $8EEC ; B3 - Statue fireball
	dw $0000 ; B4
	dw $0000 ; B5
	dw $8F75 ; B6 - Reflecting fireball
	dw $8C2F ; B7 - Carrot top lift
	dw $8C2F ; B8 - Carrot top lift
	dw $8D6F ; B9 - Info box
	dw $8DBB ; BA - Timed lift
	dw $8E79 ; BB - Grey castle block
	dw $8A3C ; BC - Bowser statue
	dw $8958 ; BD - Sliding koopa
	dw $88A3 ; BE - Swooper
	dw $8770 ; BF - Mega mole
	dw $86FF ; C0 - Lava platform
	dw $85F6 ; C1 - Three flying turn blocks
	dw $84CA ; C2 - Blurp
	dw $852F ; C3 - Porcupuffer
	dw $8454 ; C4 - Falling grey platform
	dw $8087 ; C5 - Big Boo boss
	dw $C4DC ; C6 - Spotlight
	dw $C30F ; C7 - Invisible mushroom
	dw $C1F5 ; C8 - Light switch

.HandleOtherLowIds
	; Ninji
	cmp #$51
	bne +
	jsr $C34C
	plb
	rtl

+	; Fireworks
	cmp #$7A
	bne +
	jsr $C816
	plb
	rtl

+	; Peach
	jsr $AC97
	plb
	rtl
warnpc $03A193

%Free($03A193, 198)
