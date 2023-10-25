// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quickbooks/entities/entity.export.dart';

class QuickbooksContactInfos {
  String? type;
  QuickbooksPhoneNumber? telephone;
  QuickbooksContactInfos({
    this.type,
    this.telephone,
  });

  QuickbooksContactInfos copyWith({
    String? type,
    QuickbooksPhoneNumber? telephone,
  }) {
    return QuickbooksContactInfos(
      type: type ?? this.type,
      telephone: telephone ?? this.telephone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Type': type,
      'Telephone': telephone?.toMap(),
    };
  }

  factory QuickbooksContactInfos.fromMap(Map<String, dynamic> map) {
    return QuickbooksContactInfos(
      type: map['Type'],
      telephone: map['Telephone'] != null
          ? QuickbooksPhoneNumber.fromMap(
              map['Telephone'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksContactInfos.fromJson(String source) =>
      QuickbooksContactInfos.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuickbooksContactInfos(type: $type, telephone: $telephone)';

  @override
  bool operator ==(covariant QuickbooksContactInfos other) {
    if (identical(this, other)) return true;

    return other.type == type && other.telephone == telephone;
  }

  @override
  int get hashCode => type.hashCode ^ telephone.hashCode;
}
