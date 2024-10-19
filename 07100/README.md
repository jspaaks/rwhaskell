# `0710`

## Command line

```console
$ # compile the code into a binary named app
$ ghc --make command-line-framework.hs -o app
$
$ # run the app on input.txt, generate output.txt
$ ./app input.txt output.txt
```

## GHCI

Equivalent from the REPL:

```console
$ ghci
```
```haskell
GHCi, version 9.4.7: https://www.haskell.org/ghc/  :? for help
λ :load command-line-framework.hs 
[1 of 2] Compiling Main             ( command-line-framework.hs, interpreted )
Ok, one module loaded.
λ interactWith id "input.txt" "output.txt"
```

## Linting

```console
hlint command-line-framework.hs
```
