// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:quickbooks/entities/entity.export.dart';

/// Entity for all payments in quickbooks
class QuickbooksPayment {
  String? id;
  double totalAmt;
  QuickbooksReferenceType customerRef;
  String? syncToken;
  QuickbooksReferenceType? currencyRef;
  String? privateNote;
  QuickbooksReferenceType? paymentMethodRef;
  double? unappliedAmt;
  QuickbooksReferenceType? depositToAccountRef;
  double? exchangeRate;
  List<QuickbooksPaymentLine>? line;
  String? txnSource;
  QuickbooksReferenceType? ARAccountRef;
  DateTime? txnDate;
  QuickbooksCreditCardPayment? creditCardPayment;
  String? transactionLocationType;
  Map<String, dynamic>? metaData;
  String? paymentRefNum;
  QuickbooksReferenceType? taxExemptionRef;
  QuickbooksPayment({
    this.id,
    required this.totalAmt,
    required this.customerRef,
    this.syncToken,
    this.currencyRef,
    this.privateNote,
    this.paymentMethodRef,
    this.unappliedAmt,
    this.depositToAccountRef,
    this.exchangeRate,
    this.line,
    this.txnSource,
    this.ARAccountRef,
    this.txnDate,
    this.creditCardPayment,
    this.transactionLocationType,
    this.metaData,
    this.paymentRefNum,
    this.taxExemptionRef,
  });

  QuickbooksPayment copyWith({
    String? id,
    double? totalAmt,
    QuickbooksReferenceType? customerRef,
    String? syncToken,
    QuickbooksReferenceType? currencyRef,
    String? privateNote,
    QuickbooksReferenceType? paymentMethodRef,
    double? unappliedAmt,
    QuickbooksReferenceType? depositToAccountRef,
    double? exchangeRate,
    List<QuickbooksPaymentLine>? line,
    String? txnSource,
    QuickbooksReferenceType? ARAccountRef,
    DateTime? txnDate,
    QuickbooksCreditCardPayment? creditCardPayment,
    String? transactionLocationType,
    Map<String, dynamic>? metaData,
    String? paymentRefNum,
    QuickbooksReferenceType? taxExempionRef,
  }) {
    return QuickbooksPayment(
      id: id ?? this.id,
      totalAmt: totalAmt ?? this.totalAmt,
      customerRef: customerRef ?? this.customerRef,
      syncToken: syncToken ?? this.syncToken,
      currencyRef: currencyRef ?? this.currencyRef,
      privateNote: privateNote ?? this.privateNote,
      paymentMethodRef: paymentMethodRef ?? this.paymentMethodRef,
      unappliedAmt: unappliedAmt ?? this.unappliedAmt,
      depositToAccountRef: depositToAccountRef ?? this.depositToAccountRef,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      line: line ?? this.line,
      txnSource: txnSource ?? this.txnSource,
      ARAccountRef: ARAccountRef ?? this.ARAccountRef,
      txnDate: txnDate ?? this.txnDate,
      creditCardPayment: creditCardPayment ?? this.creditCardPayment,
      transactionLocationType:
          transactionLocationType ?? this.transactionLocationType,
      metaData: metaData ?? this.metaData,
      paymentRefNum: paymentRefNum ?? this.paymentRefNum,
      taxExemptionRef: taxExempionRef ?? taxExemptionRef,
    );
  }

  Map<String, dynamic> toMap({bool withId = true}) {
    return <String, dynamic>{
      if (withId) 'Id': id,
      'TotalAmt': totalAmt,
      'CustomerRef': customerRef.toMap(),
      'SyncToken': syncToken,
      'CurrencyRef': currencyRef?.toMap(),
      'PrivateNote': privateNote,
      'PaymentMethodRef': paymentMethodRef?.toMap(),
      'UnappliedAmt': unappliedAmt,
      'DepositToAccountRef': depositToAccountRef?.toMap(),
      'ExchangeRate': exchangeRate,
      'Line': line?.map((x) => x.toMap()).toList(),
      'TxnSource': txnSource,
      'ARAccountRef': ARAccountRef?.toMap(),
      'TxnDate': txnDate?.toString(),
      'CreditCardPayment': creditCardPayment?.toMap(),
      'TransactionLocationType': transactionLocationType,
      'MetaData': metaData,
      'PaymentRefNum': paymentRefNum,
      'TaxExemptionRef': taxExemptionRef?.toMap(),
    };
  }

  factory QuickbooksPayment.fromMap(Map<String, dynamic> map) {
    return QuickbooksPayment(
      id: map['Id'],
      totalAmt: double.tryParse(map['totalAmt'].toString()) ?? 0,
      customerRef: QuickbooksReferenceType.fromMap(
          map['CustomerRef'] as Map<String, dynamic>),
      syncToken: map['SyncToken'],
      currencyRef: map['CurrencyRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['CurrencyRef'] as Map<String, dynamic>)
          : null,
      privateNote: map['PrivateNote'],
      paymentMethodRef: map['PaymentMethodRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['PaymentMethodRef'] as Map<String, dynamic>)
          : null,
      unappliedAmt: double.tryParse(map['UnappliedAmt'].toString()),
      depositToAccountRef: map['DepositToAccountRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['DepositToAccountRef'] as Map<String, dynamic>)
          : null,
      exchangeRate: double.tryParse(map['ExchangeRate'].toString()),
      line: map['Line'] != null
          ? List<QuickbooksPaymentLine>.from(
              (map['Line'] as List).map<QuickbooksPaymentLine?>(
                (x) => QuickbooksPaymentLine.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      txnSource: map['TxnSource'],
      ARAccountRef: map['ARAccountRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['ARAccountRef'] as Map<String, dynamic>)
          : null,
      txnDate: DateTime.tryParse(map['TxnDate'].toString()),
      creditCardPayment: map['CreditCardPayment'] != null
          ? QuickbooksCreditCardPayment.fromMap(
              map['CreditCardPayment'] as Map<String, dynamic>)
          : null,
      transactionLocationType: map['TransactionLocationType'],
      metaData: map['MetaData'],
      paymentRefNum: map['PaymentRefNum'],
      taxExemptionRef: map['TaxExemptionRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['TaxExemptionRef'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksPayment.fromJson(String source) =>
      QuickbooksPayment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksPayment(id: $id, totalAmt: $totalAmt, customerRef: $customerRef, syncToken: $syncToken, currencyRef: $currencyRef, privateNote: $privateNote, paymentMethodRef: $paymentMethodRef, unappliedAmt: $unappliedAmt, depositToAccountRef: $depositToAccountRef, exchangeRate: $exchangeRate, line: $line, txnSource: $txnSource, ARAccountRef: $ARAccountRef, txnDate: $txnDate, creditCardPayment: $creditCardPayment, transactionLocationType: $transactionLocationType, metaData: $metaData, paymentRefNum: $paymentRefNum, taxExempionRef: $taxExemptionRef)';
  }

  @override
  bool operator ==(covariant QuickbooksPayment other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.totalAmt == totalAmt &&
        other.customerRef == customerRef &&
        other.syncToken == syncToken &&
        other.currencyRef == currencyRef &&
        other.privateNote == privateNote &&
        other.paymentMethodRef == paymentMethodRef &&
        other.unappliedAmt == unappliedAmt &&
        other.depositToAccountRef == depositToAccountRef &&
        other.exchangeRate == exchangeRate &&
        collectionEquals(other.line, line) &&
        other.txnSource == txnSource &&
        other.ARAccountRef == ARAccountRef &&
        other.txnDate == txnDate &&
        other.creditCardPayment == creditCardPayment &&
        other.transactionLocationType == transactionLocationType &&
        collectionEquals(other.metaData, metaData) &&
        other.paymentRefNum == paymentRefNum &&
        other.taxExemptionRef == taxExemptionRef;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        totalAmt.hashCode ^
        customerRef.hashCode ^
        syncToken.hashCode ^
        currencyRef.hashCode ^
        privateNote.hashCode ^
        paymentMethodRef.hashCode ^
        unappliedAmt.hashCode ^
        depositToAccountRef.hashCode ^
        exchangeRate.hashCode ^
        line.hashCode ^
        txnSource.hashCode ^
        ARAccountRef.hashCode ^
        txnDate.hashCode ^
        creditCardPayment.hashCode ^
        transactionLocationType.hashCode ^
        metaData.hashCode ^
        paymentRefNum.hashCode ^
        taxExemptionRef.hashCode;
  }
}
