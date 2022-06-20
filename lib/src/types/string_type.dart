/// Names used to convert variables or classes.
enum NamingType {
  /// Equivalent to [NamingType.pascal].
  ///
  /// Such as:
  /// - 'http client' => 'HttpClient'
  upperCamel,

  /// Such as:
  ///
  /// - 'http client' => 'httpClient'
  lowerCamel,

  /// Equivalent to [NamingType.lower].
  ///
  /// Such as:
  ///
  /// - 'http client' => 'http_client'
  lowerSnake,

  /// Equivalent to [NamingType.lower].
  ///
  /// Such as:
  ///
  /// - 'http client' => 'Http_Client'
  upperSnake,

  /// Equivalent to [NamingType.upperCamel].
  ///
  ///
  /// Such as:
  ///
  /// - 'http client' => 'HttpClient'
  pascal,

  /// Such as:
  ///
  /// - 'http client' => 'http-client'
  kebab,

  /// Equivalent to [NamingType.lowerSnake].
  ///
  /// Such as:
  ///
  /// - 'http client' => 'http_client'
  lower,

  /// Such as:
  ///
  /// - 'http client' => 'HTTP_CLIENT'
  upper,
}
