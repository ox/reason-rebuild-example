# Reason `rebuild` Example

This is an example project that shows how to build a native Reason project with multiple directories. It uses the `rebuild` tool, a thin wrapper around [`ocamlbuild`][ocamlbuild], which comes with the [`reason-cli`][reason-cli]. You can take a look at the [`ocamlbuild/examples`][ocamlbuild-examples] for more examples and guidance which will work identically for `rebuild`. To learn more about `ocamlbuild` you should read the [OCamlBuild Manual][ocamlbuild-manual] for more in-depth information about how it works.

The project layout is:

  - `src` for the program entry-point
  - `lib` for additional libraries which files in `src` can reference

#### Building

```
make
```

This will produce `Hello.byte` (a byte-code ) and `Hello.native` in the root directory. These are native programs that you can run with `./Hello.native`.

#### Debugging

Compiled programs with debug tags can be built by running:

```
make debug
```

This produces `Hello.byte` which can then be debugged using [`red`][red] by running:

```
python path/to/red.py Hello.byte
```

`red` is a wrapper around [`ocamldebug`][ocamldebug] which can translate breakpoints and errors from Reason to OCaml and back.

#### Adding OPam Modules

First install the desired OPam module, `yojson` for instance:

```
opam install yojson
```

Then create a `_tags` file (a file `ocamlbuild` reads for configuration):

```
true: package(yojson)
```

Next time you run `make`, `rebuild` will read that `_tags` file and apply the rules in it (in this case, always packaging `yojson`) to the build. You can read mode about tags in the OCamlBuild Manual's ["Tags and the `_tags` file"][ocamlbuild-manual-tags] section.

#### Cleaning

To reamove all of the compiled and generated files, run:

```
make clean
```


[reason-cli]: https://github.com/reasonml/reason-cli
[ocamlbuild]: https://github.com/ocaml/ocamlbuild
[ocamlbuild-examples]: https://github.com/ocaml/ocamlbuild/tree/master/examples
[ocamlbuild-manual]: https://github.com/ocaml/ocamlbuild/blob/master/manual/manual.adoc
[ocamlbuild-manual-tags]: https://github.com/ocaml/ocamlbuild/blob/master/manual/manual.adoc#tags-and-the-code-_tags-code-file
[red]: https://github.com/reasonml/red
[ocamldebug]: https://ocaml.org/learn/tutorials/debug.html
