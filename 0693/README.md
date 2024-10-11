# `0693`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help
λ :load mean-of-a-list.hs
[1 of 1] Compiling MeanOfAList             ( mean-of-a-list.hs, interpreted )
Ok, one module loaded.
λ meanOfAList []
Nothing
λ meanOfAList [4,5,6]
Just 5.0
λ meanOfAList [-1,2]
Just 0.5
```

## Linting

```console
hlint mean-of-a-list.hs
```
