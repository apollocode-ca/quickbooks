// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import 'package:quickbooks/entities/entity.export.dart';
import 'package:quickbooks/enums/invoice/global_tax_calculation_type.enum.dart';

/// Entity for all invoices in quickbooks
class QuickbooksInvoice {
  String? id;
  List<QuickbooksLine> line;
  QuickbooksReferenceType customerRef;
  String? syncToken;
  QuickbooksReferenceType? currencyRef;
  String? docNumber;
  QuickbooksEmailAddress? billEmail;
  DateTime? txnDate;
  QuickbooksPhysicalAddress? shipFromAddr;
  DateTime? shipDate;
  String? trackingNum;
  QuickbooksReferenceType? classRef;
  String? printStatus;
  QuickbooksReferenceType? salesTermRef;
  String? txnSource;
  List<QuickbooksLinkedTxn>? linkedTxn;
  QuickbooksReferenceType? depositToAccountRef;
  QuickbooksGlobalTaxCalculationType? globalTaxCalculation;
  bool? allowOnlineACHPayment;
  String? transactionLocationType;
  DateTime? dueDate;
  Map<String, dynamic>? metaData;
  String? privateNote;
  QuickbooksEmailAddress? billEmailCc;
  QuickbooksMemoRef? customerMemo;
  String? emailStatus;
  double? exchangeRate;
  double? deposit;
  QuickbooksTxnTaxDetails? txnTaxDetail;
  bool? allowOnlineCreditCardPayment;
  List<Map<String, dynamic>>? customField;
  QuickbooksPhysicalAddress? shipAddr;
  QuickbooksReferenceType? departmentRef;
  QuickbooksEmailAddress? billEmailBcc;
  QuickbooksReferenceType? shipMethodRef;
  QuickbooksPhysicalAddress? billAddr;
  bool? applyTaxAfterDiscount;
  double? homeBalance;
  QuickbooksDeliveryInfo? deliveryInfo;
  double? totalAmt;
  String? invoiceLink;
  QuickbooksReferenceType? recurDataRef;
  QuickbooksReferenceType? taxExemptionRef;
  double? balance;
  double? homeTotalAmt;
  bool? freeFormAddress;
  QuickbooksInvoice({
    this.id,
    required this.line,
    required this.customerRef,
    this.syncToken,
    this.currencyRef,
    this.docNumber,
    this.billEmail,
    this.txnDate,
    this.shipFromAddr,
    this.shipDate,
    this.trackingNum,
    this.classRef,
    this.printStatus,
    this.salesTermRef,
    this.txnSource,
    this.linkedTxn,
    this.depositToAccountRef,
    this.globalTaxCalculation,
    this.allowOnlineACHPayment,
    this.transactionLocationType,
    this.dueDate,
    this.metaData,
    this.privateNote,
    this.billEmailCc,
    this.customerMemo,
    this.emailStatus,
    this.exchangeRate,
    this.deposit,
    this.txnTaxDetail,
    this.allowOnlineCreditCardPayment,
    this.customField,
    this.shipAddr,
    this.departmentRef,
    this.billEmailBcc,
    this.shipMethodRef,
    this.billAddr,
    this.applyTaxAfterDiscount,
    this.homeBalance,
    this.deliveryInfo,
    this.totalAmt,
    this.invoiceLink,
    this.recurDataRef,
    this.taxExemptionRef,
    this.balance,
    this.homeTotalAmt,
    this.freeFormAddress,
  });

  QuickbooksInvoice copyWith({
    String? id,
    List<QuickbooksLine>? line,
    QuickbooksReferenceType? customerRef,
    String? syncToken,
    QuickbooksReferenceType? currencyRef,
    String? docNumber,
    QuickbooksEmailAddress? billEmail,
    DateTime? txnDate,
    QuickbooksPhysicalAddress? shipFromAddr,
    DateTime? shipDate,
    String? trackingNum,
    QuickbooksReferenceType? classRef,
    String? printStatus,
    QuickbooksReferenceType? salesTermRef,
    String? txnSource,
    List<QuickbooksLinkedTxn>? linkedTxn,
    QuickbooksReferenceType? depositeToAccountRef,
    QuickbooksGlobalTaxCalculationType? globalTaxalculation,
    bool? allowOnlineACHPayment,
    String? transactionLocationType,
    DateTime? dueDate,
    Map<String, dynamic>? metaData,
    String? privateNote,
    QuickbooksEmailAddress? billEmailCc,
    QuickbooksMemoRef? customerMemo,
    String? emailStatus,
    double? exchangeRate,
    double? deposit,
    QuickbooksTxnTaxDetails? txnTaxDetail,
    bool? allowOnlineCreditCardPayment,
    List<Map<String, dynamic>>? customField,
    QuickbooksPhysicalAddress? shipAddr,
    QuickbooksReferenceType? departmentRef,
    QuickbooksEmailAddress? billEmailBcc,
    QuickbooksReferenceType? shipMethodRef,
    QuickbooksPhysicalAddress? billAddr,
    bool? applyTaxAfterDiscount,
    double? homeBalance,
    QuickbooksDeliveryInfo? deliveryInfo,
    double? totalAmt,
    String? invoiceLink,
    QuickbooksReferenceType? recurDataRef,
    QuickbooksReferenceType? taxExemptionRef,
    double? balance,
    double? homeTotalAmt,
    bool? freeFormAddress,
  }) {
    return QuickbooksInvoice(
      id: id ?? this.id,
      line: line ?? this.line,
      customerRef: customerRef ?? this.customerRef,
      syncToken: syncToken ?? this.syncToken,
      currencyRef: currencyRef ?? this.currencyRef,
      docNumber: docNumber ?? this.docNumber,
      billEmail: billEmail ?? this.billEmail,
      txnDate: txnDate ?? this.txnDate,
      shipFromAddr: shipFromAddr ?? this.shipFromAddr,
      shipDate: shipDate ?? this.shipDate,
      trackingNum: trackingNum ?? this.trackingNum,
      classRef: classRef ?? this.classRef,
      printStatus: printStatus ?? this.printStatus,
      salesTermRef: salesTermRef ?? this.salesTermRef,
      txnSource: txnSource ?? this.txnSource,
      linkedTxn: linkedTxn ?? this.linkedTxn,
      depositToAccountRef: depositeToAccountRef ?? depositToAccountRef,
      globalTaxCalculation: globalTaxalculation ?? globalTaxCalculation,
      allowOnlineACHPayment:
          allowOnlineACHPayment ?? this.allowOnlineACHPayment,
      transactionLocationType:
          transactionLocationType ?? this.transactionLocationType,
      dueDate: dueDate ?? this.dueDate,
      metaData: metaData ?? this.metaData,
      privateNote: privateNote ?? this.privateNote,
      billEmailCc: billEmailCc ?? this.billEmailCc,
      customerMemo: customerMemo ?? this.customerMemo,
      emailStatus: emailStatus ?? this.emailStatus,
      exchangeRate: exchangeRate ?? this.exchangeRate,
      deposit: deposit ?? this.deposit,
      txnTaxDetail: txnTaxDetail ?? this.txnTaxDetail,
      allowOnlineCreditCardPayment:
          allowOnlineCreditCardPayment ?? this.allowOnlineCreditCardPayment,
      customField: customField ?? this.customField,
      shipAddr: shipAddr ?? this.shipAddr,
      departmentRef: departmentRef ?? this.departmentRef,
      billEmailBcc: billEmailBcc ?? this.billEmailBcc,
      shipMethodRef: shipMethodRef ?? this.shipMethodRef,
      billAddr: billAddr ?? this.billAddr,
      applyTaxAfterDiscount:
          applyTaxAfterDiscount ?? this.applyTaxAfterDiscount,
      homeBalance: homeBalance ?? this.homeBalance,
      deliveryInfo: deliveryInfo ?? this.deliveryInfo,
      totalAmt: totalAmt ?? this.totalAmt,
      invoiceLink: invoiceLink ?? this.invoiceLink,
      recurDataRef: recurDataRef ?? this.recurDataRef,
      taxExemptionRef: taxExemptionRef ?? this.taxExemptionRef,
      balance: balance ?? this.balance,
      homeTotalAmt: homeTotalAmt ?? this.homeTotalAmt,
      freeFormAddress: freeFormAddress ?? this.freeFormAddress,
    );
  }

  Map<String, dynamic> toMap({bool withId = true}) {
    return <String, dynamic>{
      if (withId) 'Id': id,
      'Line': line.map((x) => x.toMap()).toList(),
      'CustomerRef': customerRef.toMap(),
      'SyncToken': syncToken,
      'CurrencyRef': currencyRef?.toMap(),
      'DocNumber': docNumber,
      'BillEmail': billEmail?.toMap(),
      'TxnDate':
          txnDate != null ? DateFormat('yyyy-MM-dd').format(txnDate!) : null,
      'ShipFromAddr': shipFromAddr?.toMap(),
      'ShipDate': shipDate?.toString(),
      'TrackingNum': trackingNum,
      'ClassRef': classRef?.toMap(),
      'PrintStatus': printStatus,
      'SalesTermRef': salesTermRef?.toMap(),
      'TxnSource': txnSource,
      'LinkedTxn': linkedTxn?.map((x) => x.toMap()).toList(),
      'DepositToAccountRef': depositToAccountRef?.toMap(),
      'GlobalTaxCalculation': globalTaxCalculation?.toJsonString(),
      'AllowOnlineACHPayment': allowOnlineACHPayment,
      'TransactionLocationType': transactionLocationType,
      'DueDate': dueDate?.toString(),
      'MetaData': metaData,
      'PrivateNote': privateNote,
      'BillEmailCc': billEmailCc?.toMap(),
      'CustomerMemo': customerMemo?.toMap(),
      'EmailStatus': emailStatus,
      'ExchangeRate': exchangeRate,
      'Deposit': deposit,
      'TxnTaxDetail': txnTaxDetail?.toMap(),
      'AllowOnlineCreditCardPayment': allowOnlineCreditCardPayment,
      'CustomField': customField,
      'ShipAddr': shipAddr?.toMap(),
      'DepartmentRef': departmentRef?.toMap(),
      'BillEmailBcc': billEmailBcc?.toMap(),
      'ShipMethodRef': shipMethodRef?.toMap(),
      'BillAddr': billAddr?.toMap(),
      'ApplyTaxAfterDiscount': applyTaxAfterDiscount,
      'HomeBalance': homeBalance,
      'DeliveryInfo': deliveryInfo?.toMap(),
      'TotalAmt': totalAmt,
      'InvoiceLink': invoiceLink,
      'RecurDataRef': recurDataRef?.toMap(),
      'TaxExemptionRef': taxExemptionRef?.toMap(),
      'Balance': balance,
      'HomeTotalAmt': homeTotalAmt,
      'FreeFormAddress': freeFormAddress,
    };
  }

  factory QuickbooksInvoice.fromMap(Map<String, dynamic> map) {
    return QuickbooksInvoice(
      id: map['Id'],
      line: List<QuickbooksLine>.from(
        (map['Line'] as List).map<QuickbooksLine>(
          (x) => QuickbooksLine.fromMap(x as Map<String, dynamic>),
        ),
      ),
      customerRef: QuickbooksReferenceType.fromMap(
          map['CustomerRef'] as Map<String, dynamic>),
      syncToken: map['SyncToken'],
      currencyRef: map['CurrencyRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['CurrencyRef'] as Map<String, dynamic>)
          : null,
      docNumber: map['DocNumber'],
      billEmail: map['BillEmail'] != null
          ? QuickbooksEmailAddress.fromMap(
              map['BillEmail'] as Map<String, dynamic>)
          : null,
      txnDate: DateTime.tryParse(map['TxnDate'].toString()),
      shipFromAddr: map['ShipFromAddr'] != null
          ? QuickbooksPhysicalAddress.fromMap(
              map['ShipFromAddr'] as Map<String, dynamic>)
          : null,
      shipDate: DateTime.tryParse(map['ShipDate'].toString()),
      trackingNum: map['TrackingNum'],
      classRef: map['ClassRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['ClassRef'] as Map<String, dynamic>)
          : null,
      printStatus: map['PrintStatus'],
      salesTermRef: map['SalesTermRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['SalesTermRef'] as Map<String, dynamic>)
          : null,
      txnSource: map['TxnSource'],
      linkedTxn: map['LinkedTxn'] != null
          ? List<QuickbooksLinkedTxn>.from(
              (map['LinkedTxn'] as List).map<QuickbooksLinkedTxn?>(
                (x) => QuickbooksLinkedTxn.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      depositToAccountRef: map['DepositToAccountRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['DepositToAccountRef'] as Map<String, dynamic>)
          : null,
      globalTaxCalculation: map['BlobalTaxCalculation'] != null
          ? QuickbooksGlobalTaxCalculationTypeExtension.fromJsonString(
              map['GlobalTaxCalculation'])
          : null,
      allowOnlineACHPayment: map['AllowOnlineACHPayment'],
      transactionLocationType: map['TransactionLocationType'],
      dueDate: DateTime.tryParse(map['DueDate'].toString()),
      metaData: map['MetaData'],
      privateNote: map['PrivateNote'],
      billEmailCc: map['BillEmailCc'] != null
          ? QuickbooksEmailAddress.fromMap(
              map['BillEmailCc'] as Map<String, dynamic>)
          : null,
      customerMemo: map['CustomerMemo'] != null
          ? QuickbooksMemoRef.fromMap(
              map['CustomerMemo'] as Map<String, dynamic>)
          : null,
      emailStatus: map['EmailStatus'],
      exchangeRate: double.tryParse(map['ExchangeRate'].toString()),
      deposit: double.tryParse(map['Deposit'].toString()),
      txnTaxDetail: map['TxnTaxDetail'] != null
          ? QuickbooksTxnTaxDetails.fromMap(
              map['TxnTaxDetail'] as Map<String, dynamic>)
          : null,
      allowOnlineCreditCardPayment: map['AllowOnlineCreditCardPayment'],
      customField: map['CustomField'] != null
          ? List<Map<String, dynamic>>.from(
              (map['CustomField'] as List).map<Map<String, dynamic>?>(
                (x) => x as Map<String, dynamic>,
              ),
            )
          : null,
      shipAddr: map['ShipAddr'] != null
          ? QuickbooksPhysicalAddress.fromMap(
              map['ShipAddr'] as Map<String, dynamic>)
          : null,
      departmentRef: map['DepartmentRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['DepartmentRef'] as Map<String, dynamic>)
          : null,
      billEmailBcc: map['BillEmailBcc'] != null
          ? QuickbooksEmailAddress.fromMap(
              map['BillEmailBcc'] as Map<String, dynamic>)
          : null,
      shipMethodRef: map['ShipMethodRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['ShipMethodRef'] as Map<String, dynamic>)
          : null,
      billAddr: map['BillAddr'] != null
          ? QuickbooksPhysicalAddress.fromMap(
              map['BillAddr'] as Map<String, dynamic>)
          : null,
      applyTaxAfterDiscount: map['ApplyTaxAfterDiscount'],
      homeBalance: double.tryParse(map['homeBalance'].toString()),
      deliveryInfo: map['DeliveryInfo'] != null
          ? QuickbooksDeliveryInfo.fromMap(
              map['DeliveryInfo'] as Map<String, dynamic>)
          : null,
      totalAmt: double.tryParse(map['TotalAmt'].toString()),
      invoiceLink: map['InvoiceLink'],
      recurDataRef: map['RecurDataRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['RecurDataRef'] as Map<String, dynamic>)
          : null,
      taxExemptionRef: map['TaxExemptionRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['TaxExemptionRef'] as Map<String, dynamic>)
          : null,
      balance: double.tryParse(map['Balance'].toString()),
      homeTotalAmt: double.tryParse(map['HomeTotalAmt'].toString()),
      freeFormAddress: map['FreeFormAddress'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksInvoice.fromJson(String source) =>
      QuickbooksInvoice.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksInvoice(id: $id, line: $line, customerRef: $customerRef, syncToken: $syncToken, currencyRef: $currencyRef, docNumber: $docNumber, '
        'billEmail: $billEmail, txnDate: $txnDate, shipFromAddr: $shipFromAddr, shipDate: $shipDate, trackingNum: $trackingNum, classRef: $classRef, '
        'printStatus: $printStatus, salesTermRef: $salesTermRef, txnSource: $txnSource, linkedTxn: $linkedTxn, depositeToAccountRef: $depositToAccountRef, '
        'globalTaxalculation: $globalTaxCalculation, allowOnlineACHPayment: $allowOnlineACHPayment, transactionLocationType: $transactionLocationType, '
        'dueDate: $dueDate, metaData: $metaData, privateNote: $privateNote, '
        'billEmailCc: $billEmailCc, customerMemo: $customerMemo, emailStatus: $emailStatus, exchangeRate: $exchangeRate, deposit: $deposit, '
        'txnTaxDetail: $txnTaxDetail, allowOnlineCreditCardPayment: $allowOnlineCreditCardPayment, customField: $customField, shipAddr: $shipAddr, '
        'departmentRef: $departmentRef, billEmailBcc: $billEmailBcc, shipMethodRef: $shipMethodRef, billAddr: $billAddr, '
        'applyTaxAfterDiscount: $applyTaxAfterDiscount, homeBalance: $homeBalance, deliveryInfo: $deliveryInfo, totalAmt: $totalAmt, invoiceLink: $invoiceLink, '
        'recurDataRef: $recurDataRef, taxExemptionRef: $taxExemptionRef, balance: $balance, homeTotalAmt: $homeTotalAmt, freeFormAddress: $freeFormAddress, '
        ')';
  }

  @override
  bool operator ==(covariant QuickbooksInvoice other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        collectionEquals(other.line, line) &&
        other.customerRef == customerRef &&
        other.syncToken == syncToken &&
        other.currencyRef == currencyRef &&
        other.docNumber == docNumber &&
        other.billEmail == billEmail &&
        other.txnDate == txnDate &&
        other.shipFromAddr == shipFromAddr &&
        other.shipDate == shipDate &&
        other.trackingNum == trackingNum &&
        other.classRef == classRef &&
        other.printStatus == printStatus &&
        other.salesTermRef == salesTermRef &&
        other.txnSource == txnSource &&
        collectionEquals(other.linkedTxn, linkedTxn) &&
        other.depositToAccountRef == depositToAccountRef &&
        other.globalTaxCalculation == globalTaxCalculation &&
        other.allowOnlineACHPayment == allowOnlineACHPayment &&
        other.transactionLocationType == transactionLocationType &&
        other.dueDate == dueDate &&
        collectionEquals(other.metaData, metaData) &&
        other.privateNote == privateNote &&
        other.billEmailCc == billEmailCc &&
        other.customerMemo == customerMemo &&
        other.emailStatus == emailStatus &&
        other.exchangeRate == exchangeRate &&
        other.deposit == deposit &&
        other.txnTaxDetail == txnTaxDetail &&
        other.allowOnlineCreditCardPayment == allowOnlineCreditCardPayment &&
        collectionEquals(other.customField, customField) &&
        other.shipAddr == shipAddr &&
        other.departmentRef == departmentRef &&
        other.billEmailBcc == billEmailBcc &&
        other.shipMethodRef == shipMethodRef &&
        other.billAddr == billAddr &&
        other.applyTaxAfterDiscount == applyTaxAfterDiscount &&
        other.homeBalance == homeBalance &&
        other.deliveryInfo == deliveryInfo &&
        other.totalAmt == totalAmt &&
        other.invoiceLink == invoiceLink &&
        other.recurDataRef == recurDataRef &&
        other.taxExemptionRef == taxExemptionRef &&
        other.balance == balance &&
        other.homeTotalAmt == homeTotalAmt &&
        other.freeFormAddress == freeFormAddress;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        line.hashCode ^
        customerRef.hashCode ^
        syncToken.hashCode ^
        currencyRef.hashCode ^
        docNumber.hashCode ^
        billEmail.hashCode ^
        txnDate.hashCode ^
        shipFromAddr.hashCode ^
        shipDate.hashCode ^
        trackingNum.hashCode ^
        classRef.hashCode ^
        printStatus.hashCode ^
        salesTermRef.hashCode ^
        txnSource.hashCode ^
        linkedTxn.hashCode ^
        depositToAccountRef.hashCode ^
        globalTaxCalculation.hashCode ^
        allowOnlineACHPayment.hashCode ^
        transactionLocationType.hashCode ^
        dueDate.hashCode ^
        metaData.hashCode ^
        privateNote.hashCode ^
        billEmailCc.hashCode ^
        customerMemo.hashCode ^
        emailStatus.hashCode ^
        exchangeRate.hashCode ^
        deposit.hashCode ^
        txnTaxDetail.hashCode ^
        allowOnlineCreditCardPayment.hashCode ^
        customField.hashCode ^
        shipAddr.hashCode ^
        departmentRef.hashCode ^
        billEmailBcc.hashCode ^
        shipMethodRef.hashCode ^
        billAddr.hashCode ^
        applyTaxAfterDiscount.hashCode ^
        homeBalance.hashCode ^
        deliveryInfo.hashCode ^
        totalAmt.hashCode ^
        invoiceLink.hashCode ^
        recurDataRef.hashCode ^
        taxExemptionRef.hashCode ^
        balance.hashCode ^
        homeTotalAmt.hashCode ^
        freeFormAddress.hashCode;
  }
}
