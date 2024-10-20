# `09809`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
Loaded GHCi configuration from /home/nlesc/.config/ghc/ghci.conf
λ :load my-group-by.hs 
[1 of 1] Compiling MyGroupBy        ( my-group-by.hs, interpreted )
Ok, one module loaded.
λ import Data.List (groupBy)
λ xs = [0,1..12]
λ xs
[0,1,2,3,4,5,6,7,8,9,10,11,12]
λ adjMoreThan4 a b = a > 4 && b > 4
λ groupBy adjMoreThan4 xs
[[0],[1],[2],[3],[4],[5,6,7,8,9,10,11,12]]
λ myGroupBy adjMoreThan4 xs
[[0],[1],[2],[3],[4],[5,6,7,8,9,10,11,12]]
λ 
λ import Data.Char (isDigit)
λ adjDigits a b = isDigit a && isDigit b
λ ys = "je344ty7e8rga97"
λ groupBy adjDigits ys
["j","e","344","t","y","7","e","8","r","g","a","97"]
λ myGroupBy adjDigits ys
["j","e","344","t","y","7","e","8","r","g","a","97"]
λ 
λ :{
┣ adjSameType a b = a' || b' where
┣     a' = same (map isDigit [a, b])
┣     b' = same (map (not . isDigit) [a,b])
┣     same [x,y] = x == y
┣ :}
λ groupBy adjSameType ys
["je","344","ty","7","e","8","rga","97"]
λ myGroupBy adjSameType ys
["je","344","ty","7","e","8","rga","97"]
```

## Linting

```console
hlint my-group-by.hs
```
