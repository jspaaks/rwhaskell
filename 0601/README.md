# `0601`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
λ :load recursive-types.hs 
[1 of 1] Compiling RecursiveTypes   ( recursive-types.hs, interpreted )
Ok, one module loaded.
λ lst = theirListToMyList "Jasko"
λ :type lst
lst :: MyList Char
λ show lst
"MyCons 'J' (MyCons 'a' (MyCons 's' (MyCons 'k' (MyCons 'o' MyNil))))"
λ myListToTheirList lst
"Jasko"
λ theirListToMyList [Just True, Nothing, Just False]
MyCons (Just True) (MyCons Nothing (MyCons (Just False) MyNil))
λ myListToTheirList $ theirListToMyList [Just True, Nothing, Just False]
[Just True,Nothing,Just False]
λ :type theirListToMyList [Just True, Nothing, Just False]
theirListToMyList [Just True, Nothing, Just False]
  :: MyList (Maybe Bool)
```

## Linting

```console
hlint recursive-types.hs
```
