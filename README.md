# About qSMW
This is a project aimed at implementing optimizations into a Super Mario World
image. This README is still a work in progress.

# Usage
Patch `\Output\qsmw.bps` to a clean Super Mario World image.

If you want to apply this to a different image (for example, one with FastROM
enabled), you will have to build from source. See the next section.

# Building
Change `build.ps1` to point to your `asar.exe` and `flips.exe`, or place these
executables inside the main folder.

Place the target image in the `Input\` folder. Note that it doesn't have to be a
clean image, but the more edited it is, the more likely it is to break. Either
rename your image to `smw.smc` or change the build script to target a different
name. Then run `build.ps1` to generate an optimized image, which by default will
be named `Output\qsmw.smc`.

# Contributions
They are very welcome, via PR. Please stay close to my coding style; see some of
the existing files for examples.
