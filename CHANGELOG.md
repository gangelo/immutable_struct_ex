### 0.2.1
* Enhancements
  * General refactors/cleanup
  * Added Immutable module; when extended on a struct, makes it immutable.
  * Added Comparable module; when extended on a struct, makes it comparable to other structs and hashes.

### 0.1.1
* Enhancements
  * Added this CHANGELOG.md
* Bug fix
  * Equality method #== did not work when comparing objects whose underlying hashes were equal.
  * Added #== method to compare underlying hashes by calling a.to_h == b.to_h.

### 0.1.0
* Initial release.
