# `11801`

(Refactor of 11800)

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
λ :load Main.hs
[1 of 5] Compiling Prettify         ( Prettify.hs, interpreted )
[2 of 5] Compiling SimpleJSON       ( SimpleJSON.hs, interpreted )
[3 of 5] Compiling PrettyJSON       ( PrettyJSON.hs, interpreted )
[4 of 5] Compiling Main             ( Main.hs, interpreted )
Ok, four modules loaded.
λ import SimpleJSON (JValue(..))
λ let value = renderJValue (JObject [("f", JNumber 1), ("q", JBool True)])
λ :type value
value :: Prettify.Doc
λ import Prettify (compact)
λ putStrLn $ compact value
{"f": 1.0,
"q": true
}
λ import Prettify (pretty)
λ putStrLn $ pretty 30 value
{"f": 1.0, "q": true }
λ 
```

## Linting

```console
hlint Main.hs
```
