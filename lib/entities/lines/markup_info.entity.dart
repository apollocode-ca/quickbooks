// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quickbooks/entities/entity.export.dart';

///Markup info for a [QuickbooksSalesItemLineDetails]
class QuickbooksMarkupInfo {
  QuickbooksReferenceType? priceLevelRef;
  double? percent;
  QuickbooksReferenceType? markupIncomeAccountRef;
  QuickbooksMarkupInfo({
    this.priceLevelRef,
    this.percent,
    this.markupIncomeAccountRef,
  });

  QuickbooksMarkupInfo copyWith({
    QuickbooksReferenceType? priceLevelRef,
    double? percent,
    QuickbooksReferenceType? markupIncomeAccountRef,
  }) {
    return QuickbooksMarkupInfo(
      priceLevelRef: priceLevelRef ?? this.priceLevelRef,
      percent: percent ?? this.percent,
      markupIncomeAccountRef:
          markupIncomeAccountRef ?? this.markupIncomeAccountRef,
    );
  }

  /// Converts to a map value
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'PriceLevelRef': priceLevelRef?.toMap(),
      'Percent': percent,
      'MarkUpIncomeAccountRef': markupIncomeAccountRef?.toMap(),
    };
  }

  /// Converts from a map value
  factory QuickbooksMarkupInfo.fromMap(Map<String, dynamic> map) {
    return QuickbooksMarkupInfo(
      priceLevelRef: map['PriceLevelRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['PriceLevelRef'] as Map<String, dynamic>)
          : null,
      percent: double.tryParse(map['Percent'].toString()),
      markupIncomeAccountRef: map['MarkUpIncomeAccountRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['MarkUpIncomeAccountRef'] as Map<String, dynamic>)
          : null,
    );
  }

  /// Converts to a json value
  String toJson() => json.encode(toMap());

  /// Converts from a json value
  factory QuickbooksMarkupInfo.fromJson(String source) =>
      QuickbooksMarkupInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MarkupInfo(priceLevelRef: $priceLevelRef, percent: $percent, markupIncomeAccountRef: $markupIncomeAccountRef)';

  @override
  bool operator ==(covariant QuickbooksMarkupInfo other) {
    if (identical(this, other)) return true;

    return other.priceLevelRef == priceLevelRef &&
        other.percent == percent &&
        other.markupIncomeAccountRef == markupIncomeAccountRef;
  }

  @override
  int get hashCode =>
      priceLevelRef.hashCode ^
      percent.hashCode ^
      markupIncomeAccountRef.hashCode;
}
