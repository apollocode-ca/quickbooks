// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:quickbooks/entities/entity.export.dart';

class QuickbooksCustomer {
  String? id;
  String? syncToken;
  String? displayName;
  String? title;
  String? givenName;
  String? middleName;
  String? suffix;
  String? familyName;
  QuickbooksEmailAddress? primaryEmailAddr;
  String? resaleNum;
  String? secondaryTaxIdentifier;
  QuickbooksReferenceType? ARAccountRef;
  QuickbooksReferenceType? defaultTaxCodeRef;
  String? preferredDeliveryMethod;
  String? GSTIN;
  QuickbooksReferenceType? salesTermRef;
  String? customerTypeRef;
  QuickbooksPhoneNumber? fax;
  String? businessNumber;
  bool? billWithParent;
  QuickbooksReferenceType? currencyRef;
  QuickbooksPhoneNumber? mobile;
  bool? job;
  double? balanceWithJobs;
  QuickbooksPhoneNumber? primaryPhone;
  DateTime? openBalanceDate;
  bool? taxable;
  QuickbooksPhoneNumber? alternatePhone;
  Map<String, dynamic>? metaData;
  QuickbooksReferenceType? parentRef;
  String? notes;
  QuickbooksWebAddress? webAddr;
  bool? active;
  String? companyName;
  double? balance;
  QuickbooksPhysicalAddress? shipAddr;
  QuickbooksReferenceType? paymentMethodRef;
  bool? isProject;
  String? source;
  String? primaryTaxIdentifier;
  String? GSTRegistrationType;
  String? printOnCheckName;
  QuickbooksPhysicalAddress? billAddr;
  String? fullyQualifiedName;
  int? level;
  String? taxExemptionReasonId;
  QuickbooksCustomer({
    this.id,
    this.syncToken,
    this.displayName,
    this.title,
    this.givenName,
    this.middleName,
    this.suffix,
    this.familyName,
    this.primaryEmailAddr,
    this.resaleNum,
    this.secondaryTaxIdentifier,
    this.ARAccountRef,
    this.defaultTaxCodeRef,
    this.preferredDeliveryMethod,
    this.GSTIN,
    this.salesTermRef,
    this.customerTypeRef,
    this.fax,
    this.businessNumber,
    this.billWithParent,
    this.currencyRef,
    this.mobile,
    this.job,
    this.balanceWithJobs,
    this.primaryPhone,
    this.openBalanceDate,
    this.taxable,
    this.alternatePhone,
    this.metaData,
    this.parentRef,
    this.notes,
    this.webAddr,
    this.active,
    this.companyName,
    this.balance,
    this.shipAddr,
    this.paymentMethodRef,
    this.isProject,
    this.source,
    this.primaryTaxIdentifier,
    this.GSTRegistrationType,
    this.printOnCheckName,
    this.billAddr,
    this.fullyQualifiedName,
    this.level,
    this.taxExemptionReasonId,
  });

  QuickbooksCustomer copyWith({
    String? id,
    String? syncToken,
    String? displayName,
    String? title,
    String? givenName,
    String? middleName,
    String? suffix,
    String? familyName,
    QuickbooksEmailAddress? primaryEmailAddr,
    String? resaleNum,
    String? secondaryTaxIdentifier,
    QuickbooksReferenceType? ARAccountRef,
    QuickbooksReferenceType? defaultTaxCodeRef,
    String? preferredDeliveryMethod,
    String? GSTIN,
    QuickbooksReferenceType? salesTermRef,
    String? customerTypeRef,
    QuickbooksPhoneNumber? fax,
    String? businessNumber,
    bool? billWithParent,
    QuickbooksReferenceType? currencyRef,
    QuickbooksPhoneNumber? mobile,
    bool? job,
    double? balanceWithJobs,
    QuickbooksPhoneNumber? primaryPhone,
    DateTime? openBalanceDate,
    bool? taxable,
    QuickbooksPhoneNumber? alternatePhone,
    Map<String, dynamic>? metaDate,
    QuickbooksReferenceType? parentRef,
    String? notes,
    QuickbooksWebAddress? webAddr,
    bool? active,
    String? companyName,
    double? balance,
    QuickbooksPhysicalAddress? shipAddr,
    QuickbooksReferenceType? paymentMethodRef,
    bool? isProject,
    String? source,
    String? primaryTaxIdentifier,
    String? GSTRegistrationType,
    String? printOnCheckName,
    QuickbooksPhysicalAddress? billAddr,
    String? fullyQualifiedName,
    int? level,
    String? taxExemptionReasonId,
  }) {
    return QuickbooksCustomer(
      id: id ?? this.id,
      syncToken: syncToken ?? this.syncToken,
      displayName: displayName ?? this.displayName,
      title: title ?? this.title,
      givenName: givenName ?? this.givenName,
      middleName: middleName ?? this.middleName,
      suffix: suffix ?? this.suffix,
      familyName: familyName ?? this.familyName,
      primaryEmailAddr: primaryEmailAddr ?? this.primaryEmailAddr,
      resaleNum: resaleNum ?? this.resaleNum,
      secondaryTaxIdentifier:
          secondaryTaxIdentifier ?? this.secondaryTaxIdentifier,
      ARAccountRef: ARAccountRef ?? this.ARAccountRef,
      defaultTaxCodeRef: defaultTaxCodeRef ?? this.defaultTaxCodeRef,
      preferredDeliveryMethod:
          preferredDeliveryMethod ?? this.preferredDeliveryMethod,
      GSTIN: GSTIN ?? this.GSTIN,
      salesTermRef: salesTermRef ?? this.salesTermRef,
      customerTypeRef: customerTypeRef ?? this.customerTypeRef,
      fax: fax ?? this.fax,
      businessNumber: businessNumber ?? this.businessNumber,
      billWithParent: billWithParent ?? this.billWithParent,
      currencyRef: currencyRef ?? this.currencyRef,
      mobile: mobile ?? this.mobile,
      job: job ?? this.job,
      balanceWithJobs: balanceWithJobs ?? this.balanceWithJobs,
      primaryPhone: primaryPhone ?? this.primaryPhone,
      openBalanceDate: openBalanceDate ?? this.openBalanceDate,
      taxable: taxable ?? this.taxable,
      alternatePhone: alternatePhone ?? this.alternatePhone,
      metaData: metaDate ?? metaData,
      parentRef: parentRef ?? this.parentRef,
      notes: notes ?? this.notes,
      webAddr: webAddr ?? this.webAddr,
      active: active ?? this.active,
      companyName: companyName ?? this.companyName,
      balance: balance ?? this.balance,
      shipAddr: shipAddr ?? this.shipAddr,
      paymentMethodRef: paymentMethodRef ?? this.paymentMethodRef,
      isProject: isProject ?? this.isProject,
      source: source ?? this.source,
      primaryTaxIdentifier: primaryTaxIdentifier ?? this.primaryTaxIdentifier,
      GSTRegistrationType: GSTRegistrationType ?? this.GSTRegistrationType,
      printOnCheckName: printOnCheckName ?? this.printOnCheckName,
      billAddr: billAddr ?? this.billAddr,
      fullyQualifiedName: fullyQualifiedName ?? this.fullyQualifiedName,
      level: level ?? this.level,
      taxExemptionReasonId: taxExemptionReasonId ?? this.taxExemptionReasonId,
    );
  }

  Map<String, dynamic> toMap({bool withId = true}) {
    return <String, dynamic>{
      if (withId) 'Id': id,
      'SyncToken': syncToken,
      'DisplayName': displayName,
      'Title': title,
      'GivenName': givenName,
      'MiddleName': middleName,
      'Suffix': suffix,
      'FamilyName': familyName,
      'PrimaryEmailAddr': primaryEmailAddr?.toMap(),
      'ResaleNum': resaleNum,
      'SecondaryTaxIdentifier': secondaryTaxIdentifier,
      'ARAccountRef': ARAccountRef?.toMap(),
      'DefaultTaxCodeRef': defaultTaxCodeRef?.toMap(),
      'PreferredDeliveryMethod': preferredDeliveryMethod,
      'GSTIN': GSTIN,
      'SalesTermRef': salesTermRef?.toMap(),
      'CustomerTypeRef': customerTypeRef,
      'Fax': fax?.toMap(),
      'BusinessNumber': businessNumber,
      'BillWithParent': billWithParent,
      'CurrencyRef': currencyRef?.toMap(),
      'Mobile': mobile?.toMap(),
      'Job': job,
      'BalanceWithJobs': balanceWithJobs,
      'PrimaryPhone': primaryPhone?.toMap(),
      'OpenBalanceDate': openBalanceDate?.toString(),
      'Taxable': taxable,
      'AlternatePhone': alternatePhone?.toMap(),
      'MetaData': metaData,
      'ParentRef': parentRef?.toMap(),
      'Notes': notes,
      'WebAddr': webAddr?.toMap(),
      'Active': active,
      'CompanyName': companyName,
      'Balance': balance,
      'ShipAddr': shipAddr?.toMap(),
      'PaymentMethodRef': paymentMethodRef?.toMap(),
      'IsProject': isProject,
      'Source': source,
      'PrimaryTaxIdentifier': primaryTaxIdentifier,
      'GSTRegistrationType': GSTRegistrationType,
      'PrintOnCheckName': printOnCheckName,
      'BillAddr': billAddr?.toMap(),
      'FullyQualifiedName': fullyQualifiedName,
      'Level': level,
      'TaxExemptionReasonId': taxExemptionReasonId,
    };
  }

  factory QuickbooksCustomer.fromMap(Map<String, dynamic> map) {
    return QuickbooksCustomer(
      id: map['Id'],
      syncToken: map['SyncToken'],
      displayName: map['DisplayName'],
      title: map['Title'],
      givenName: map['GivenName'],
      middleName: map['MiddleName'],
      suffix: map['Suffix'],
      familyName: map['FamilyName'],
      primaryEmailAddr: map['PrimaryEmailAddr'] != null
          ? QuickbooksEmailAddress.fromMap(
              map['PrimaryEmailAddr'] as Map<String, dynamic>)
          : null,
      resaleNum: map['ResaleNum'],
      secondaryTaxIdentifier: map['SecondaryTaxIdentifier'],
      ARAccountRef: map['ARAccountRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['ARAccountRef'] as Map<String, dynamic>)
          : null,
      defaultTaxCodeRef: map['DefaultTaxCodeRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['DefaultTaxCodeRef'] as Map<String, dynamic>)
          : null,
      preferredDeliveryMethod: map['PreferredDeliveryMethod'],
      GSTIN: map['GSTIN'],
      salesTermRef: map['SalesTermRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['SalesTermRef'] as Map<String, dynamic>)
          : null,
      customerTypeRef: map['CustomerTypeRef'],
      fax: map['Fax'] != null
          ? QuickbooksPhoneNumber.fromMap(map['Fax'] as Map<String, dynamic>)
          : null,
      businessNumber: map['BusinessNumber'],
      billWithParent: map['BillWithParent'],
      currencyRef: map['CurrencyRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['CurrencyRef'] as Map<String, dynamic>)
          : null,
      mobile: map['Mobile'] != null
          ? QuickbooksPhoneNumber.fromMap(map['Mobile'] as Map<String, dynamic>)
          : null,
      job: map['Job'],
      balanceWithJobs: double.tryParse(map['BalanceWithJobs'].toString()),
      primaryPhone: map['PrimaryPhone'] != null
          ? QuickbooksPhoneNumber.fromMap(
              map['PrimaryPhone'] as Map<String, dynamic>)
          : null,
      openBalanceDate: DateTime.tryParse(map['OpenBalanceDate'].toString()),
      taxable: map['Taxable'],
      alternatePhone: map['AlternatePhone'] != null
          ? QuickbooksPhoneNumber.fromMap(
              map['AlternatePhone'] as Map<String, dynamic>)
          : null,
      metaData: map['MetaData'],
      parentRef: map['ParentRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['ParentRef'] as Map<String, dynamic>)
          : null,
      notes: map['Notes'],
      webAddr: map['WebAddr'] != null
          ? QuickbooksWebAddress.fromMap(map['WebAddr'] as Map<String, dynamic>)
          : null,
      active: map['Active'],
      companyName: map['CompanyName'],
      balance: double.tryParse(map['balance'].toString()),
      shipAddr: map['ShipAddr'] != null
          ? QuickbooksPhysicalAddress.fromMap(
              map['ShipAddr'] as Map<String, dynamic>)
          : null,
      paymentMethodRef: map['PaymentMethodRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['PaymentMethodRef'] as Map<String, dynamic>)
          : null,
      isProject: map['IsProject'],
      source: map['Source'],
      primaryTaxIdentifier: map['PrimaryTaxIdentifier'],
      GSTRegistrationType: map['GSTRegistrationType'],
      printOnCheckName: map['PrintOnCheckName'],
      billAddr: map['BillAddr'] != null
          ? QuickbooksPhysicalAddress.fromMap(
              map['BillAddr'] as Map<String, dynamic>)
          : null,
      fullyQualifiedName: map['FullyQualifiedName'],
      level: int.tryParse(map['Level'].toString()),
      taxExemptionReasonId: map['TaxExemptionReasonId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksCustomer.fromJson(String source) =>
      QuickbooksCustomer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksCustomer(id: $id, syncToken: $syncToken, displayName: $displayName, title: $title, givenName: $givenName, middleName: $middleName, '
        'suffix: $suffix, familyName: $familyName, primaryEmailAddr: $primaryEmailAddr, resaleNum: $resaleNum, secondaryTaxIdentifier: $secondaryTaxIdentifier, '
        'ARAccountRef: $ARAccountRef, defaultTaxCodeRef: $defaultTaxCodeRef, preferredDeliveryMethod: $preferredDeliveryMethod, GSTIN: $GSTIN, '
        'salesTermRef: $salesTermRef, customerTypeRef: $customerTypeRef, fax: $fax, businessNumber: $businessNumber, billWithParent: $billWithParent, '
        'currencyRef: $currencyRef, mobile: $mobile, job: $job, balanceWithJobs: $balanceWithJobs, primaryPhone: $primaryPhone, openBalanceDate: $openBalanceDate, '
        'taxable: $taxable, alternatePhone: $alternatePhone, metaDate: $metaData, parentRef: $parentRef, notes: $notes, webAddr: $webAddr, active: $active, '
        'companyName: $companyName, balance: $balance, shipAddr: $shipAddr, paymentMethodRef: $paymentMethodRef, isProject: $isProject, source: $source, '
        'primaryTaxIdentifier: $primaryTaxIdentifier, GSTRegistrationType: $GSTRegistrationType, printOnCheckName: $printOnCheckName, billAddr: $billAddr, '
        'fullyQualifiedName: $fullyQualifiedName, level: $level, taxExemptionReasonId: $taxExemptionReasonId)';
  }

  @override
  bool operator ==(covariant QuickbooksCustomer other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.syncToken == syncToken &&
        other.displayName == displayName &&
        other.title == title &&
        other.givenName == givenName &&
        other.middleName == middleName &&
        other.suffix == suffix &&
        other.familyName == familyName &&
        other.primaryEmailAddr == primaryEmailAddr &&
        other.resaleNum == resaleNum &&
        other.secondaryTaxIdentifier == secondaryTaxIdentifier &&
        other.ARAccountRef == ARAccountRef &&
        other.defaultTaxCodeRef == defaultTaxCodeRef &&
        other.preferredDeliveryMethod == preferredDeliveryMethod &&
        other.GSTIN == GSTIN &&
        other.salesTermRef == salesTermRef &&
        other.customerTypeRef == customerTypeRef &&
        other.fax == fax &&
        other.businessNumber == businessNumber &&
        other.billWithParent == billWithParent &&
        other.currencyRef == currencyRef &&
        other.mobile == mobile &&
        other.job == job &&
        other.balanceWithJobs == balanceWithJobs &&
        other.primaryPhone == primaryPhone &&
        other.openBalanceDate == openBalanceDate &&
        other.taxable == taxable &&
        other.alternatePhone == alternatePhone &&
        mapEquals(other.metaData, metaData) &&
        other.parentRef == parentRef &&
        other.notes == notes &&
        other.webAddr == webAddr &&
        other.active == active &&
        other.companyName == companyName &&
        other.balance == balance &&
        other.shipAddr == shipAddr &&
        other.paymentMethodRef == paymentMethodRef &&
        other.isProject == isProject &&
        other.source == source &&
        other.primaryTaxIdentifier == primaryTaxIdentifier &&
        other.GSTRegistrationType == GSTRegistrationType &&
        other.printOnCheckName == printOnCheckName &&
        other.billAddr == billAddr &&
        other.fullyQualifiedName == fullyQualifiedName &&
        other.level == level &&
        other.taxExemptionReasonId == taxExemptionReasonId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        syncToken.hashCode ^
        displayName.hashCode ^
        title.hashCode ^
        givenName.hashCode ^
        middleName.hashCode ^
        suffix.hashCode ^
        familyName.hashCode ^
        primaryEmailAddr.hashCode ^
        resaleNum.hashCode ^
        secondaryTaxIdentifier.hashCode ^
        ARAccountRef.hashCode ^
        defaultTaxCodeRef.hashCode ^
        preferredDeliveryMethod.hashCode ^
        GSTIN.hashCode ^
        salesTermRef.hashCode ^
        customerTypeRef.hashCode ^
        fax.hashCode ^
        businessNumber.hashCode ^
        billWithParent.hashCode ^
        currencyRef.hashCode ^
        mobile.hashCode ^
        job.hashCode ^
        balanceWithJobs.hashCode ^
        primaryPhone.hashCode ^
        openBalanceDate.hashCode ^
        taxable.hashCode ^
        alternatePhone.hashCode ^
        metaData.hashCode ^
        parentRef.hashCode ^
        notes.hashCode ^
        webAddr.hashCode ^
        active.hashCode ^
        companyName.hashCode ^
        balance.hashCode ^
        shipAddr.hashCode ^
        paymentMethodRef.hashCode ^
        isProject.hashCode ^
        source.hashCode ^
        primaryTaxIdentifier.hashCode ^
        GSTRegistrationType.hashCode ^
        printOnCheckName.hashCode ^
        billAddr.hashCode ^
        fullyQualifiedName.hashCode ^
        level.hashCode ^
        taxExemptionReasonId.hashCode;
  }
}
