;-------------------------------------------------------------------------------
;
; qSMW - Bnk3CallSprMain.asm
;
; Vanilla SMW handles the sprites in bank 3 with an awkward if-else chain, which
; adds quite a bit of processing time to certain sprites, especially those at
; the tail end of the chain. This rewrites the routine to use a jump table for
; most of these sprites, saving both cycles and bytes in rom.
;
; Freed ROM: $03A19A (191 bytes)
; Taken ROM: none
; Freed RAM: none
; Taken RAM: none
;
;-------------------------------------------------------------------------------

incsrc "Common/Header.asm"
incsrc "Macro/Free.asm"

org $03A263
    RTS : NOP	; Remove plb : rtl from Bowser's code to prevent crash

org $03A118
Bnk3CallSprMain:
	phb
	phk
	plb
	lda $9E,x
	cmp #$A0
	bcc .HandleLowIds

.ExecutePtr
	sbc #$A0
	pea .Return-1
	asl
	tay
	lda .Pointers+1,y
	pha
	lda .Pointers,y
	pha
	rts

.Pointers
	dw $A259-1 ; A0 - Bowser
	dw $B163-1 ; A1 - Bowling ball
	dw $B2A9-1 ; A2 - Mechakoopa

; Utilize otherwise unused pointer table space (A3-A7)
.HandleLowIds
	; Football
	cmp #$1B
	bne .HandleOtherLowIds
	jsr $8012

.Return
	plb
	rtl
	db $00

.PointersCntd
	dw $9F38-1 ; A8 - Blargg
	dw $9890-1 ; A9 - Reznor
	dw $96F6-1 ; AA - Fishbone
	dw $9517-1 ; AB - Rex
	dw $9423-1 ; AC - Wooden spike
	dw $9423-1 ; AD - Wooden spike
	dw $9065-1 ; AE - Fishin' Boo
	dw $0000   ; AF
	dw $8F7A-1 ; B0 - Boo stream
	dw $9284-1 ; B1 - Snake block
	dw $9214-1 ; B2 - Falling spike
	dw $8EEC-1 ; B3 - Statue fireball
	dw $0000   ; B4
	dw $0000   ; B5
	dw $8F75-1 ; B6 - Reflecting fireball
	dw $8C2F-1 ; B7 - Carrot top lift
	dw $8C2F-1 ; B8 - Carrot top lift
	dw $8D6F-1 ; B9 - Info box
	dw $8DBB-1 ; BA - Timed lift
	dw $8E79-1 ; BB - Grey castle block
	dw $8A3C-1 ; BC - Bowser statue
	dw $8958-1 ; BD - Sliding koopa
	dw $88A3-1 ; BE - Swooper
	dw $8770-1 ; BF - Mega mole
	dw $86FF-1 ; C0 - Lava platform
	dw $85F6-1 ; C1 - Three flying turn blocks
	dw $84CA-1 ; C2 - Blurp
	dw $852F-1 ; C3 - Porcupuffer
	dw $8454-1 ; C4 - Falling grey platform
	dw $8087-1 ; C5 - Big Boo boss
	dw $C4DC-1 ; C6 - Spotlight
	dw $C30F-1 ; C7 - Invisible mushroom
	dw $C1F5-1 ; C8 - Light switch

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
%Free($03A19A, $03A258)
