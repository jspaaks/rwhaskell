# `0707`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help
λ :load intersperse.hs
[1 of 1] Compiling Intersperse             ( intersperse.hs, interpreted )
Ok, one module loaded.
λ myIntersperse ',' []
""
λ myIntersperse ',' ["foo"]
"foo"
λ myIntersperse ',' ["foo", "bar", "baz"]
"foo,bar,baz"
λ 
λ myIntersperse (-1) []
[]
λ myIntersperse (-1) [[6]]
[6]
λ myIntersperse (-1) [[6], [1,2,3], [], [9,8,7,6]]
[6,-1,1,2,3,-1,-1,9,8,7,6]
```

## Linting

```console
hlint intersperse.hs
```
