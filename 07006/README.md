# `0706`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help
λ :load sorting-by-length.hs
[1 of 1] Compiling SortingByLength             ( sorting-by-length.hs, interpreted )
Ok, one module loaded.
λ sortingByLength ["adsd", "dfdfghgr", "e213e"]
["adsd","e213e","dfdfghgr"]
λ sortingByLength [[1,3,5],[], [1], [2,7643,23,12,7864]]
[[],[1],[1,3,5],[2,7643,23,12,7864]]
```

## Linting

```console
hlint sorting-by-length.hs
```
