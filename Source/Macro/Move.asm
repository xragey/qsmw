;-------------------------------------------------------------------------------
;
; qSMW - Macro/Move.asm
;
;-------------------------------------------------------------------------------

macro Move(destination, source, length)
	pushpc
	if <destination> < <source>
		!_i = 0
		while !_i < <length>
			org (<destination>)+!_i : db read1((<source>)+!_i)
			org (<source>)+!_i : db $FF
			!_i #= !_i+1
		endif
	else
		!_i = (<length>)-1
		while !_i >= 0
			org (<destination>)+!_i : db read1((<source>)+!_i)
			org (<source>)+!_i : db $FF
			!_i #= !_i-1
		endif
	endif
	pullpc
endmacro
