# `0691`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help
λ :load my-length.hs
[1 of 1] Compiling MyLength             ( my-length.hs, interpreted )
Ok, one module loaded.
λ map ($ [1,2,3]) [myLength1, myLength2, myLength3]
[3,3,3]
λ map ($ []) [myLength1, myLength2, myLength3]
[0,0,0]
λ map ($ ["abcd", "", "fgh"]) [myLength1, myLength2, myLength3]
[3,3,3]
```

## Linting

```console
hlint my-length.hs
```
