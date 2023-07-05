// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Memo entity in quickbooks
class QuickbooksMemoRef {
  String value;
  QuickbooksMemoRef({
    required this.value,
  });

  QuickbooksMemoRef copyWith({
    String? value,
  }) {
    return QuickbooksMemoRef(
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
    };
  }

  factory QuickbooksMemoRef.fromMap(Map<String, dynamic> map) {
    return QuickbooksMemoRef(
      value: map['value'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksMemoRef.fromJson(String source) =>
      QuickbooksMemoRef.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QuickbooksMemoRef(value: $value)';

  @override
  bool operator ==(covariant QuickbooksMemoRef other) {
    if (identical(this, other)) return true;

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}
