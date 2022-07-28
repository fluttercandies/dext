import 'dart:convert';
import 'dart:typed_data';

/// Mapping each element to a new one.
extension IntListDext on List<int> {
  /// Mapping each element to a new one.
  Uint8List toUint8List() {
    return Uint8List.fromList(this);
  }

  /// Decode the data to a string.
  String decode([Encoding encoding = utf8]) {
    return encoding.decode(this);
  }

  /// Encode the data to a base64 string.
  String toBase64() {
    return base64.encode(this);
  }

  /// Encode to data to a url encoded string.
  String toUrlEncoded([Encoding encoding = utf8]) {
    return Uri.encodeQueryComponent(decode(encoding), encoding: encoding);
  }
}
