# `09806`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help
λ :load my-concat.hs
[1 of 1] Compiling MyConcat             ( my-concat.hs, interpreted )
Ok, one module loaded.
λ myconcat ["abc", "", "de", "fgh"]
"abcdefgh"
λ concat ["abc", "", "de", "fgh"]
"abcdefgh"
λ myconcat [[1,2,3], [4,5], [], [6]]
[1,2,3,4,5,6]
λ concat [[1,2,3], [4,5], [], [6]]
[1,2,3,4,5,6]
```

## Linting

```console
hlint my-concat.hs
```
