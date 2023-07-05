import 'dart:convert';

/// Entity to manage phone numbers in Quickbooks entities
class QuickbooksPhoneNumber {
  String? freeFormNumber;
  QuickbooksPhoneNumber({
    this.freeFormNumber,
  });

  QuickbooksPhoneNumber copyWith({
    String? freeFormNumber,
  }) {
    return QuickbooksPhoneNumber(
      freeFormNumber: freeFormNumber ?? this.freeFormNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'FreeFormNumber': freeFormNumber,
    };
  }

  factory QuickbooksPhoneNumber.fromMap(Map<String, dynamic> map) {
    return QuickbooksPhoneNumber(
      freeFormNumber: map['FreeFormNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksPhoneNumber.fromJson(String source) =>
      QuickbooksPhoneNumber.fromMap(json.decode(source));

  @override
  String toString() => 'QuickbooksPhoneNumber(freeFormNumber: $freeFormNumber)';

  @override
  bool operator ==(covariant QuickbooksPhoneNumber other) {
    if (identical(this, other)) return true;

    return other.freeFormNumber == freeFormNumber;
  }

  @override
  int get hashCode => freeFormNumber.hashCode;
}
