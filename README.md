# Hello World in x86 Assembly (32-bit macOS)

A minimal Hello World implementation in x86 32-bit assembly for macOS systems. This implementation uses BSD system calls through the macOS syscall interface.

## Installation

### macOS
Install the development tools:
```bash
xcode-select --install
```

For NASM installation:
```bash
brew install nasm
```

## Building and Running

```bash
# Assemble
nasm -f macho hello.asm

# Link
# Note: macOS version minimum requirement helps ensure compatibility
ld -macosx_version_min 10.7.0 -o hello hello.o

# Run
./hello
```

## Code Explanation

The implementation uses BSD system calls through macOS:
- write (4) outputs the message to stdout
- exit (1) terminates the program

The program follows macOS x86 32-bit syscall conventions:
- Arguments are pushed onto the stack
- Stack must be 16-byte aligned before syscalls
- System call number goes in EAX
- Syscall invoked with INT 0x80

Note that macOS has deprecated 32-bit support as of macOS Catalina (10.15). This code is primarily for educational purposes and historical understanding.
