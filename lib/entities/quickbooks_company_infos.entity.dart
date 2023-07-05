// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

import 'package:quickbooks/entities/quickbooks_email_address.dart';
import 'package:quickbooks/entities/quickbooks_name_value.entity.dart';
import 'package:quickbooks/entities/quickbooks_phone_number.entity.dart';
import 'package:quickbooks/entities/quickbooks_physical_address.entity.dart';
import 'package:quickbooks/entities/quickbooks_web_address.entity.dart';

/// Entity to get all infos from a Quickbooks company
class QuickbooksCompanyInfo {
  String? id;
  String? companyName;
  String? legalName;
  QuickbooksPhysicalAddress? companyAddr;
  QuickbooksPhysicalAddress? customerCommunicationAddr;
  QuickbooksPhysicalAddress? legalAddr;
  QuickbooksEmailAddress? customerCommunicationEmailAddr;
  QuickbooksPhoneNumber? primaryPhone;
  DateTime? companyStartDate;
  String? fiscalYearStartMonth;
  String? country;
  QuickbooksEmailAddress? email;
  QuickbooksWebAddress? webAddr;
  String? supportedLanguages;
  List<QuickbooksReferenceType>? nameValue;
  String? domain;
  bool? sparse;
  String? syncToken;
  Map<String, dynamic>? metaData;
  QuickbooksCompanyInfo({
    this.id,
    this.companyName,
    this.legalName,
    this.companyAddr,
    this.customerCommunicationAddr,
    this.legalAddr,
    this.customerCommunicationEmailAddr,
    this.primaryPhone,
    this.companyStartDate,
    this.fiscalYearStartMonth,
    this.country,
    this.email,
    this.webAddr,
    this.supportedLanguages,
    this.nameValue,
    this.domain,
    this.sparse,
    this.syncToken,
    this.metaData,
  });

  QuickbooksCompanyInfo copyWith({
    String? id,
    String? companyName,
    String? legalName,
    QuickbooksPhysicalAddress? companyAddr,
    QuickbooksPhysicalAddress? customerCommunicationAddr,
    QuickbooksPhysicalAddress? legalAddr,
    QuickbooksEmailAddress? customerCommunicationEmailAddr,
    QuickbooksPhoneNumber? primaryPhone,
    DateTime? companyStartDate,
    String? fiscalYearStartMonth,
    String? country,
    QuickbooksEmailAddress? email,
    QuickbooksWebAddress? webAddr,
    String? supportedLanguages,
    List<QuickbooksReferenceType>? nameValue,
    String? domain,
    bool? sparse,
    String? syncToken,
    Map<String, dynamic>? metaData,
  }) {
    return QuickbooksCompanyInfo(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      legalName: legalName ?? this.legalName,
      companyAddr: companyAddr ?? this.companyAddr,
      customerCommunicationAddr:
          customerCommunicationAddr ?? this.customerCommunicationAddr,
      legalAddr: legalAddr ?? this.legalAddr,
      customerCommunicationEmailAddr:
          customerCommunicationEmailAddr ?? this.customerCommunicationEmailAddr,
      primaryPhone: primaryPhone ?? this.primaryPhone,
      companyStartDate: companyStartDate ?? this.companyStartDate,
      fiscalYearStartMonth: fiscalYearStartMonth ?? this.fiscalYearStartMonth,
      country: country ?? this.country,
      email: email ?? this.email,
      webAddr: webAddr ?? this.webAddr,
      supportedLanguages: supportedLanguages ?? this.supportedLanguages,
      nameValue: nameValue ?? this.nameValue,
      domain: domain ?? this.domain,
      sparse: sparse ?? this.sparse,
      syncToken: syncToken ?? this.syncToken,
      metaData: metaData ?? this.metaData,
    );
  }

  /// [companyStartDate] is formatted to a "yyyy-MM-dd" formatted date String
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Id': id,
      'CompanyName': companyName,
      'LegalName': legalName,
      'CompanyAddr': companyAddr?.toMap(),
      'CustomerCommunicationAddr': customerCommunicationAddr?.toMap(),
      'LegalAddr': legalAddr?.toMap(),
      'CustomerCommunicationEmailAddr': customerCommunicationEmailAddr?.toMap(),
      'PrimaryPhone': primaryPhone?.toMap(),
      'CompanyStartDate': companyStartDate != null
          ? DateFormat("yyyy-MM-dd").format(companyStartDate!)
          : null,
      'FiscalYearStartMonth': fiscalYearStartMonth,
      'Country': country,
      'Email': email?.toMap(),
      'WebAddr': webAddr?.toMap(),
      'SupportedLanguages': supportedLanguages,
      'NameValue': nameValue?.map((x) => x.toMap()).toList(),
      'domain': domain,
      'sparse': sparse,
      'SyncToken': syncToken,
      'MetaData': metaData,
    };
  }

  /// [companyStartDate] is parsed from a "yyyy-MM-dd" format date String
  factory QuickbooksCompanyInfo.fromMap(Map<String, dynamic> map) {
    return QuickbooksCompanyInfo(
      id: map['Id'],
      companyName: map['CompanyName'],
      legalName: map['LegalName'],
      companyAddr: map['CompanyAddr'] != null
          ? QuickbooksPhysicalAddress.fromMap(
              map['CompanyAddr'] as Map<String, dynamic>)
          : null,
      customerCommunicationAddr: map['CustomerCommunicationAddr'] != null
          ? QuickbooksPhysicalAddress.fromMap(
              map['CustomerCommunicationAddr'] as Map<String, dynamic>)
          : null,
      legalAddr: map['LegalAddr'] != null
          ? QuickbooksPhysicalAddress.fromMap(
              map['LegalAddr'] as Map<String, dynamic>)
          : null,
      customerCommunicationEmailAddr:
          map['CustomerCommunicationEmailAddr'] != null
              ? QuickbooksEmailAddress.fromMap(
                  map['CustomerCommunicationEmailAddr'] as Map<String, dynamic>)
              : null,
      primaryPhone: map['PrimaryPhone'] != null
          ? QuickbooksPhoneNumber.fromMap(
              map['PrimaryPhone'] as Map<String, dynamic>)
          : null,
      companyStartDate: DateTime.tryParse(map['CompanyStartDate']),
      fiscalYearStartMonth: map['FiscalYearStartMonth'],
      country: map['Country'],
      email: map['Email'] != null
          ? QuickbooksEmailAddress.fromMap(map['Email'] as Map<String, dynamic>)
          : null,
      webAddr: map['WebAddr'] != null
          ? QuickbooksWebAddress.fromMap(map['WebAddr'] as Map<String, dynamic>)
          : null,
      supportedLanguages: map['SupportedLanguages'],
      nameValue: map['NameValue'] != null
          ? List<QuickbooksReferenceType>.from(
              (map['NameValue'] as List<int>).map<QuickbooksReferenceType?>(
                (x) =>
                    QuickbooksReferenceType.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      domain: map['domain'],
      sparse: map['sparse'],
      syncToken: map['SyncToken'],
      metaData: map['MetaData'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksCompanyInfo.fromJson(String source) =>
      QuickbooksCompanyInfo.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksCompanyInfo(id: $id, companyName: $companyName, legalName: $legalName, companyAddr: $companyAddr, customerCommunicationAddr: $customerCommunicationAddr, legalAddr: $legalAddr, customerCommunicationEmailAddr: $customerCommunicationEmailAddr, primaryPhone: $primaryPhone, companyStartDate: $companyStartDate, fiscalYearStartMonth: $fiscalYearStartMonth, country: $country, email: $email, webAddr: $webAddr, supportedLanguages: $supportedLanguages, nameValue: $nameValue, domain: $domain, sparse: $sparse, syncToken: $syncToken, metaData: $metaData)';
  }

  @override
  bool operator ==(covariant QuickbooksCompanyInfo other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.companyName == companyName &&
        other.legalName == legalName &&
        other.companyAddr == companyAddr &&
        other.customerCommunicationAddr == customerCommunicationAddr &&
        other.legalAddr == legalAddr &&
        other.customerCommunicationEmailAddr ==
            customerCommunicationEmailAddr &&
        other.primaryPhone == primaryPhone &&
        other.companyStartDate == companyStartDate &&
        other.fiscalYearStartMonth == fiscalYearStartMonth &&
        other.country == country &&
        other.email == email &&
        other.webAddr == webAddr &&
        other.supportedLanguages == supportedLanguages &&
        collectionEquals(other.nameValue, nameValue) &&
        other.domain == domain &&
        other.sparse == sparse &&
        other.syncToken == syncToken &&
        collectionEquals(other.metaData, metaData);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        companyName.hashCode ^
        legalName.hashCode ^
        companyAddr.hashCode ^
        customerCommunicationAddr.hashCode ^
        legalAddr.hashCode ^
        customerCommunicationEmailAddr.hashCode ^
        primaryPhone.hashCode ^
        companyStartDate.hashCode ^
        fiscalYearStartMonth.hashCode ^
        country.hashCode ^
        email.hashCode ^
        webAddr.hashCode ^
        supportedLanguages.hashCode ^
        nameValue.hashCode ^
        domain.hashCode ^
        sparse.hashCode ^
        syncToken.hashCode ^
        metaData.hashCode;
  }
}
