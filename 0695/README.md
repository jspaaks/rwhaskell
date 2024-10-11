# `0695`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.8: https://www.haskell.org/ghc/  :? for help
λ :load is-palindrome.hs
[1 of 1] Compiling IsPalindrome             ( is-palindrome.hs, interpreted )
Ok, one module loaded.
λ map ($ "abaca") [isPalindrome1, isPalindrome2, isPalindrome3]
[False,False,False]
λ map ($ "aboba") [isPalindrome1, isPalindrome2, isPalindrome3]
[True,True,True]
λ map ($ [1,2,3,3,2,1]) [isPalindrome1, isPalindrome2, isPalindrome3]
[True,True,True]
```

## Linting

```console
hlint is-palindrome.hs
```
