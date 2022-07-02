# pegged.vim

This is a fork of [peg.vim](https://github.com/gf3/peg.vim).

Syntax highlighting for [pegged](https://github.com/PhilippeSigaud/Pegged)
grammars.

Files with `.pegd` extension are treated as `pegged` files.

## Features

Highlighting of all standard parts of PEG (since pegged is a superset of PEG).

Highlighting of most of pegged extensions.

## Known missing features

Highlighting of semantic actions. Would be great to have this, but I don't see a
way to do it if d code in side of the action has a closing curly (does pegged
even allow that?).

Parameterised Rules. No issue here, just didn't get to it yet.


## Known bugs

Things will break when parsing quotes and brackets (as in your grammar accepts
quotes and brackets). Good news is, it will only break for 1 line (probably).
