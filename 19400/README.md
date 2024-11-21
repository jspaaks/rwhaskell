# `19400`

```console
$ ghc --make elfcheck.hs
$ ./elfcheck
Usage: elfcheck PATH
$ ./elfcheck elfcheck
'elfcheck' is an ELF file.
$ ./elfcheck elfcheck.hi
'elfcheck.hi' is not an ELF file.
$ ghci
```
```haskell
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
λ :load elfcheck.hs
[1 of 1] Compiling Elfcheck         ( elfcheck.hs, interpreted )
Ok, one module loaded.
λ isElf $ DBL.pack [0x7f, 0x44, 0x4c, 0x46, 0x34, 0x23]
False
λ isElf $ DBL.pack [0x7f, 0x45, 0x4c, 0x46, 0x34, 0x23]
True
```
