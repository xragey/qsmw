;-------------------------------------------------------------------------------
;
; qSMW - Macro/Free.asm
;
;-------------------------------------------------------------------------------

macro Free(addressStart, addressEnd)
	pushpc
	org <addressStart>
	rep (<addressEnd>)-(<addressStart>) : db $FF
	pullpc
endmacro
