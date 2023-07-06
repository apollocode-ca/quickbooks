// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quickbooks/entities/entity.export.dart';

/// Details of a [QuickbooksDiscountLine]
class QuickbooksDiscountLineDetails {
  QuickbooksReferenceType? classRef;
  QuickbooksReferenceType? taxCodeRef;
  QuickbooksReferenceType? discountAccountRef;
  bool? percentBased;
  double? discountPercent;
  QuickbooksDiscountLineDetails({
    this.classRef,
    this.taxCodeRef,
    this.discountAccountRef,
    this.percentBased,
    this.discountPercent,
  });

  QuickbooksDiscountLineDetails copyWith({
    QuickbooksReferenceType? classRef,
    QuickbooksReferenceType? taxCodeRef,
    QuickbooksReferenceType? discountAccountRef,
    bool? percentBased,
    double? discountPercent,
  }) {
    return QuickbooksDiscountLineDetails(
      classRef: classRef ?? this.classRef,
      taxCodeRef: taxCodeRef ?? this.taxCodeRef,
      discountAccountRef: discountAccountRef ?? this.discountAccountRef,
      percentBased: percentBased ?? this.percentBased,
      discountPercent: discountPercent ?? this.discountPercent,
    );
  }

  /// Converts to a map value
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ClassRef': classRef?.toMap(),
      'TaxCodeRef': taxCodeRef?.toMap(),
      'DiscountAccountRef': discountAccountRef?.toMap(),
      'PercentBased': percentBased,
      'DiscountPercent': discountPercent,
    };
  }

  /// Converts from a map value
  factory QuickbooksDiscountLineDetails.fromMap(Map<String, dynamic> map) {
    return QuickbooksDiscountLineDetails(
        classRef: map['ClassRef'] != null
            ? QuickbooksReferenceType.fromMap(
                map['ClassRef'] as Map<String, dynamic>)
            : null,
        taxCodeRef: map['TaxCodeRef'] != null
            ? QuickbooksReferenceType.fromMap(
                map['TaxCodeRef'] as Map<String, dynamic>)
            : null,
        discountAccountRef: map['DiscountAccountRef'] != null
            ? QuickbooksReferenceType.fromMap(
                map['DiscountAccountRef'] as Map<String, dynamic>)
            : null,
        percentBased: map['PercentBased'],
        discountPercent: double.tryParse(map['DiscountPercent'].toString()));
  }

  /// Converts to a json value
  String toJson() => json.encode(toMap());

  /// Converts from a json value
  factory QuickbooksDiscountLineDetails.fromJson(String source) =>
      QuickbooksDiscountLineDetails.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksDiscountLineDetails(classRef: $classRef, taxCodeRef: $taxCodeRef, discountAccountRef: $discountAccountRef, percentBased: $percentBased, discountPercent: $discountPercent)';
  }

  @override
  bool operator ==(covariant QuickbooksDiscountLineDetails other) {
    if (identical(this, other)) return true;

    return other.classRef == classRef &&
        other.taxCodeRef == taxCodeRef &&
        other.discountAccountRef == discountAccountRef &&
        other.percentBased == percentBased &&
        other.discountPercent == discountPercent;
  }

  @override
  int get hashCode {
    return classRef.hashCode ^
        taxCodeRef.hashCode ^
        discountAccountRef.hashCode ^
        percentBased.hashCode ^
        discountPercent.hashCode;
  }
}
