// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quickbooks/entities/entity.export.dart';

/// Details of a [QuickbooksItemBasedExpenseLineDetails]
class QuickbooksItemBasedExpenseLineDetails {
  double? taxInclusiveAmt;
  QuickbooksReferenceType? itemRef;
  QuickbooksReferenceType? customerRef;
  QuickbooksReferenceType? priceLevelRef;
  QuickbooksReferenceType? classRef;
  QuickbooksReferenceType? taxCodeRef;
  QuickbooksMarkupInfo? markupInfo;
  String? billableStatus;
  double? qty;
  double? unitPrice;
  QuickbooksItemBasedExpenseLineDetails({
    this.taxInclusiveAmt,
    this.itemRef,
    this.customerRef,
    this.priceLevelRef,
    this.classRef,
    this.taxCodeRef,
    this.markupInfo,
    this.billableStatus,
    this.qty,
    this.unitPrice,
  });

  QuickbooksItemBasedExpenseLineDetails copyWith({
    double? taxInclusiveAmt,
    QuickbooksReferenceType? itemRef,
    QuickbooksReferenceType? customerRef,
    QuickbooksReferenceType? priceLevelRef,
    QuickbooksReferenceType? classRef,
    QuickbooksReferenceType? taxCodeRef,
    QuickbooksMarkupInfo? markupInfo,
    String? billableStatus,
    double? qty,
    double? unitPrice,
  }) {
    return QuickbooksItemBasedExpenseLineDetails(
      taxInclusiveAmt: taxInclusiveAmt ?? this.taxInclusiveAmt,
      itemRef: itemRef ?? this.itemRef,
      customerRef: customerRef ?? this.customerRef,
      priceLevelRef: priceLevelRef ?? this.priceLevelRef,
      classRef: classRef ?? this.classRef,
      taxCodeRef: taxCodeRef ?? this.taxCodeRef,
      markupInfo: markupInfo ?? this.markupInfo,
      billableStatus: billableStatus ?? this.billableStatus,
      qty: qty ?? this.qty,
      unitPrice: unitPrice ?? this.unitPrice,
    );
  }

  /// Converts to a map value
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'TaxInclusiveAmt': taxInclusiveAmt,
      'ItemRef': itemRef?.toMap(),
      'CustomerRef': customerRef?.toMap(),
      'PriceLevelRef': priceLevelRef?.toMap(),
      'ClassRef': classRef?.toMap(),
      'TaxCodeRef': taxCodeRef?.toMap(),
      'MarkupInfo': markupInfo?.toMap(),
      'BillableStatus': billableStatus,
      'Qty': qty,
      'UnitPrice': unitPrice,
    };
  }

  /// Converts from a map value
  factory QuickbooksItemBasedExpenseLineDetails.fromMap(
      Map<String, dynamic> map) {
    return QuickbooksItemBasedExpenseLineDetails(
        taxInclusiveAmt: double.tryParse(map['TaxInclusiveAmt'].toString()),
        itemRef: map['ItemRef'] != null
            ? QuickbooksReferenceType.fromMap(
                map['ItemRef'] as Map<String, dynamic>)
            : null,
        customerRef: map['CustomerRef'] != null
            ? QuickbooksReferenceType.fromMap(
                map['CustomerRef'] as Map<String, dynamic>)
            : null,
        priceLevelRef: map['PriceLevelRef'] != null
            ? QuickbooksReferenceType.fromMap(
                map['PriceLevelRef'] as Map<String, dynamic>)
            : null,
        classRef: map['ClassRef'] != null
            ? QuickbooksReferenceType.fromMap(
                map['ClassRef'] as Map<String, dynamic>)
            : null,
        taxCodeRef: map['TaxCodeRef'] != null
            ? QuickbooksReferenceType.fromMap(
                map['TaxCodeRef'] as Map<String, dynamic>)
            : null,
        markupInfo: map['MarkupInfo'] != null
            ? QuickbooksMarkupInfo.fromMap(
                map['MarkupInfo'] as Map<String, dynamic>)
            : null,
        billableStatus: map['BillableStatus'],
        qty: double.tryParse(map['Qty'].toString()),
        unitPrice: double.tryParse(map['UnitPrice'].toString()));
  }

  /// Converts to a json value
  String toJson() => json.encode(toMap());

  /// Converts from a json value
  factory QuickbooksItemBasedExpenseLineDetails.fromJson(String source) =>
      QuickbooksItemBasedExpenseLineDetails.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksItemBasedExpenseLineDetails(taxInclusiveAmt: $taxInclusiveAmt, itemRef: $itemRef, customerRef: $customerRef, priceLevelRef: $priceLevelRef, classRef: $classRef, taxCodeRef: $taxCodeRef, markupInfo: $markupInfo, billableStatus: $billableStatus, qty: $qty, unitPrice: $unitPrice)';
  }

  @override
  bool operator ==(covariant QuickbooksItemBasedExpenseLineDetails other) {
    if (identical(this, other)) return true;

    return other.taxInclusiveAmt == taxInclusiveAmt &&
        other.itemRef == itemRef &&
        other.customerRef == customerRef &&
        other.priceLevelRef == priceLevelRef &&
        other.classRef == classRef &&
        other.taxCodeRef == taxCodeRef &&
        other.markupInfo == markupInfo &&
        other.billableStatus == billableStatus &&
        other.qty == qty &&
        other.unitPrice == unitPrice;
  }

  @override
  int get hashCode {
    return taxInclusiveAmt.hashCode ^
        itemRef.hashCode ^
        customerRef.hashCode ^
        priceLevelRef.hashCode ^
        classRef.hashCode ^
        taxCodeRef.hashCode ^
        markupInfo.hashCode ^
        billableStatus.hashCode ^
        qty.hashCode ^
        unitPrice.hashCode;
  }
}
