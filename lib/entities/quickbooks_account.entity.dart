// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:quickbooks/entities/entity.export.dart';

class QuickbooksAccount {
  String? id;
  String? name;
  String? syncToken;
  String? acctNum;
  QuickbooksReferenceType? parentRef;
  QuickbooksReferenceType? currencyRef;
  String? description;
  bool? active;
  Map<String, dynamic>? metaData;
  bool? subAccount;
  String? classification;
  String? fullyQualifiedName;
  String? txnLocationType;
  String? accountType;
  double? currentBalance;
  double? currentBalanceWithSubAccounts;
  String? accountAlias;
  QuickbooksReferenceType? taxCodeRef;
  String? accountSubType;
  QuickbooksAccount({
    this.id,
    this.name,
    this.syncToken,
    this.acctNum,
    this.parentRef,
    this.currencyRef,
    this.description,
    this.active,
    this.metaData,
    this.subAccount,
    this.classification,
    this.fullyQualifiedName,
    this.txnLocationType,
    this.accountType,
    this.currentBalance,
    this.currentBalanceWithSubAccounts,
    this.accountAlias,
    this.taxCodeRef,
    this.accountSubType,
  });

  QuickbooksAccount copyWith({
    String? id,
    String? name,
    String? syncToken,
    String? acctNum,
    QuickbooksReferenceType? parentRef,
    QuickbooksReferenceType? currencyRef,
    String? description,
    bool? active,
    Map<String, dynamic>? metaData,
    bool? subAccount,
    String? classification,
    String? fullyQualifiedName,
    String? txnLocationType,
    String? accountType,
    double? currentBalance,
    double? currentBalanceWithSubAccounts,
    String? accountAlias,
    QuickbooksReferenceType? taxCodeRef,
    String? accountSubType,
  }) {
    return QuickbooksAccount(
      id: id ?? this.id,
      name: name ?? this.name,
      syncToken: syncToken ?? this.syncToken,
      acctNum: acctNum ?? this.acctNum,
      parentRef: parentRef ?? this.parentRef,
      currencyRef: currencyRef ?? this.currencyRef,
      description: description ?? this.description,
      active: active ?? this.active,
      metaData: metaData ?? this.metaData,
      subAccount: subAccount ?? this.subAccount,
      classification: classification ?? this.classification,
      fullyQualifiedName: fullyQualifiedName ?? this.fullyQualifiedName,
      txnLocationType: txnLocationType ?? this.txnLocationType,
      accountType: accountType ?? this.accountType,
      currentBalance: currentBalance ?? this.currentBalance,
      currentBalanceWithSubAccounts:
          currentBalanceWithSubAccounts ?? this.currentBalanceWithSubAccounts,
      accountAlias: accountAlias ?? this.accountAlias,
      taxCodeRef: taxCodeRef ?? this.taxCodeRef,
      accountSubType: accountSubType ?? this.accountSubType,
    );
  }

  Map<String, dynamic> toMap({bool withId = true}) {
    return <String, dynamic>{
      if (withId) 'Id': id,
      'Name': name,
      'SyncToken': syncToken,
      'AcctNum': acctNum,
      'ParentRef': parentRef?.toMap(),
      'CurrencyRef': currencyRef?.toMap(),
      'Description': description,
      'Active': active,
      'MetaData': metaData,
      'SubAccount': subAccount,
      'Classification': classification,
      'FullyQualifiedName': fullyQualifiedName,
      'TxnLocationType': txnLocationType,
      'AccountType': accountType,
      'CurrentBalance': currentBalance,
      'CurrentBalanceWithSubAccounts': currentBalanceWithSubAccounts,
      'AccountAlias': accountAlias,
      'TaxCodeRef': taxCodeRef?.toMap(),
      'AccountSubType': accountSubType,
    };
  }

  factory QuickbooksAccount.fromMap(Map<String, dynamic> map) {
    return QuickbooksAccount(
      id: map['Id'],
      name: map['Name'],
      syncToken: map['SyncToken'],
      acctNum: map['AcctNum'],
      parentRef: map['ParentRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['ParentRef'] as Map<String, dynamic>)
          : null,
      currencyRef: map['CurrencyRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['CurrencyRef'] as Map<String, dynamic>)
          : null,
      description: map['Description'],
      active: map['Active'],
      metaData: map['MetaData'],
      subAccount: map['SubAccount'],
      classification: map['Classification'],
      fullyQualifiedName: map['FullyQualifiedName'],
      txnLocationType: map['TxnLocationType'],
      accountType: map['AccountType'],
      currentBalance: double.tryParse(map['CurrentBalance'].toString()),
      currentBalanceWithSubAccounts:
          double.tryParse(map['CurrentBalanceWithSubAccounts'].toString()),
      accountAlias: map['AccountAlias'],
      taxCodeRef: map['TaxCodeRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['TaxCodeRef'] as Map<String, dynamic>)
          : null,
      accountSubType: map['AccountSubType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksAccount.fromJson(String source) =>
      QuickbooksAccount.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksAccount(id: $id, name: $name, syncToken: $syncToken, acctNum: $acctNum, parentRef: $parentRef, currencyRef: $currencyRef, description: $description, active: $active, metaData: $metaData, subAccount: $subAccount, classification: $classification, fullyQualifiedName: $fullyQualifiedName, txnLocationType: $txnLocationType, accountType: $accountType, currentBalance: $currentBalance, currentBalanceWithSubAccounts: $currentBalanceWithSubAccounts, accountAlias: $accountAlias, taxCodeRef: $taxCodeRef, accountSubType: $accountSubType)';
  }

  @override
  bool operator ==(covariant QuickbooksAccount other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.name == name &&
        other.syncToken == syncToken &&
        other.acctNum == acctNum &&
        other.parentRef == parentRef &&
        other.currencyRef == currencyRef &&
        other.description == description &&
        other.active == active &&
        mapEquals(other.metaData, metaData) &&
        other.subAccount == subAccount &&
        other.classification == classification &&
        other.fullyQualifiedName == fullyQualifiedName &&
        other.txnLocationType == txnLocationType &&
        other.accountType == accountType &&
        other.currentBalance == currentBalance &&
        other.currentBalanceWithSubAccounts == currentBalanceWithSubAccounts &&
        other.accountAlias == accountAlias &&
        other.taxCodeRef == taxCodeRef &&
        other.accountSubType == accountSubType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        syncToken.hashCode ^
        acctNum.hashCode ^
        parentRef.hashCode ^
        currencyRef.hashCode ^
        description.hashCode ^
        active.hashCode ^
        metaData.hashCode ^
        subAccount.hashCode ^
        classification.hashCode ^
        fullyQualifiedName.hashCode ^
        txnLocationType.hashCode ^
        accountType.hashCode ^
        currentBalance.hashCode ^
        currentBalanceWithSubAccounts.hashCode ^
        accountAlias.hashCode ^
        taxCodeRef.hashCode ^
        accountSubType.hashCode;
  }
}
