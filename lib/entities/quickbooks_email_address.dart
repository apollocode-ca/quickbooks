// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Entity to manage Quickbooks email addresses in Quickbooks entities
class QuickbooksEmailAddress {
  String? address;
  QuickbooksEmailAddress({
    this.address,
  });

  QuickbooksEmailAddress copyWith({
    String? address,
  }) {
    return QuickbooksEmailAddress(
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Address': address,
    };
  }

  factory QuickbooksEmailAddress.fromMap(Map<String, dynamic> map) {
    return QuickbooksEmailAddress(
      address: map['Address'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksEmailAddress.fromJson(String source) =>
      QuickbooksEmailAddress.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QuickbooksEmailAddress(address: $address)';

  @override
  bool operator ==(covariant QuickbooksEmailAddress other) {
    if (identical(this, other)) return true;

    return other.address == address;
  }

  @override
  int get hashCode => address.hashCode;
}
