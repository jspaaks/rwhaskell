# `09802`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help
λ :load as-int.hs
[1 of 1] Compiling AsInt             ( as-int.hs, interpreted )
Ok, one module loaded.
λ asInt "101"
101
λ asInt "-31337"
-31337
λ asInt "1798"
1798
```

## Linting

```console
hlint as-int.hs
```
