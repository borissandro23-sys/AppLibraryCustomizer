# App Library Customizer

Experimental jailbreak tweak for iPhone 6s running iOS 15.8.8 with Dopamine.

## Planned features

- Inspect App Library categories and installed applications.
- Assign applications to a preferred category.
- Create and manage custom category definitions.
- Persist user preferences and provide a reset-to-default option.

## Current status

**Scaffold only.** Version 0.1.0 currently contains a SpringBoard load diagnostic.
It does not yet modify App Library categories or move applications.

## Build environment

- Theos
- Logos
- Objective-C / Objective-C++
- Rootless package layout for Dopamine
- Target: iOS 15.0+, arm64

Build with:

```sh
make clean package
```

Do not install experimental builds on a primary device until SpringBoard hooks have
been verified and a recovery path is available.

## Development notes

App Library grouping is managed by private SpringBoard frameworks. The implementation
must be researched against the target iOS version; private class and method names must
not be assumed from other iOS releases.
