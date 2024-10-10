# `0602`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
λ :load tree-constructor.hs 
[1 of 1] Compiling TreeConstructor  ( tree-constructor.hs, interpreted )
Ok, one module loaded.
λ leaf = (Node "leaf") Nothing
λ :type leaf
leaf :: Tree String
λ parent = (Node "parent") (Just ((Node "left") Nothing, (Node "right") Nothing))
```

## Linting

```console
hlint tree-constructor.hs
```
