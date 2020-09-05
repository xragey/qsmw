;-------------------------------------------------------------------------------
;
; qSMW - Macro/Skip.asm
;
;-------------------------------------------------------------------------------

macro Skip(address, distance)
	pushpc
	org <address>
	if <distance> < 1
		print "Warn: %Skip() called with illegal distance of <distance>."
	elseif <distance> == 1
		nop
	elseif <distance> == 2
		wdm #$FF
	elseif <distance> == 3
		bra ?Skip
		db $FF
		?Skip:
	elseif <distance> < 130
		bra ?Skip
		rep (<distance>)-2 : db $FF
		?Skip:
	else
		jmp ?Skip
		rep (<distance>)-3 : db $FF
		?Skip:
	endif
	pullpc
endmacro
