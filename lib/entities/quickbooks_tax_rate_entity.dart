// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:quickbooks/entities/entity.export.dart';
import 'package:quickbooks/entities/quickbooks_effective_tax_rate.dart';

/// Tax rate for quickbooks
class QuickbooksTaxRate {
  String? id;
  String? syncToken;
  String? rateValue;
  String? name;
  QuickbooksReferenceType? agencyRef;
  String? specialTaxType;
  List<QuickbooksEffectiveTaxRate>? effectiveTaxRate;
  String? displayName;
  QuickbooksReferenceType? taxReturnLineRef;
  bool? active;
  Map<String, dynamic>? metaData;
  String? originalTaxRate;
  String? description;
  QuickbooksTaxRate({
    this.id,
    this.syncToken,
    this.rateValue,
    this.name,
    this.agencyRef,
    this.specialTaxType,
    this.effectiveTaxRate,
    this.displayName,
    this.taxReturnLineRef,
    this.active,
    this.metaData,
    this.originalTaxRate,
    this.description,
  });

  QuickbooksTaxRate copyWith({
    String? id,
    String? syncToken,
    String? rateValue,
    String? name,
    QuickbooksReferenceType? agencyRef,
    String? specialTaxType,
    List<QuickbooksEffectiveTaxRate>? effectiveTaxRate,
    String? displayName,
    QuickbooksReferenceType? taxReturnLineRef,
    bool? active,
    Map<String, dynamic>? metaData,
    String? originalTaxRate,
    String? description,
  }) {
    return QuickbooksTaxRate(
      id: id ?? this.id,
      syncToken: syncToken ?? this.syncToken,
      rateValue: rateValue ?? this.rateValue,
      name: name ?? this.name,
      agencyRef: agencyRef ?? this.agencyRef,
      specialTaxType: specialTaxType ?? this.specialTaxType,
      effectiveTaxRate: effectiveTaxRate ?? this.effectiveTaxRate,
      displayName: displayName ?? this.displayName,
      taxReturnLineRef: taxReturnLineRef ?? this.taxReturnLineRef,
      active: active ?? this.active,
      metaData: metaData ?? this.metaData,
      originalTaxRate: originalTaxRate ?? this.originalTaxRate,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap({bool withId = true}) {
    return <String, dynamic>{
      if (withId) 'Id': id,
      'SyncToken': syncToken,
      'RateValue': rateValue,
      'Name': name,
      'AgencyRef': agencyRef?.toMap(),
      'SpecialTaxType': specialTaxType,
      'EffectiveTaxRate': effectiveTaxRate?.map((e) => e.toMap()).toList(),
      'DisplayName': displayName,
      'TaxReturnLineRef': taxReturnLineRef?.toMap(),
      'Active': active,
      'MetaData': metaData,
      'OriginalTaxRate': originalTaxRate,
      'Description': description,
    };
  }

  factory QuickbooksTaxRate.fromMap(Map<String, dynamic> map) {
    return QuickbooksTaxRate(
      id: map['Id'],
      syncToken: map['SyncToken'],
      rateValue: map['RateValue']?.toString(),
      name: map['Name'],
      agencyRef: map['AgencyRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['AgencyRef'] as Map<String, dynamic>)
          : null,
      specialTaxType: map['SpecialTaxType'],
      effectiveTaxRate: map['EffectiveTaxRate'] != null
          ? (map['EffectiveTaxRate'] as List)
              .map((e) =>
                  QuickbooksEffectiveTaxRate.fromMap(e as Map<String, dynamic>))
              .toList()
          : null,
      displayName: map['DisplayName'],
      taxReturnLineRef: map['TaxReturnLineRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['TaxReturnLineRef'] as Map<String, dynamic>)
          : null,
      active: map['Active'],
      metaData: map['MetaData'],
      originalTaxRate: map['OriginalTaxRate'],
      description: map['Description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksTaxRate.fromJson(String source) =>
      QuickbooksTaxRate.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksTaxRate(id: $id, syncToken: $syncToken, rateValue: $rateValue, name: $name, agencyRef: $agencyRef, specialTaxType: $specialTaxType, effectiveTaxRate: $effectiveTaxRate, displayName: $displayName, taxReturnLineRef: $taxReturnLineRef, active: $active, metaData: $metaData, originalTaxRate: $originalTaxRate, description: $description)';
  }

  @override
  bool operator ==(covariant QuickbooksTaxRate other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.syncToken == syncToken &&
        other.rateValue == rateValue &&
        other.name == name &&
        other.agencyRef == agencyRef &&
        other.specialTaxType == specialTaxType &&
        other.effectiveTaxRate == effectiveTaxRate &&
        other.displayName == displayName &&
        other.taxReturnLineRef == taxReturnLineRef &&
        other.active == active &&
        mapEquals(other.metaData, metaData) &&
        other.originalTaxRate == originalTaxRate &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        syncToken.hashCode ^
        rateValue.hashCode ^
        name.hashCode ^
        agencyRef.hashCode ^
        specialTaxType.hashCode ^
        effectiveTaxRate.hashCode ^
        displayName.hashCode ^
        taxReturnLineRef.hashCode ^
        active.hashCode ^
        metaData.hashCode ^
        originalTaxRate.hashCode ^
        description.hashCode;
  }
}
