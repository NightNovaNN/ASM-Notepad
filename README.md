# ASM-Notepad
A notepad opener made with ASM

## NOTE
This is for `x86-64 NASM Windows` only, this won't work on any other systems

## What it does
`Nothing`, its just for practice... It will just open _notepad_ with the text `"Hello From Raw ASM"`

## Building it
- Either use NASM with:
  ```sh
  # Clone it
  git clone https://github.com/NightNovaNN/ASM-Notepad
  cd ASM-Notepad
  # NASM
  nasm -f win64 notepad.asm -o notepad.obj
  # Link it using GCC
  gcc notepad.obj -o notepader
  # Run
  # IF on Powershell: ./notepad
  notepader.exe
  ```
  Note its `Notepader` not `Notepad` because _notepad.exe_ is a real program so the OS may run the wrong one
- Batch
  ```sh
    # Clone it
    git clone https://github.com/NightNovaNN/ASM-Notepad
    cd ASM-Notepad
    # Build + Run
    ./build notepad
  ```

  ## For anyone trying it out
  THANKS ALOT!! <3
