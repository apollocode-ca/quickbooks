// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quickbooks/entities/entity.export.dart';

/// Details of a [QuickbooksSalesItemLine]
class QuickbooksSalesItemLineDetails {
  double? taxInclusiveAmount;
  double? discountAmount;
  QuickbooksReferenceType? itemRef;
  QuickbooksReferenceType? classRef;
  QuickbooksReferenceType? taxCodeRef;
  QuickbooksMarkupInfo? markupInfo;
  QuickbooksReferenceType? itemAccountRef;
  DateTime? serviceDate;
  double? discountRate;
  double? qty;
  double? unitPrice;
  QuickbooksReferenceType? taxClassificationRef;
  QuickbooksSalesItemLineDetails({
    this.taxInclusiveAmount,
    this.discountAmount,
    this.itemRef,
    this.classRef,
    this.taxCodeRef,
    this.markupInfo,
    this.itemAccountRef,
    this.serviceDate,
    this.discountRate,
    this.qty,
    this.unitPrice,
    this.taxClassificationRef,
  });

  QuickbooksSalesItemLineDetails copyWith({
    double? taxInclusiveAmount,
    double? discountAmount,
    QuickbooksReferenceType? itemRef,
    QuickbooksReferenceType? classRef,
    QuickbooksReferenceType? taxCodeRef,
    QuickbooksMarkupInfo? markupInfo,
    QuickbooksReferenceType? itemAccountRef,
    DateTime? serviceDate,
    double? discountRate,
    double? qty,
    double? unitPrice,
    QuickbooksReferenceType? taxClassificationRef,
  }) {
    return QuickbooksSalesItemLineDetails(
      taxInclusiveAmount: taxInclusiveAmount ?? this.taxInclusiveAmount,
      discountAmount: discountAmount ?? this.discountAmount,
      itemRef: itemRef ?? this.itemRef,
      classRef: classRef ?? this.classRef,
      taxCodeRef: taxCodeRef ?? this.taxCodeRef,
      markupInfo: markupInfo ?? this.markupInfo,
      itemAccountRef: itemAccountRef ?? this.itemAccountRef,
      serviceDate: serviceDate ?? this.serviceDate,
      discountRate: discountRate ?? this.discountRate,
      qty: qty ?? this.qty,
      unitPrice: unitPrice ?? this.unitPrice,
      taxClassificationRef: taxClassificationRef ?? this.taxClassificationRef,
    );
  }

  /// Converts to a map value
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'TaxInclusiveAmount': taxInclusiveAmount,
      'DiscountAmt': discountAmount,
      'ItemRef': itemRef?.toMap(),
      'ClassRef': classRef?.toMap(),
      'TaxCodeRef': taxCodeRef?.toMap(),
      'MarkupInfo': markupInfo?.toMap(),
      'ItemAccountRef': itemAccountRef?.toMap(),
      'ServiceDate': serviceDate?.toString(),
      'DiscountRate': discountRate,
      'Qty': qty,
      'UnitPrice': unitPrice,
      'TaxClassificationRef': taxClassificationRef?.toMap(),
    };
  }

  /// Converts from a map value
  factory QuickbooksSalesItemLineDetails.fromMap(Map<String, dynamic> map) {
    return QuickbooksSalesItemLineDetails(
      taxInclusiveAmount: double.tryParse(map['TaxInclusiveAmount'].toString()),
      discountAmount: double.tryParse(map['DiscountAmt'].toString()),
      itemRef: map['ItemRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['ItemRef'] as Map<String, dynamic>)
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
      itemAccountRef: map['TtemAccountRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['TtemAccountRef'] as Map<String, dynamic>)
          : null,
      serviceDate: DateTime.tryParse(map['ServiceDate'].toString()),
      discountRate: double.tryParse(map['DiscountRate'].toString()),
      qty: double.tryParse(map['qty'].toString()),
      unitPrice: double.tryParse(map['UnitPrice'].toString()),
      taxClassificationRef: map['TaxClassificationRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['TaxClassificationRef'] as Map<String, dynamic>)
          : null,
    );
  }

  /// Converts to a json value
  String toJson() => json.encode(toMap());

  /// Converts from a json value
  factory QuickbooksSalesItemLineDetails.fromJson(String source) =>
      QuickbooksSalesItemLineDetails.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksSalesItemDetails(taxInclusiveAmount: $taxInclusiveAmount, discountAmount: $discountAmount, itemRef: $itemRef, classRef: $classRef, taxCodeRef: $taxCodeRef, markupInfo: $markupInfo, itemAccountRef: $itemAccountRef, serviceDate: $serviceDate, discountRate: $discountRate, qty: $qty, unitPrice: $unitPrice, taxClassificationRef: $taxClassificationRef)';
  }

  @override
  bool operator ==(covariant QuickbooksSalesItemLineDetails other) {
    if (identical(this, other)) return true;

    return other.taxInclusiveAmount == taxInclusiveAmount &&
        other.discountAmount == discountAmount &&
        other.itemRef == itemRef &&
        other.classRef == classRef &&
        other.taxCodeRef == taxCodeRef &&
        other.markupInfo == markupInfo &&
        other.itemAccountRef == itemAccountRef &&
        other.serviceDate == serviceDate &&
        other.discountRate == discountRate &&
        other.qty == qty &&
        other.unitPrice == unitPrice &&
        other.taxClassificationRef == taxClassificationRef;
  }

  @override
  int get hashCode {
    return taxInclusiveAmount.hashCode ^
        discountAmount.hashCode ^
        itemRef.hashCode ^
        classRef.hashCode ^
        taxCodeRef.hashCode ^
        markupInfo.hashCode ^
        itemAccountRef.hashCode ^
        serviceDate.hashCode ^
        discountRate.hashCode ^
        qty.hashCode ^
        unitPrice.hashCode ^
        taxClassificationRef.hashCode;
  }
}
