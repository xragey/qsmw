;-------------------------------------------------------------------------------
;
; qSMW - Macro/Remap.asm
;
;-------------------------------------------------------------------------------

macro RemapByte(address, old, new)
	if read1(<address>) == <old>
		pushpc
		org <address> : db <new>
		pullpc
	else
		print "Warn: Skipped remap of <address>."
	endif
endmacro

macro RemapWord(address, old, new)
	if read2(<address>) == <old>
		pushpc
		org <address> : dw <new>
		pullpc
	else
		print "Warn: Skipped remap of <address>."
	endif
endmacro

macro RemapLong(address, old, new)
	if read3(<address>) == <old>
		pushpc
		org <address> : dl <new>
		pullpc
	else
		print "Warn: Skipped remap of <address>."
	endif
endmacro
