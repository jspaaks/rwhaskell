# `09810`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help
λ :load list-functions-with-fold.hs
[1 of 1] Compiling ListFunctionsWithFold             ( list-functions-with-fold.hs, interpreted )
Ok, one module loaded.
λ any id []
False
λ myAny id []
False
λ 
λ any id [False, False, False]
False
λ myAny id [False, False, False]
False
λ 
λ any id [False, False, False, True]
True
λ myAny id [False, False, False, True]
True
λ 
λ any (>4) [1..7]
True
λ myAny (>4) [1..7]
True
λ 
λ words ""
[]
λ myWords ""
[]
λ words "abc def"
["abc","def"]
λ myWords "abc def"
["abc","def"]
λ words "    abc def  "
["abc","def"]
λ myWords "    abc def  "
["abc","def"]
λ 
λ unlines ["abc", "def"]
"abc\ndef\n"
λ myUnlines ["abc", "def"]
"abc\ndef\n"
```

## Linting

```console
hlint list-functions-with-fold.hs
```
