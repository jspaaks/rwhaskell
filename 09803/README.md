# `09803`

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
*** Exception: Empty input
CallStack (from HasCallStack):
  error, called at as-int.hs:5:46 in main:AsInt
λ asInt "-"
*** Exception: No digits to parse
CallStack (from HasCallStack):
  error, called at as-int.hs:6:46 in main:AsInt
λ asInt "-3"
*** Exception: No negative numbers
CallStack (from HasCallStack):
  error, called at as-int.hs:7:46 in main:AsInt
λ asInt "2.7"
*** Exception: Non-digit characters in input
CallStack (from HasCallStack):
  error, called at as-int.hs:9:46 in main:AsInt
λ 2^63 - 1
9223372036854775807
λ asInt "9223372036854775807"
9223372036854775807
λ asInt "9223372036854775808"
*** Exception: Integer overflow
CallStack (from HasCallStack):
  error, called at as-int.hs:14:56 in main:AsInt
```

## Linting

```console
hlint as-int.hs
```
