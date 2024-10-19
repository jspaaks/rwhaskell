# `0842`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help
λ :load split-with.hs
[1 of 1] Compiling SplitWith             ( split-with.hs, interpreted )
Ok, one module loaded.
λ words "  This    is  a string  "
["This","is","a","string"]
λ 
λ f x = x == ' '
λ splitWith f "  This    is  a string  "
["This","is","a","string"]
λ 
λ g x = x < 0
λ splitWith g [1,2,-1,3,-1,-1,4,5,6,7]
[[1,2],[3],[4,5,6,7]]
```

## Linting

```console
hlint split-with.hs
```
