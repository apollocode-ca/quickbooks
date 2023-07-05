// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Entity to manage web addresses in Quickbooks entities
class QuickbooksWebAddress {
  String? uri;

  /// Generates a [Uri] for the [uri] address
  ///
  /// Returns null if [uri] is not a valid web address
  Uri? getUri() {
    if (uri == null) {
      return null;
    }
    return Uri.tryParse(uri!);
  }

  QuickbooksWebAddress({
    this.uri,
  });

  QuickbooksWebAddress copyWith({
    String? uri,
  }) {
    return QuickbooksWebAddress(
      uri: uri ?? this.uri,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'URI': uri,
    };
  }

  factory QuickbooksWebAddress.fromMap(Map<String, dynamic> map) {
    return QuickbooksWebAddress(
      uri: map['URI'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksWebAddress.fromJson(String source) =>
      QuickbooksWebAddress.fromMap(json.decode(source));

  @override
  String toString() => 'QuickbooksWebAddress(uri: $uri)';

  @override
  bool operator ==(covariant QuickbooksWebAddress other) {
    if (identical(this, other)) return true;

    return other.uri == uri;
  }

  @override
  int get hashCode => uri.hashCode;
}
