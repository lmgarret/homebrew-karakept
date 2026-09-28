# Homebrew Tap for Karakept

[Karakept](https://github.com/lmgarret/karakept-kmp) is an offline-first client for the
[Karakeep](https://karakeep.app) bookmark manager.

## Install

```bash
brew install --cask lmgarret/karakept/karakept
```

Or tap first:

```bash
brew tap lmgarret/karakept
brew install --cask karakept
```

Apple silicon only.

### First launch

Karakept is not notarized by Apple yet, so macOS blocks it the first time it is opened. Open it
once, then allow it in **System Settings → Privacy & Security → Open Anyway**.

## Update and uninstall

```bash
brew upgrade --cask karakept
brew uninstall --cask karakept        # keeps your data
brew uninstall --cask --zap karakept  # also removes ~/.karakept
```

## How the cask is updated

Fully automated. `update-cask.yml` checks the latest stable release of `lmgarret/karakept-kmp`
daily. For a new version it:

1. downloads the DMG and verifies its
   [build provenance attestation](https://docs.github.com/en/actions/security-for-github-actions/using-artifact-attestations)
   against the upstream release workflow;
2. runs `Tests` (style, audit, livecheck, install, uninstall) against the new version and SHA-256;
3. commits the bump straight to `main`.

A failure at any step stops the update, and the next day's run tries again.

No credential for this tap is stored in the upstream repository: the tap pulls releases, the app
repository never pushes here.

You can verify a download yourself:

```bash
gh attestation verify Karakept-<version>.dmg --repo lmgarret/karakept-kmp
```

## Issues

Problems with the app belong in
[lmgarret/karakept-kmp](https://github.com/lmgarret/karakept-kmp/issues). Only report issues
with the cask itself here.
