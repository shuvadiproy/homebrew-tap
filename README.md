# shuvadiproy/tap

Homebrew formulae for [dsk](https://github.com/shuvadiproy/dskmap), a fast disk usage analyzer.

```sh
brew tap shuvadiproy/tap
brew trust shuvadiproy/tap   # Homebrew 7+ asks you to trust third-party taps
brew install dskmap
```

Then run `dsk` in any folder.

## Releasing a new version

1. In the dskmap repo: `git tag vX.Y.Z && git push origin vX.Y.Z`
2. Here: `./update.sh X.Y.Z`
3. Test: `brew install --build-from-source ./Formula/dskmap.rb && brew test dskmap`
4. Commit and push.
