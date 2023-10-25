// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import 'package:quickbooks/entities/entity.export.dart';

/// Purchase for quickbooks
class QuickbooksPurchase {
  String? id;
  List<QuickbooksLine>? line;
  String? paymentType;
  QuickbooksReferenceType? accountRef;
  String? syncToken;
  QuickbooksReferenceType? currencyRef;
  DateTime? txnDate;
  String? printStatus;
  QuickbooksPhysicalAddress? remitToAddr;
  String? txnSource;
  List<QuickbooksLinkedTxn>? linkedTxn;
  String? globalTaxCalculation;
  String? transactionLocationType;
  Map<String, dynamic>? metaData;
  String? docNumber;
  String? privateNote;
  bool? credit;
  QuickbooksTxnTaxDetails? txnTaxDetail;
  QuickbooksReferenceType? paymentMethodRef;
  double? exchangeRate;
  QuickbooksReferenceType? departmentRef;
  QuickbooksReferenceType? entityRef;
  bool? includeInAnnualTPAR;
  double? totalAmt;
  QuickbooksReferenceType? recurDataRef;
  QuickbooksPurchase({
    this.id,
    this.line,
    this.paymentType,
    this.accountRef,
    this.syncToken,
    this.currencyRef,
    this.txnDate,
    this.printStatus,
    this.remitToAddr,
    this.txnSource,
    this.linkedTxn,
    this.globalTaxCalculation,
    this.transactionLocationType,
    this.metaData,
    this.docNumber,
    this.privateNote,
    this.credit,
    this.txnTaxDetail,
    this.paymentMethodRef,
    this.exchangeRate,
    this.departmentRef,
    this.entityRef,
    this.includeInAnnualTPAR,
    this.totalAmt,
    this.recurDataRef,
  });

  QuickbooksPurchase copyWith({
    String? id,
    List<QuickbooksLine>? line,
    String? paymentType,
    QuickbooksReferenceType? accountRef,
    String? syncToken,
    QuickbooksReferenceType? currencyRef,
    DateTime? txnDate,
    String? printStatus,
    QuickbooksPhysicalAddress? remitToAddr,
    String? txnSource,
    List<QuickbooksLinkedTxn>? linkedTxn,
    String? globalTaxCalculation,
    String? transactionLocationType,
    Map<String, dynamic>? metaData,
    String? docNumber,
    String? privateNote,
    bool? credit,
    QuickbooksTxnTaxDetails? txnTaxDetail,
    QuickbooksReferenceType? paymentMethodRef,
    double? exchangeRate,
    QuickbooksReferenceType? departmentRef,
    QuickbooksReferenceType? entityRef,
    bool? includeInAnnualTPAR,
    double? totalAmt,
    QuickbooksReferenceType? recurDataRef,
  }) {
    return QuickbooksPurchase(
      id: id ?? this.id,
      line: line ?? this.line,
      paymentType: paymentType ?? this.paymentType,
      accountRef: accountRef ?? this.accountRef,
      syncToken: syncToken ?? this.syncToken,
      currencyRef: currencyRef ?? this.currencyRef,
      txnDate: txnDate ?? this.txnDate,
      printStatus: printStatus ?? this.printStatus,
      remitToAddr: remitToAddr ?? this.remitToAddr,
      txnSource: txnSource ?? this.txnSource,
      linkedTxn: linkedTxn ?? this.linkedTxn,
      globalTaxCalculation: globalTaxCalculation ?? this.globalTaxCalculation,
      transactionLocationType:
          transactionLocationType ?? this.transactionLocationType,
      metaData: metaData ?? this.metaData,
      docNumber: docNumber ?? this.docNumber,
      privateNote: privateNote ?? this.privateNote,
      credit: credit ?? this.credit,
      txnTaxDetail: txnTaxDetail ?? this.txnTaxDetail,
      paymentMethodRef: paymentMethodRef ?? this.paymentMethodRef,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      departmentRef: departmentRef ?? this.departmentRef,
      entityRef: entityRef ?? this.entityRef,
      includeInAnnualTPAR: includeInAnnualTPAR ?? this.includeInAnnualTPAR,
      totalAmt: totalAmt ?? this.totalAmt,
      recurDataRef: recurDataRef ?? this.recurDataRef,
    );
  }

  Map<String, dynamic> toMap({bool withId = true}) {
    return <String, dynamic>{
      if (withId) 'Id': id,
      'Line': line?.map((x) => x.toMap()).toList(),
      'PaymentType': paymentType,
      'AccountRef': accountRef?.toMap(),
      'SyncToken': syncToken,
      'CurrencyRef': currencyRef?.toMap(),
      'TxnDate':
          txnDate != null ? DateFormat('yyyy-MM-dd').format(txnDate!) : null,
      'PrintStatus': printStatus,
      'RemitToAddr': remitToAddr?.toMap(),
      'TxnSource': txnSource,
      'LinkedTxn': linkedTxn?.map((x) => x.toMap()).toList(),
      'GlobalTaxCalculation': globalTaxCalculation,
      'TransactionLocationType': transactionLocationType,
      'MetaData': metaData,
      'DocNumber': docNumber,
      'PrivateNote': privateNote,
      'Credit': credit,
      'TxnTaxDetail': txnTaxDetail?.toMap(),
      'PaymentMethodRef': paymentMethodRef?.toMap(),
      'ExchangeRate': exchangeRate,
      'DepartmentRef': departmentRef?.toMap(),
      'EntityRef': entityRef?.toMap(),
      'IncludeInAnnualTPAR': includeInAnnualTPAR,
      'TotalAmt': totalAmt,
      'RecurDataRef': recurDataRef?.toMap(),
    };
  }

  factory QuickbooksPurchase.fromMap(Map<String, dynamic> map) {
    return QuickbooksPurchase(
      id: map['Id'],
      line: map['Line'] != null
          ? List<QuickbooksLine>.from(
              (map['Line'] as List).map<QuickbooksLine?>(
                (x) => QuickbooksLine.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      paymentType: map['PaymentType'],
      accountRef: map['AccountRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['AccountRef'] as Map<String, dynamic>)
          : null,
      syncToken: map['SyncToken'],
      currencyRef: map['CurrencyRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['CurrencyRef'] as Map<String, dynamic>)
          : null,
      txnDate: DateTime.tryParse(map['TxnDate'].toString()),
      printStatus: map['PrintStatus'],
      remitToAddr: map['RemitToAddr'] != null
          ? QuickbooksPhysicalAddress.fromMap(
              map['RemitToAddr'] as Map<String, dynamic>)
          : null,
      txnSource: map['TxnSource'],
      linkedTxn: map['LinkedTxn'] != null
          ? List<QuickbooksLinkedTxn>.from(
              (map['LinkedTxn'] as List).map<QuickbooksLinkedTxn?>(
                (x) => QuickbooksLinkedTxn.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      globalTaxCalculation: map['GlobalTaxCalculation'],
      transactionLocationType: map['TransactionLocationType'],
      metaData: map['MetaData'],
      docNumber: map['DocNumber'],
      privateNote: map['PrivateNote'],
      credit: map['Credit'],
      txnTaxDetail: map['TxnTaxDetail'] != null
          ? QuickbooksTxnTaxDetails.fromMap(
              map['TxnTaxDetail'] as Map<String, dynamic>)
          : null,
      paymentMethodRef: map['PaymentMethodRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['PaymentMethodRef'] as Map<String, dynamic>)
          : null,
      exchangeRate: double.tryParse(map['ExchangeRate'].toString()),
      departmentRef: map['DepartmentRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['DepartmentRef'] as Map<String, dynamic>)
          : null,
      entityRef: map['EntityRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['EntityRef'] as Map<String, dynamic>)
          : null,
      includeInAnnualTPAR: map['IncludeInAnnualTPAR'],
      totalAmt: double.tryParse(map['TotalAmt'].toString()),
      recurDataRef: map['RecurDataRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['RecurDataRef'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksPurchase.fromJson(String source) =>
      QuickbooksPurchase.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksPurchase(id: $id, line: $line, paymentType: $paymentType, accountRef: $accountRef, syncToken: $syncToken, currencyRef: $currencyRef, '
        'txnDate: $txnDate, printStatus: $printStatus, remitToAddr: $remitToAddr, txnSource: $txnSource, linkedTxn: $linkedTxn, '
        'globalTaxCalculation: $globalTaxCalculation, transactionLocationType: $transactionLocationType, metaData: $metaData, docNumber: $docNumber, '
        'privateNote: $privateNote, credit: $credit, txnTaxDetail: $txnTaxDetail, paymentMethodRef: $paymentMethodRef, exchangeRate: $exchangeRate, '
        'departmentRef: $departmentRef, entityRef: $entityRef, includeInAnnualTPAR: $includeInAnnualTPAR, totalAmt: $totalAmt, recurDataRef: $recurDataRef, '
        ')';
  }

  @override
  bool operator ==(covariant QuickbooksPurchase other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        collectionEquals(other.line, line) &&
        other.paymentType == paymentType &&
        other.accountRef == accountRef &&
        other.syncToken == syncToken &&
        other.currencyRef == currencyRef &&
        other.txnDate == txnDate &&
        other.printStatus == printStatus &&
        other.remitToAddr == remitToAddr &&
        other.txnSource == txnSource &&
        collectionEquals(other.linkedTxn, linkedTxn) &&
        other.globalTaxCalculation == globalTaxCalculation &&
        other.transactionLocationType == transactionLocationType &&
        collectionEquals(other.metaData, metaData) &&
        other.docNumber == docNumber &&
        other.privateNote == privateNote &&
        other.credit == credit &&
        other.txnTaxDetail == txnTaxDetail &&
        other.paymentMethodRef == paymentMethodRef &&
        other.exchangeRate == exchangeRate &&
        other.departmentRef == departmentRef &&
        other.entityRef == entityRef &&
        other.includeInAnnualTPAR == includeInAnnualTPAR &&
        other.totalAmt == totalAmt &&
        other.recurDataRef == recurDataRef;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        line.hashCode ^
        paymentType.hashCode ^
        accountRef.hashCode ^
        syncToken.hashCode ^
        currencyRef.hashCode ^
        txnDate.hashCode ^
        printStatus.hashCode ^
        remitToAddr.hashCode ^
        txnSource.hashCode ^
        linkedTxn.hashCode ^
        globalTaxCalculation.hashCode ^
        transactionLocationType.hashCode ^
        metaData.hashCode ^
        docNumber.hashCode ^
        privateNote.hashCode ^
        credit.hashCode ^
        txnTaxDetail.hashCode ^
        paymentMethodRef.hashCode ^
        exchangeRate.hashCode ^
        departmentRef.hashCode ^
        entityRef.hashCode ^
        includeInAnnualTPAR.hashCode ^
        totalAmt.hashCode ^
        recurDataRef.hashCode;
  }
}
