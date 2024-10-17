# `07012`

## Interactive

Below is some Haskell code that is useful for evaluating:

```haskell
-- print a list of cartesian coodinates
printCtns :: [Ctn] -> IO ()
printCtns ctns = putStr $ "[\n" <> f ctns <> "]\n" where
    f = unlines . map ((<>) ", ") . map show


-- print a list of triplets
printTriplets :: [Triplet] -> IO ()
printTriplets triplets = putStr $ "[\n" <> f triplets <> "]\n" where
    f = unlines . map ((<>) ", ") . map show

-- test data: two grids
ctns1 =
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
```


```console
$ ghci
```
```haskell
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
λ :load graham-scan.hs 
[1 of 1] Compiling GrahamScan       ( graham-scan.hs, interpreted )
Ok, one module loaded.
λ :{
┣ ctns1 =
┣     [ Ctn 0 0
┣     , Ctn 1 0
┣     , Ctn 1 1
┣     , Ctn 0 1
┣     , Ctn (-0.5) (-0.5)
┣     , Ctn   0.5  (-0.5)
┣     , Ctn   1.5  (-0.5)
┣     , Ctn (-0.5)   0.5
┣     , Ctn   0.5    0.5
┣     , Ctn   1.5    0.5
┣     , Ctn (-0.5)   1.5
┣     , Ctn   0.5    1.5
┣     , Ctn   1.5    1.5
┣     ]
┣ :}
λ hull ctns1
[Ctn (-0.5) (-0.5),Ctn 1.5 (-0.5),Ctn 1.5 1.5,Ctn (-0.5) 1.5,Ctn (-0.5) (-0.5)]
```

## Linting

```console
hlint grahams-scan.hs
```

