/// The round type of number parsing.
enum NumberRoundType {
  /// Round the number to the nearest integer.
  ///
  /// Such as of integers:
  ///  - `1.5` -> `2`
  /// - `1.4` -> `1`
  /// - `1.455` -> `1`
  /// - `-1.5` -> `-1`
  /// - `-1.4` -> `-2`
  ///
  /// Such as of floats 2 digits:
  /// - `1.334` -> `1.33`
  /// - `1.335` -> `1.34`
  round,

  /// Round the number to the nearest integer.
  /// Such as of integers:
  /// - `1.5` -> `2`
  /// - `1.4` -> `1`
  floor,
  ceil,
}
