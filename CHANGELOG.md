### 0.1.1
* Enhancements
  * Added this CHANGELOG.md
* Bug fix
  * Equality method #== did not work when comparing objects whose underlying hashes were equal.
  * Added #== method to compare underlying hashes by calling a.to_h == b.to_h.

### 0.1.0
* Initial release.
