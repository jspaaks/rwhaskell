# `09807`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help
λ :load my-take-while.hs
[1 of 1] Compiling MyTakeWhile             ( my-take-while.hs, interpreted )
Ok, one module loaded.
λ takeWhile id []
[]
λ myTakeWhileRecurse id []
[]
λ myTakeWhileFoldr id []
[]
λ 
λ xs = [False, True, False, True, True]
λ takeWhile id xs
[]
λ myTakeWhileRecurse id xs
[]
λ myTakeWhileFoldr id xs
[]
λ 
λ xs' = [True, True, False, True, False, True, True]
λ takeWhile id xs'
[True,True]
λ myTakeWhileRecurse id xs'
[True,True]
λ myTakeWhileFoldr id xs'
[True,True]
```

## Linting

```console
hlint my-take-while.hs
```
