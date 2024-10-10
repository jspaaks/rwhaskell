# `0410`

## Interactive

```console
$ ghci
```
```haskell
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
Loaded GHCi configuration from /home/nlesc/.config/ghc/ghci.conf
λ :load book-store.hs 
[1 of 1] Compiling BookStore        ( book-store.hs, interpreted )
Ok, one module loaded.
λ customerId :: CustomerId = 4567
λ reviewBody :: ReviewBody = "This was a great book!"
λ book :: Book = Book 245624356 "Hitchhiker's guide" ["Douglas Adams"]
λ bookReview :: BookReview = BookReview book customerId reviewBody 
λ show bookReview 
"BookReview (Book 245624356 \"Hitchhiker's guide\" [\"Douglas Adams\"])
4567 \"This was a great book!\""
λ
λ cardNumber :: CardNumber = "134245751234513465"
λ cardHolder :: CardHolder = "Thomas Gradgrind"
λ address :: Address = ["Dickens", "England"]
λ billingInfo :: BillingInfo = CreditCard cardNumber cardHolder address 
λ show billingInfo 
"CreditCard \"134245751234513465\" \"Thomas Gradgrind\"
[\"Dickens\",\"England\"]"
```

## Linting

```console
hlint book-store.hs
```
