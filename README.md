# App Library Customizer

Experimental jailbreak tweak for iPhone 6s running iOS 15.8.8 with Dopamine.

## Planned features

- Inspect App Library categories and installed applications.
- Assign applications to a preferred category.
- Create and manage custom category definitions.
- Persist user preferences and provide a reset-to-default option.

## Current status

**Diagnostic discovery build with a preferences page.** The tweak logs its SpringBoard load and lists runtime class names containing `Library` or `Category`. The Settings page reports the current diagnostic status only.

It does not hook, modify, rename, or move App Library items yet. No functional category controls are exposed.

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
not be assumed from other iOS releases. This diagnostic build only enumerates runtime
class names and does not invoke private App Library methods.
