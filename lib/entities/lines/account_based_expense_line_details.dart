// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quickbooks/entities/entity.export.dart';

/// Details of a [QuickbooksAccountBasedExpenseLineDetails]
class QuickbooksAccountBasedExpenseLineDetails {
  QuickbooksReferenceType? accountRef;
  double? taxAmount;
  double? taxInclusiveAmt;
  QuickbooksReferenceType? taxCodeRef;
  QuickbooksReferenceType? classRef;
  QuickbooksMarkupInfo? markupInfo;
  String? billableStatus;
  QuickbooksReferenceType? customerRef;
  QuickbooksAccountBasedExpenseLineDetails({
    this.accountRef,
    this.taxAmount,
    this.taxInclusiveAmt,
    this.taxCodeRef,
    this.classRef,
    this.markupInfo,
    this.billableStatus,
    this.customerRef,
  });

  QuickbooksAccountBasedExpenseLineDetails copyWith({
    QuickbooksReferenceType? accountRef,
    double? taxAmount,
    double? taxInclusiveAmt,
    QuickbooksReferenceType? taxCodeRef,
    QuickbooksReferenceType? classRef,
    QuickbooksMarkupInfo? markupInfo,
    String? billableStatus,
    QuickbooksReferenceType? customerRef,
  }) {
    return QuickbooksAccountBasedExpenseLineDetails(
      accountRef: accountRef ?? this.accountRef,
      taxAmount: taxAmount ?? this.taxAmount,
      taxInclusiveAmt: taxInclusiveAmt ?? this.taxInclusiveAmt,
      taxCodeRef: taxCodeRef ?? this.taxCodeRef,
      classRef: classRef ?? this.classRef,
      markupInfo: markupInfo ?? this.markupInfo,
      billableStatus: billableStatus ?? this.billableStatus,
      customerRef: customerRef ?? this.customerRef,
    );
  }

  /// Converts to a map value
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'AccountRef': accountRef?.toMap(),
      'TaxAmount': taxAmount,
      'TaxInclusiveAmt': taxInclusiveAmt,
      'TaxCodeRef': taxCodeRef?.toMap(),
      'ClassRef': classRef?.toMap(),
      'MarkupInfo': markupInfo?.toMap(),
      'BillableStatus': billableStatus,
      'CustomerRef': customerRef?.toMap(),
    };
  }

  /// Converts from a map value
  factory QuickbooksAccountBasedExpenseLineDetails.fromMap(
      Map<String, dynamic> map) {
    return QuickbooksAccountBasedExpenseLineDetails(
      accountRef: map['AccountRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['AccountRef'] as Map<String, dynamic>)
          : null,
      taxAmount: double.tryParse(map['TaxAmount'].toString()),
      taxInclusiveAmt: double.tryParse(map['TaxInclusiveAmt'].toString()),
      taxCodeRef: map['TaxCodeRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['TaxCodeRef'] as Map<String, dynamic>)
          : null,
      classRef: map['ClassRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['ClassRef'] as Map<String, dynamic>)
          : null,
      markupInfo: map['MarkupInfo'] != null
          ? QuickbooksMarkupInfo.fromMap(
              map['MarkupInfo'] as Map<String, dynamic>)
          : null,
      billableStatus: map['BillableStatus'],
      customerRef: map['CustomerRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['CustomerRef'] as Map<String, dynamic>)
          : null,
    );
  }

  /// Converts to a json value
  String toJson() => json.encode(toMap());

  /// Converts from a json value
  factory QuickbooksAccountBasedExpenseLineDetails.fromJson(String source) =>
      QuickbooksAccountBasedExpenseLineDetails.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksAccountBasedExpenseLineDetails(accountRef: $accountRef, taxAmount: $taxAmount, taxInclusiveAmt: $taxInclusiveAmt, taxCodeRef: $taxCodeRef, classRef: $classRef, markupInfo: $markupInfo, billableStatus: $billableStatus, customerRef: $customerRef)';
  }

  @override
  bool operator ==(covariant QuickbooksAccountBasedExpenseLineDetails other) {
    if (identical(this, other)) return true;

    return other.accountRef == accountRef &&
        other.taxAmount == taxAmount &&
        other.taxInclusiveAmt == taxInclusiveAmt &&
        other.taxCodeRef == taxCodeRef &&
        other.classRef == classRef &&
        other.markupInfo == markupInfo &&
        other.billableStatus == billableStatus &&
        other.customerRef == customerRef;
  }

  @override
  int get hashCode {
    return accountRef.hashCode ^
        taxAmount.hashCode ^
        taxInclusiveAmt.hashCode ^
        taxCodeRef.hashCode ^
        classRef.hashCode ^
        markupInfo.hashCode ^
        billableStatus.hashCode ^
        customerRef.hashCode;
  }
}
