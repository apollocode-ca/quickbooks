// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quickbooks/entities/entity.export.dart';

/// Details of a [QuickbooksTaxLine]
class QuickbooksTaxLineDetails {
  QuickbooksReferenceType taxRateRef;
  double? netAmountTaxable;
  bool? percentBased;
  double? taxInclusiveAmount;
  double? overrideDeltaAmount;
  double? taxPercent;
  QuickbooksTaxLineDetails({
    required this.taxRateRef,
    this.netAmountTaxable,
    this.percentBased,
    this.taxInclusiveAmount,
    this.overrideDeltaAmount,
    this.taxPercent,
  });

  QuickbooksTaxLineDetails copyWith({
    QuickbooksReferenceType? taxRateRef,
    double? netAmountTaxable,
    bool? percentBased,
    double? taxInclusiveAmount,
    double? overrideDeltaAmount,
    double? taxPercent,
  }) {
    return QuickbooksTaxLineDetails(
      taxRateRef: taxRateRef ?? this.taxRateRef,
      netAmountTaxable: netAmountTaxable ?? this.netAmountTaxable,
      percentBased: percentBased ?? this.percentBased,
      taxInclusiveAmount: taxInclusiveAmount ?? this.taxInclusiveAmount,
      overrideDeltaAmount: overrideDeltaAmount ?? this.overrideDeltaAmount,
      taxPercent: taxPercent ?? this.taxPercent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'TaxRateRef': taxRateRef.toMap(),
      'NetAmountTaxable': netAmountTaxable,
      'PercentBased': percentBased,
      'TaxInclusiveAmount': taxInclusiveAmount,
      'OverrideDeltaAmount': overrideDeltaAmount,
      'TaxPercent': taxPercent,
    };
  }

  factory QuickbooksTaxLineDetails.fromMap(Map<String, dynamic> map) {
    return QuickbooksTaxLineDetails(
        taxRateRef: QuickbooksReferenceType.fromMap(
            map['TaxRateRef'] as Map<String, dynamic>),
        netAmountTaxable: double.tryParse(map['NetAmountTaxable'].toString()),
        percentBased: map['PercentBased'],
        taxInclusiveAmount:
            double.tryParse(map['TaxInclusiveAmount'].toString()),
        overrideDeltaAmount:
            double.tryParse(map['OverrideDeltaAmount'].toString()),
        taxPercent: double.tryParse(map['TaxPercent'].toString()));
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksTaxLineDetails.fromJson(String source) =>
      QuickbooksTaxLineDetails.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksTaxLineDetails(taxRateRef: $taxRateRef, netAmountTaxable: $netAmountTaxable, percentBased: $percentBased, taxInclusiveAmount: $taxInclusiveAmount, overrideDeltaAmount: $overrideDeltaAmount, taxPercent: $taxPercent)';
  }

  @override
  bool operator ==(covariant QuickbooksTaxLineDetails other) {
    if (identical(this, other)) return true;

    return other.taxRateRef == taxRateRef &&
        other.netAmountTaxable == netAmountTaxable &&
        other.percentBased == percentBased &&
        other.taxInclusiveAmount == taxInclusiveAmount &&
        other.overrideDeltaAmount == overrideDeltaAmount &&
        other.taxPercent == taxPercent;
  }

  @override
  int get hashCode {
    return taxRateRef.hashCode ^
        netAmountTaxable.hashCode ^
        percentBased.hashCode ^
        taxInclusiveAmount.hashCode ^
        overrideDeltaAmount.hashCode ^
        taxPercent.hashCode;
  }
}
