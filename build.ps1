$infile = 'Input\smw.smc'
$outfile = 'Output\qsmw.smc'
$outpatch = 'Output\qpatch.bps'

$assembler = '.\asar.exe'
$patcher = '.\flips.exe'

# Fetch prepared ROM with FastROM and Lunar Magic patches already installed.
Copy-Item $infile -Destination $outfile

# Apply patches
$patches = Get-ChildItem -Name -File 'Source\'

foreach ($patch in $patches) {
	&$assembler "Source\$patch" $outfile
}

# Create .bps patch
&$patcher '--create' $infile $outfile $outpatch | Out-Null

# Prevent window from closing automatically.
Read-Host -Prompt 'Done'
