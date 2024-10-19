# `09804`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help
λ :load as-int.hs
[1 of 1] Compiling AsInt             ( as-int.hs, interpreted )
Ok, one module loaded.
λ asInt ""
Left "Empty input"
λ asInt "-"
Left "No digits to parse"
λ asInt "-123"
Left "No negative numbers"
λ asInt "2.7"
Left "Non-digit characters in input"
λ 2 ^ 63 - 1
9223372036854775807
λ asInt "9223372036854775807"
Right 9223372036854775807
λ asInt "9223372036854775808"
Left "Integer overflow"
```

## Linting

```console
hlint as-int.hs
```
