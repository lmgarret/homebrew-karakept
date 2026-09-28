#!/usr/bin/env bash
# Usage: set-cask-version.sh <version> <sha256>
set -euo pipefail

version="$1"
sha256="$2"
cask="Casks/karakept.rb"

[[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || { echo "Invalid version: $version" >&2; exit 1; }
[[ "$sha256" =~ ^[0-9a-f]{64}$ ]] || { echo "Invalid sha256: $sha256" >&2; exit 1; }

sed -i.bak \
  -e "s/^  version \".*\"$/  version \"$version\"/" \
  -e "s/^  sha256 \".*\"$/  sha256 \"$sha256\"/" \
  "$cask"
rm "$cask.bak"

grep -q "^  version \"$version\"$" "$cask" && grep -q "^  sha256 \"$sha256\"$" "$cask" \
  || { echo "Failed to update $cask" >&2; exit 1; }
