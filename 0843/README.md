# `0843`

## CLI

```console
$ ghc --make first-word.hs -o app
[1 of 2] Compiling Main             ( first-word.hs, first-word.o )
[2 of 2] Linking app
$ cat input.txt
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Nulla suscipit risus sit amet accumsan mattis.

Pellentesque tempus, sapien vitae rhoncus tempor, sem massa rutrum risus, nec tempus lorem velit id tortor.
Nulla pulvinar, purus vitae lacinia hendrerit, ligula urna cursus mi, nec condimentum lectus dolor ac ligula.
Proin sit amet tellus sapien.
Praesent facilisis auctor purus nec dignissim.
Sed tempus sapien eget neque scelerisque, vitae imperdiet sem rutrum.
Praesent sagittis erat risus, non lacinia quam viverra volutpat.
Sed eget bibendum ipsum, vitae sodales diam.
Aliquam auctor pretium nulla, sit amet hendrerit ante egestas non.
$ ./app input.txt output.txt
$ cat output.txt
Lorem
Nulla

Pellentesque
Nulla
Proin
Praesent
Sed
Praesent
Sed
Aliquam
```

## Linting

```console
hlint first-word.hs
```
