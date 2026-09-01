# sanringtech/homebrew-tap

Custom [Homebrew](https://brew.sh) tap for sanringtech tools — not (yet) submitted to the
official `homebrew-cask` repo (see each cask's source repo for why).

## Install

```bash
brew tap sanringtech/tap
brew install --cask haul
```

## Casks

| Cask | Source | Notes |
|---|---|---|
| `haul` | [sanringtech/haul](https://github.com/sanringtech/haul) | macOS Apple Silicon only for now, unsigned (v0.1.0, small-scale sharing stage) |

## Updating a cask after a new release

Bump `version` and `sha256` in the relevant `Casks/*.rb` to match the new GitHub Release asset,
then `brew audit --cask <name>` and `brew install --cask <name> --verbose` locally before pushing.
