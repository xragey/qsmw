;-------------------------------------------------------------------------------
;
; qSMW - Macro/Free.asm
;
;-------------------------------------------------------------------------------

macro Free(address, count)
	pushpc
	org <address>
	rep <count> : db $FF
	pullpc
endmacro
