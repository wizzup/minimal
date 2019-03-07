# Reveal.js slides using pandoc

Create [reveal.js](https://revealjs.com/#/) slides from multiple source,(e.g. `markdown`, `latex`), using [pandoc](https://pandoc.org/)

**Note:** input format other than markdown may produce incomplete output
- restructureText : problem parsing metadata
- Latex : missing `sty` files


## Building

Use `build.sh` script to build input files in `in` directory. The output will be in `out` directory.

### Off-line mode

Off-line mode include `reveal.js` in output directory

```bash
./build
```

### Online mode

Online mode use online `reveal.js`, slide will only work on internet-connected machine

```bash
./build online
```

## Not a [Nix](https://nixos.org/nixpkgs/) user?

Install required dependencies using your package manager, and replace `nix-shell` shebang

```
#! /usr/bin/env nix-shell
#! nix-shell -i bash
```

with `bash` shebang

```
#! /bin/bash
```

---

*whisper* : use nix, you will love it.
