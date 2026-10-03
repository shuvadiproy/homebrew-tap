#!/bin/sh
# Point the formula at a new release: ./update.sh 0.2.0
# Run it after pushing the tag (git tag v0.2.0 && git push origin v0.2.0).
set -eu
version="${1:?usage: ./update.sh VERSION (e.g. 0.2.0)}"
url="https://github.com/shuvadiproy/dskmap/archive/refs/tags/v${version}.tar.gz"
sha=$(curl -fsSL "$url" | shasum -a 256 | cut -d' ' -f1)
sed -i '' -e "s|^  url \".*\"|  url \"${url}\"|" -e "s|^  sha256 \".*\"|  sha256 \"${sha}\"|" Formula/dskmap.rb
echo "Formula/dskmap.rb -> v${version} (sha256 ${sha})"
