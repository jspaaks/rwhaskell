# `19500`

Solution uses applicative functor map to add Maybe Cents to Maybe Dollars * 100.

```console
$ ghc --make closings.hs
$ ./closings < prices.csv
The maximum closing price in the data is: Just 2741
```
