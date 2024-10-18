# `0841`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
λ :load safe-list.hs 
[1 of 1] Compiling SafeList         ( safe-list.hs, interpreted )
Ok, one module loaded.
λ safeHead [1,2,3]
Just 1
λ safeHead []
Nothing
λ safeTail [1,2,3]
Just [2,3]
λ safeTail []
Nothing
λ safeLast [1,2,3]
Just 3
λ safeLast []
Nothing
λ safeInit [1,2,3]
Just [1,2]
λ safeInit []
Nothing
```

## Linting

```console
hlint safe-list.hs
```
