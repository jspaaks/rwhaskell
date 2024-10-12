# `0708`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help
λ :load binary-tree-height.hs
[1 of 1] Compiling BinaryTreeHeight    ( binary-tree-height.hs, interpreted )
Ok, one module loaded.
λ tree = Leaf
λ binaryTreeHeight tree
0
λ tree = Fork Leaf Leaf
λ binaryTreeHeight tree
1
λ tree = Fork Leaf (Fork Leaf Leaf)
λ binaryTreeHeight tree
2
λ tree = Fork (Fork Leaf Leaf) (Fork Leaf Leaf)
λ binaryTreeHeight tree
2
λ tree = Fork (Fork Leaf (Fork Leaf Leaf)) (Fork Leaf Leaf)
λ binaryTreeHeight tree
3
```

## Linting

```console
hlint binary-tree-height.hs
```
