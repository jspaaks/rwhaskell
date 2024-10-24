# `11800`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
λ :load PrettyJSON.hs
[1 of 3] Compiling Prettify         ( Prettify.hs, interpreted )
[2 of 3] Compiling SimpleJSON       ( SimpleJSON.hs, interpreted )
[3 of 3] Compiling PrettyJSON       ( PrettyJSON.hs, interpreted )
Ok, three modules loaded.
λ empty
Empty
λ char 'x'
Char 'x'
λ double 4.56
Text "4.56"
λ text "abc"
Text "abc"
λ string "abc"
Concat (Concat (Char '"') (Concat (Char 'a') (Concat (Char 'b') (Char 'c')))) (Char '"')
λ string "䕧䕨䕩"
Concat (Concat (Char '"') (Concat (Concat (Text "\\u") (Text "4567")) (Concat (Concat (Te
xt "\\u") (Text "4568")) (Concat (Text "\\u") (Text "4569"))))) (Char '"')
```

## Linting

```console
hlint Main.hs
```
