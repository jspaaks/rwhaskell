# `0694`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help
λ :load palindrome.hs
[1 of 1] Compiling Palindrome             ( palindrome.hs, interpreted )
Ok, one module loaded.
λ map ($ [1,2,3]) [palindrome1, palindrome2, palindrome3]
[[1,2,3,3,2,1],[1,2,3,3,2,1],[1,2,3,3,2,1]]
λ map ($ "han") [palindrome1, palindrome2, palindrome3]
["hannah","hannah","hannah"]
```

## Linting

```console
hlint palindrome.hs
```
