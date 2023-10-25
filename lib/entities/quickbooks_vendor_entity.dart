// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:quickbooks/entities/entity.export.dart';

class QuickbooksVendor {
  String? id;
  String? syncToken;
  String? title;
  String? givenName;
  String? middleName;
  String? familyName;
  String? suffix;
  String? companyName;
  String? displayName;
  String? printOnCheckName;
  QuickbooksEmailAddress? primaryEmailAddr;
  QuickbooksContactInfos? otherContactInfo;
  QuickbooksReferenceType? apAccountRef;
  QuickbooksReferenceType? termRef;
  String? source;
  String? gstin;
  bool? t4aEligible;
  QuickbooksPhoneNumber? fax;
  String? businessNumber;
  QuickbooksReferenceType? currencyRef;
  bool? hasTPAR;
  String? taxReportingBasis;
  QuickbooksPhoneNumber? mobile;
  QuickbooksPhoneNumber? primaryPhone;
  bool? active;
  QuickbooksPhoneNumber? alternatePhone;
  Map<String, dynamic>? metaData;
  bool? vendor1099;
  double? costRate;
  double? billRate;
  QuickbooksWebAddress? webAddr;
  bool? t5018Eligible;
  QuickbooksVendorPaymentBankDetail? vendorPaymentBankDetail;
  String? taxIdentifier;
  String? acctNum;
  String? gstRegistrationType;
  QuickbooksPhysicalAddress? billAddr;
  double? balance;
  QuickbooksVendor({
    this.id,
    this.syncToken,
    this.title,
    this.givenName,
    this.middleName,
    this.familyName,
    this.suffix,
    this.companyName,
    this.displayName,
    this.printOnCheckName,
    this.primaryEmailAddr,
    this.otherContactInfo,
    this.apAccountRef,
    this.termRef,
    this.source,
    this.gstin,
    this.t4aEligible,
    this.fax,
    this.businessNumber,
    this.currencyRef,
    this.hasTPAR,
    this.taxReportingBasis,
    this.mobile,
    this.primaryPhone,
    this.active,
    this.alternatePhone,
    this.metaData,
    this.vendor1099,
    this.costRate,
    this.billRate,
    this.webAddr,
    this.t5018Eligible,
    this.vendorPaymentBankDetail,
    this.taxIdentifier,
    this.acctNum,
    this.gstRegistrationType,
    this.billAddr,
    this.balance,
  });

  QuickbooksVendor copyWith({
    String? id,
    String? syncToken,
    String? title,
    String? givenName,
    String? middleName,
    String? familyName,
    String? suffix,
    String? companyName,
    String? displayName,
    String? printOnCheckName,
    QuickbooksEmailAddress? primaryEmailAddr,
    QuickbooksContactInfos? otherContactInfo,
    QuickbooksReferenceType? apAccountRef,
    QuickbooksReferenceType? termRef,
    String? source,
    String? gstin,
    bool? t4aEligible,
    QuickbooksPhoneNumber? fax,
    String? businessNumber,
    QuickbooksReferenceType? currencyRef,
    bool? hasTPAR,
    String? taxReportingBasis,
    QuickbooksPhoneNumber? mobile,
    QuickbooksPhoneNumber? primaryPhone,
    bool? active,
    QuickbooksPhoneNumber? alternatePhone,
    Map<String, dynamic>? metaData,
    bool? vendor1099,
    double? costRate,
    double? billRate,
    QuickbooksWebAddress? webAddr,
    bool? t5018Eligible,
    QuickbooksVendorPaymentBankDetail? vendorPaymentBankDetail,
    String? taxIdentifier,
    String? acctNum,
    String? gstRegistrationType,
    QuickbooksPhysicalAddress? billAddr,
    double? balance,
  }) {
    return QuickbooksVendor(
      id: id ?? this.id,
      syncToken: syncToken ?? this.syncToken,
      title: title ?? this.title,
      givenName: givenName ?? this.givenName,
      middleName: middleName ?? this.middleName,
      familyName: familyName ?? this.familyName,
      suffix: suffix ?? this.suffix,
      companyName: companyName ?? this.companyName,
      displayName: displayName ?? this.displayName,
      printOnCheckName: printOnCheckName ?? this.printOnCheckName,
      primaryEmailAddr: primaryEmailAddr ?? this.primaryEmailAddr,
      otherContactInfo: otherContactInfo ?? this.otherContactInfo,
      apAccountRef: apAccountRef ?? this.apAccountRef,
      termRef: termRef ?? this.termRef,
      source: source ?? this.source,
      gstin: gstin ?? this.gstin,
      t4aEligible: t4aEligible ?? this.t4aEligible,
      fax: fax ?? this.fax,
      businessNumber: businessNumber ?? this.businessNumber,
      currencyRef: currencyRef ?? this.currencyRef,
      hasTPAR: hasTPAR ?? this.hasTPAR,
      taxReportingBasis: taxReportingBasis ?? this.taxReportingBasis,
      mobile: mobile ?? this.mobile,
      primaryPhone: primaryPhone ?? this.primaryPhone,
      active: active ?? this.active,
      alternatePhone: alternatePhone ?? this.alternatePhone,
      metaData: metaData ?? this.metaData,
      vendor1099: vendor1099 ?? this.vendor1099,
      costRate: costRate ?? this.costRate,
      billRate: billRate ?? this.billRate,
      webAddr: webAddr ?? this.webAddr,
      t5018Eligible: t5018Eligible ?? this.t5018Eligible,
      vendorPaymentBankDetail:
          vendorPaymentBankDetail ?? this.vendorPaymentBankDetail,
      taxIdentifier: taxIdentifier ?? this.taxIdentifier,
      acctNum: acctNum ?? this.acctNum,
      gstRegistrationType: gstRegistrationType ?? this.gstRegistrationType,
      billAddr: billAddr ?? this.billAddr,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap({bool withId = true}) {
    return <String, dynamic>{
      if (withId) 'Id': id,
      'SyncToken': syncToken,
      'Title': title,
      'GivenName': givenName,
      'MiddleName': middleName,
      'FamilyName': familyName,
      'Suffix': suffix,
      'CompanyName': companyName,
      'DisplayName': displayName,
      'PrintOnCheckName': printOnCheckName,
      'PrimaryEmailAddr': primaryEmailAddr?.toMap(),
      'OtherContactInfo': otherContactInfo?.toMap(),
      'APAccountRef': apAccountRef?.toMap(),
      'TermRef': termRef?.toMap(),
      'Source': source,
      'GSTIN': gstin,
      'T4AEligible': t4aEligible,
      'Fax': fax?.toMap(),
      'BusinessNumber': businessNumber,
      'CurrencyRef': currencyRef?.toMap(),
      'HasTPAR': hasTPAR,
      'TaxReportingBasis': taxReportingBasis,
      'Mobile': mobile?.toMap(),
      'PrimaryPhone': primaryPhone?.toMap(),
      'Active': active,
      'AlternatePhone': alternatePhone?.toMap(),
      'MetaData': metaData,
      'Vendor1099': vendor1099,
      'CostRate': costRate,
      'BillRate': billRate,
      'WebAddr': webAddr?.toMap(),
      'T5018Eligible': t5018Eligible,
      'VendorPaymentBankDetail': vendorPaymentBankDetail?.toMap(),
      'TaxIdentifier': taxIdentifier,
      'AcctNum': acctNum,
      'GSTRegistrationType': gstRegistrationType,
      'BillAddr': billAddr?.toMap(),
      'Balance': balance,
    };
  }

  factory QuickbooksVendor.fromMap(Map<String, dynamic> map) {
    return QuickbooksVendor(
      id: map['Id'],
      syncToken: map['SyncToken'],
      title: map['Title'],
      givenName: map['GivenName'],
      middleName: map['MiddleName'],
      familyName: map['FamilyName'],
      suffix: map['Suffix'],
      companyName: map['CompanyName'],
      displayName: map['DisplayName'],
      printOnCheckName: map['PrintOnCheckName'],
      primaryEmailAddr: map['PrimaryEmailAddr'] != null
          ? QuickbooksEmailAddress.fromMap(
              map['PrimaryEmailAddr'] as Map<String, dynamic>)
          : null,
      otherContactInfo: map['OtherContactInfo'] != null
          ? QuickbooksContactInfos.fromMap(
              map['OtherContactInfo'] as Map<String, dynamic>)
          : null,
      apAccountRef: map['APAAccountRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['APAccountRef'] as Map<String, dynamic>)
          : null,
      termRef: map['TermRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['TermRef'] as Map<String, dynamic>)
          : null,
      source: map['Source'],
      gstin: map['GSTIN'],
      t4aEligible: map['T4AEligible'],
      fax: map['Fax'] != null
          ? QuickbooksPhoneNumber.fromMap(map['Fax'] as Map<String, dynamic>)
          : null,
      businessNumber: map['BusinessNumber'],
      currencyRef: map['CurrencyRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['CurrencyRef'] as Map<String, dynamic>)
          : null,
      hasTPAR: map['HasTPAR'],
      taxReportingBasis: map['TaxReportingBasis'],
      mobile: map['Mobile'] != null
          ? QuickbooksPhoneNumber.fromMap(map['Mobile'] as Map<String, dynamic>)
          : null,
      primaryPhone: map['PrimaryPhone'] != null
          ? QuickbooksPhoneNumber.fromMap(
              map['PrimaryPhone'] as Map<String, dynamic>)
          : null,
      active: map['Active'],
      alternatePhone: map['AlternatePhone'] != null
          ? QuickbooksPhoneNumber.fromMap(
              map['AlternatePhone'] as Map<String, dynamic>)
          : null,
      metaData: map['MetaData'],
      vendor1099: map['Vendor1099'],
      costRate: double.tryParse(map['CostRate'].toString()),
      billRate: double.tryParse(map['BillRate'].toString()),
      webAddr: map['WebAddr'] != null
          ? QuickbooksWebAddress.fromMap(map['WebAddr'] as Map<String, dynamic>)
          : null,
      t5018Eligible: map['T5018Eligible'],
      vendorPaymentBankDetail: map['VendorPaymentBankDetail'] != null
          ? QuickbooksVendorPaymentBankDetail.fromMap(
              map['VendorPaymentBankDetail'] as Map<String, dynamic>)
          : null,
      taxIdentifier: map['TaxIdentifier'],
      acctNum: map['AcctNum'],
      gstRegistrationType: map['GSTRegistrationType'],
      billAddr: map['BillAddr'] != null
          ? QuickbooksPhysicalAddress.fromMap(
              map['BillAddr'] as Map<String, dynamic>)
          : null,
      balance: double.tryParse(map['Balance'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksVendor.fromJson(String source) =>
      QuickbooksVendor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksVendor(id: $id, syncToken: $syncToken, title: $title, givenName: $givenName, middleName: $middleName, familyName: $familyName, suffix: $suffix, '
        'companyName: $companyName, displayName: $displayName, printOnCheckName: $printOnCheckName, primaryEmailAddr: $primaryEmailAddr, '
        'otherContactInfo: $otherContactInfo, apAccountRef: $apAccountRef, termRef: $termRef, source: $source, gstin: $gstin, t4aEligible: $t4aEligible, fax: $fax, '
        'businessNumber: $businessNumber, currencyRef: $currencyRef, hasTPAR: $hasTPAR, taxReportingBasis: $taxReportingBasis, mobile: $mobile, '
        'primaryPhone: $primaryPhone, active: $active, alternatePhone: $alternatePhone, metaData: $metaData, vendor1099: $vendor1099, costRate: $costRate, '
        'billRate: $billRate, webAddr: $webAddr, t5018Eligible: $t5018Eligible, taxIdentifier: $taxIdentifier, acctNum: $acctNum, '
        'gstRegistrationType: $gstRegistrationType, billAddr: $billAddr, balance: $balance, vendorPaymentBankDetail: $vendorPaymentBankDetail)';
  }

  @override
  bool operator ==(covariant QuickbooksVendor other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.syncToken == syncToken &&
        other.title == title &&
        other.givenName == givenName &&
        other.middleName == middleName &&
        other.familyName == familyName &&
        other.suffix == suffix &&
        other.companyName == companyName &&
        other.displayName == displayName &&
        other.printOnCheckName == printOnCheckName &&
        other.primaryEmailAddr == primaryEmailAddr &&
        other.otherContactInfo == otherContactInfo &&
        other.apAccountRef == apAccountRef &&
        other.termRef == termRef &&
        other.source == source &&
        other.gstin == gstin &&
        other.t4aEligible == t4aEligible &&
        other.fax == fax &&
        other.businessNumber == businessNumber &&
        other.currencyRef == currencyRef &&
        other.hasTPAR == hasTPAR &&
        other.taxReportingBasis == taxReportingBasis &&
        other.mobile == mobile &&
        other.primaryPhone == primaryPhone &&
        other.active == active &&
        other.alternatePhone == alternatePhone &&
        mapEquals(other.metaData, metaData) &&
        other.vendor1099 == vendor1099 &&
        other.costRate == costRate &&
        other.billRate == billRate &&
        other.webAddr == webAddr &&
        other.t5018Eligible == t5018Eligible &&
        other.taxIdentifier == taxIdentifier &&
        other.acctNum == acctNum &&
        other.gstRegistrationType == gstRegistrationType &&
        other.billAddr == billAddr &&
        other.balance == balance &&
        other.vendorPaymentBankDetail == vendorPaymentBankDetail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        syncToken.hashCode ^
        title.hashCode ^
        givenName.hashCode ^
        middleName.hashCode ^
        familyName.hashCode ^
        suffix.hashCode ^
        companyName.hashCode ^
        displayName.hashCode ^
        printOnCheckName.hashCode ^
        primaryEmailAddr.hashCode ^
        otherContactInfo.hashCode ^
        apAccountRef.hashCode ^
        termRef.hashCode ^
        source.hashCode ^
        gstin.hashCode ^
        t4aEligible.hashCode ^
        fax.hashCode ^
        businessNumber.hashCode ^
        currencyRef.hashCode ^
        hasTPAR.hashCode ^
        taxReportingBasis.hashCode ^
        mobile.hashCode ^
        primaryPhone.hashCode ^
        active.hashCode ^
        alternatePhone.hashCode ^
        metaData.hashCode ^
        vendor1099.hashCode ^
        costRate.hashCode ^
        billRate.hashCode ^
        webAddr.hashCode ^
        t5018Eligible.hashCode ^
        taxIdentifier.hashCode ^
        acctNum.hashCode ^
        gstRegistrationType.hashCode ^
        billAddr.hashCode ^
        balance.hashCode ^
        vendorPaymentBankDetail.hashCode;
  }
}
