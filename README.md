# raisin

a small typst template for school papers. title page, sections, notes, and tables.

largely inspired by [grape-suite](https://typst.app/universe/package/grape-suite/) by Tristan Pieper. this is that idea stripped down for personal use.

## install

typst does not install from a git url. clone this repo into the local package directory, with the version as the last folder.

macOS:

```bash
git clone https://github.com/durocodes/raisin "$HOME/Library/Application Support/typst/packages/local/raisin/1.0.0"
```

Linux:

```bash
git clone https://github.com/durocodes/raisin "${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages/local/raisin/1.0.0"
```

Windows:

```powershell
git clone https://github.com/durocodes/raisin "%APPDATA%\typst\packages\local\raisin\1.0.0"
```

then import `@local/raisin:1.0.0`

## usage

you can view examples in the `examples` directory.

## license

- grape-suite is MIT licensed (c) 2024 Tristan Pieper.
- changes in this package are MIT licensed (c) 2026 David Wright.
