;-------------------------------------------------------------------------------
;
; qSMW - Macro/Repoint.asm
;
;-------------------------------------------------------------------------------

macro RepointWord(address, old, new)
	if read1(<address>) == $4C || read1(<address>) == $20
		if read2(<address>+1) == <old>
			pushpc
			org <address>+1 : dw <new>
			pullpc
		else
			print "Warn: Skipped repoint of <address>."
		endif
	else
		print "Warn: Attempted to repoint something that is not an absolute jump."
	endif
endmacro

macro RepointLong(address, old, new)
	if read1(<address>) == $5C || read1(<address>) == $22
		if read3(<address>+1) == <old>
			pushpc
			org <address>+1 : dl <new>
			pullpc
		else
			print "Warn: Skipped repoint of <address>."
		endif
	else
		print "Warn: Attempted to repoint something that is not an absolute jump."
	endif
endmacro
