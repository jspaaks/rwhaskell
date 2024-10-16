# `07012`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help
λ :load grahams-scan.hs
[1 of 1] Compiling GrahamsScan             ( grahams-scan.hs, interpreted )
Ok, one module loaded.
λ grahamsScan
"Called function grahamsScan"
```

## Linting

```console
hlint grahams-scan.hs
```


```haskell
λ :{
ctns =
    [ Ctn 0 0
    , Ctn 1 0
    , Ctn 1 1
    , Ctn 0 1
    , Ctn (-0.5) (-0.5)
    , Ctn   0.5  (-0.5)
    , Ctn   1.5  (-0.5)
    , Ctn (-0.5)   0.5
    , Ctn   0.5    0.5
    , Ctn   1.5    0.5
    , Ctn (-0.5)   1.5
    , Ctn   0.5    1.5
    , Ctn   1.5    1.5
    ]
:}
```

<!-- 
λ direction a (Stack [])
Left
λ direction b (push a $ Stack [])
Left
λ direction c (push b $ push a $ Stack [])
Left
λ direction d (push c $ push b $ push a $ Stack [])
Right
λ direction d (pop $ push c $ push b $ push a $ Stack [])
Left
λ direction e (push d $ pop $ push c $ push b $ push a $ Stack [])
None
λ direction e (pop $ push d $ pop $ push c $ push b $ push a $ Stack [])
Left
λ direction f (push e $ pop $ push d $ pop $ push c $ push b $ push a $ Stack [])
Left
λ direction g (push f $ push e $ pop $ push d $ pop $ push c $ push b $ push a $ Stack [])
Left
λ direction h (push g $ push f $ push e $ pop $ push d $ pop $ push c $ push b $ push a $ Stack [])
Right
λ direction h (pop $ push g $ push f $ push e $ pop $ push d $ pop $ push c $ push b $ push a $ Stack [])
None
λ direction h (pop $ pop $ push g $ push f $ push e $ pop $ push d $ pop $ push c $ push b $ push a $ Stack [])
Left

-->