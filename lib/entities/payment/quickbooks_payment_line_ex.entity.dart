// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quickbooks/entities/entity.export.dart';

/// Line infos for a [QuickbooksPaymentLine]
class QuickbooksPaymentLineEx {
  String? name;
  bool? nil;
  QuickbooksReferenceType? value;
  String? declaredType;
  String? scope;
  bool? globalScope;
  bool? typeSubstitued;
  QuickbooksPaymentLineEx({
    this.name,
    this.nil,
    this.value,
    this.declaredType,
    this.scope,
    this.globalScope,
    this.typeSubstitued,
  });

  QuickbooksPaymentLineEx copyWith({
    String? name,
    bool? nil,
    QuickbooksReferenceType? value,
    String? declaredType,
    String? scope,
    bool? globalScope,
    bool? typeSubstitued,
  }) {
    return QuickbooksPaymentLineEx(
      name: name ?? this.name,
      nil: nil ?? this.nil,
      value: value ?? this.value,
      declaredType: declaredType ?? this.declaredType,
      scope: scope ?? this.scope,
      globalScope: globalScope ?? this.globalScope,
      typeSubstitued: typeSubstitued ?? this.typeSubstitued,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'nil': nil,
      'value': value?.toMap(),
      'declaredType': declaredType,
      'scope': scope,
      'globalScope': globalScope,
      'typeSubstitued': typeSubstitued,
    };
  }

  factory QuickbooksPaymentLineEx.fromMap(Map<String, dynamic> map) {
    return QuickbooksPaymentLineEx(
      name: map['name'],
      nil: map['nil'],
      value: map['value'] != null
          ? QuickbooksReferenceType.fromMap(
              map['value'] as Map<String, dynamic>)
          : null,
      declaredType: map['declaredType'],
      scope: map['scope'],
      globalScope: map['globalScope'],
      typeSubstitued: map['typeSubstitued'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksPaymentLineEx.fromJson(String source) =>
      QuickbooksPaymentLineEx.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksPaymentLineEx(name: $name, nil: $nil, value: $value, declaredType: $declaredType, scope: $scope, globalScope: $globalScope, typeSubstitued: $typeSubstitued)';
  }

  @override
  bool operator ==(covariant QuickbooksPaymentLineEx other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.nil == nil &&
        other.value == value &&
        other.declaredType == declaredType &&
        other.scope == scope &&
        other.globalScope == globalScope &&
        other.typeSubstitued == typeSubstitued;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        nil.hashCode ^
        value.hashCode ^
        declaredType.hashCode ^
        scope.hashCode ^
        globalScope.hashCode ^
        typeSubstitued.hashCode;
  }
}
