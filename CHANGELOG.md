### [1.0.3] 2023-11-01

Changes

- Ruby gem updates

### [1.0.2] 2023-08-29

Changes

- Ruby gem updates

### [1.0.1] 2023-08-17

Changes

- Ruby gem updates

### 1.0.0

Changes (not really a breaking change, but just wanted to bump to 1.0.0)

- Limit required ruby version to ~> 3.0.
- Update ruby gems.

### 0.3.0

Changes

- Update README.md file with the correct gem name.

### 0.2.3

Bug fixes

- Fix bug in specs that failed to add criteria for passing tests (e.g. ".to eq true/false") so tests could not fail.

### 0.2.2

Changes

- Restructure modules under lib/immutable_structure_ex folder.
- Make codez to create struct a little cleaner/tighter.
- Ignore .vscode folder in .gitignore file.
- Update gems and especially rake gem version to squash CVE-2020-8130, see https://github.com/advisories/GHSA-jppv-gw3r-w3q8.
- Fix rubocop violations.

### 0.2.1

Changes

- General refactors/cleanup.
- Added Immutable module; when extended on a struct, makes it immutable.
- Added Comparable module; when extended on a struct, makes it comparable to other structs and hashes.

### 0.1.1

Changes

- Added this CHANGELOG.md.

Bug fixes

- Equality method #== did not work when comparing objects whose underlying hashes were equal.
- Added #== method to compare underlying hashes by calling a.to_h == b.to_h.

### 0.1.0

Initial release.
