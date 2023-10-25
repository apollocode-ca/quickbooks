import 'dart:convert';

/// Entity to manage name-value pairs in Quickbooks entities
class QuickbooksReferenceType {
  dynamic value;
  String? name;
  QuickbooksReferenceType({
    required this.value,
    this.name,
  });

  QuickbooksReferenceType copyWith({
    String? value,
    String? name,
  }) {
    return QuickbooksReferenceType(
      value: value ?? this.value,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'name': name,
    };
  }

  factory QuickbooksReferenceType.fromMap(Map<String, dynamic> map) {
    return QuickbooksReferenceType(
      value: map['value'] ?? '',
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksReferenceType.fromJson(String source) =>
      QuickbooksReferenceType.fromMap(json.decode(source));

  @override
  String toString() => 'QuickbooksParentRefEntity(value: $value, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuickbooksReferenceType &&
        other.value == value &&
        other.name == name;
  }

  @override
  int get hashCode => value.hashCode ^ name.hashCode;
}
