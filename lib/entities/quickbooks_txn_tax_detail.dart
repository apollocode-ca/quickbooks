// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:quickbooks/entities/entity.export.dart';

/// Tax details of a [QuickbooksInvoice]
class QuickbooksTxnTaxDetails {
  QuickbooksReferenceType? txnTaxCodeRef;
  double? totalTax;
  List<QuickbooksLine>? taxLine;
  QuickbooksTxnTaxDetails({
    this.txnTaxCodeRef,
    this.totalTax,
    this.taxLine,
  });

  QuickbooksTxnTaxDetails copyWith({
    QuickbooksReferenceType? txnTaxCodeRef,
    double? totalTax,
    List<QuickbooksLine>? taxLine,
  }) {
    return QuickbooksTxnTaxDetails(
      txnTaxCodeRef: txnTaxCodeRef ?? this.txnTaxCodeRef,
      totalTax: totalTax ?? this.totalTax,
      taxLine: taxLine ?? this.taxLine,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'TxnTaxCodeRef': txnTaxCodeRef?.toMap(),
      'TotalTax': totalTax,
      'TaxLine': taxLine?.map((x) => x.toMap()).toList(),
    };
  }

  factory QuickbooksTxnTaxDetails.fromMap(Map<String, dynamic> map) {
    return QuickbooksTxnTaxDetails(
      txnTaxCodeRef: map['TxnTaxCodeRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['TxnTaxCodeRef'] as Map<String, dynamic>)
          : null,
      totalTax: double.tryParse(map['TotalTax'].toString()),
      taxLine: map['TaxLine'] != null
          ? List<QuickbooksLine>.from(
              (map['TaxLine'] as List).map<QuickbooksLine?>(
                (x) => QuickbooksLine.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksTxnTaxDetails.fromJson(String source) =>
      QuickbooksTxnTaxDetails.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuickbooksTxnTaxDetails(txnTaxCodeRef: $txnTaxCodeRef, totalTax: $totalTax, taxLine: $taxLine)';

  @override
  bool operator ==(covariant QuickbooksTxnTaxDetails other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.txnTaxCodeRef == txnTaxCodeRef &&
        other.totalTax == totalTax &&
        listEquals(other.taxLine, taxLine);
  }

  @override
  int get hashCode =>
      txnTaxCodeRef.hashCode ^ totalTax.hashCode ^ taxLine.hashCode;
}
