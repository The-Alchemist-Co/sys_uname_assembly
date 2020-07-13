# sys_uname_assembly

## How To Compile 64-bit ELF binary

```
nasm -f elf64 -o <filename>.o <filename>.asm
ld -o <filename> <filename>.o
```
