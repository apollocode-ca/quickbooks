import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:quickbooks/enums/enums.dart';

import 'quickbooks_name_value.entity.dart';

/// Entity to get a product's data from Quickbooks
class QuickbooksProduct {
  String? id;
  String? fullyQualifiedName;
  String? domain;
  String? sku;
  String? name;
  double? price;
  double? cost;
  QuickbooksProductType type;
  QuickbooksReferenceType? parentRef;
  String? description;
  String? syncToken;
  bool? sparse;
  bool? active;
  bool? taxable;
  QuickbooksReferenceType? incomeAccountRef;
  String? purchaseDesc;
  QuickbooksReferenceType? expenseAccountRef;
  QuickbooksReferenceType? assetAccountRef;
  bool? trackQtyOnHand;
  int? qtyOnHand;
  DateTime? invStartDate;
  Map<String, dynamic>? metaData;

  /// Calculates the tax price for a [taxRate]
  ///
  /// Returns 0 if [taxable] is false
  double calculateTaxe(double taxRate) {
    if (taxable != true) {
      return price ?? 0;
    }
    return price ?? 0 * taxRate;
  }

  /// Calculates the total price of a [QuickbooksProduct] for a list of [taxRates]
  ///
  /// Returns only the price if [taxable] is false
  double totalPrice(List<double> taxRates) {
    if (taxable != true || price == null || price == 0 || taxRates.isEmpty) {
      return price ?? 0;
    }

    double totalPrice = price!;

    for (var taxRate in taxRates) {
      totalPrice += calculateTaxe(taxRate);
    }

    return totalPrice;
  }

  QuickbooksProduct({
    this.id,
    this.fullyQualifiedName,
    this.domain,
    this.sku,
    this.name,
    this.price,
    this.cost,
    this.type = QuickbooksProductType.inventory,
    this.description,
    this.parentRef,
    this.syncToken,
    this.sparse,
    this.active,
    this.taxable,
    this.incomeAccountRef,
    this.purchaseDesc,
    this.expenseAccountRef,
    this.assetAccountRef,
    this.trackQtyOnHand,
    this.qtyOnHand,
    this.invStartDate,
    this.metaData,
  });

  QuickbooksProduct copyWith({
    String? id,
    String? fullyQualifiedName,
    String? domain,
    String? sku,
    String? name,
    double? price,
    double? cost,
    QuickbooksProductType? type,
    String? description,
    QuickbooksReferenceType? parentRef,
    String? syncToken,
    bool? sparse,
    bool? active,
    bool? taxable,
    QuickbooksReferenceType? incomeAccountRef,
    String? purchaseDesc,
    QuickbooksReferenceType? expenseAccountRef,
    QuickbooksReferenceType? assetAccountRef,
    bool? trackQtyOnHand,
    int? qtyOnHand,
    DateTime? invStartDate,
    Map<String, dynamic>? metaData,
  }) {
    return QuickbooksProduct(
      id: id ?? this.id,
      fullyQualifiedName: fullyQualifiedName ?? this.fullyQualifiedName,
      domain: domain ?? this.domain,
      sku: sku ?? this.sku,
      name: name ?? this.name,
      price: price ?? this.price,
      cost: cost ?? cost,
      type: type ?? this.type,
      description: description ?? this.description,
      syncToken: syncToken ?? this.syncToken,
      parentRef: parentRef ?? this.parentRef,
      sparse: sparse ?? this.sparse,
      active: active ?? this.active,
      taxable: taxable ?? this.taxable,
      incomeAccountRef: incomeAccountRef ?? this.incomeAccountRef,
      purchaseDesc: purchaseDesc ?? this.purchaseDesc,
      expenseAccountRef: expenseAccountRef ?? this.expenseAccountRef,
      assetAccountRef: assetAccountRef ?? this.assetAccountRef,
      trackQtyOnHand: trackQtyOnHand ?? this.trackQtyOnHand,
      qtyOnHand: qtyOnHand ?? this.qtyOnHand,
      invStartDate: invStartDate ?? this.invStartDate,
      metaData: metaData ?? this.metaData,
    );
  }

  /// If [withId] is true, will send the [id] in the map
  Map<String, dynamic> toMap({bool withId = true}) {
    return {
      if (withId) 'Id': id,
      'FullyQualifiedName': fullyQualifiedName,
      'domain': domain,
      'Sku': sku,
      'Name': name,
      'UnitPrice': price,
      'PurchaseCost': cost,
      'Type': type.toJsonString(),
      'Description': description,
      'ParentRef': parentRef?.toMap(),
      'SyncToken': syncToken,
      'sparse': sparse,
      'Active': active,
      'Taxable': taxable,
      'IncomeAccountRef': incomeAccountRef?.toMap(),
      'PurchaseDesc': purchaseDesc,
      'ExpenseAccountRef': expenseAccountRef?.toMap(),
      'AssetAccountRef': expenseAccountRef?.toMap(),
      'TrackQtyOnHand': trackQtyOnHand,
      'QtyOnHand': qtyOnHand,
      'InvStartDate': invStartDate != null
          ? DateFormat('yyyy-MM-dd').format(invStartDate!)
          : null,
      'MetaData': metaData,
    };
  }

  factory QuickbooksProduct.fromMap(Map<String, dynamic> map) {
    return QuickbooksProduct(
      id: map['Id'],
      fullyQualifiedName: map['FullyQualifiedName'],
      domain: map['domain'],
      sku: map['Sku'],
      name: map['Name'],
      price: double.tryParse(map['UnitPrice'].toString()),
      cost: double.tryParse(map['PurchaseCost'].toString()),
      type: QuickbooksProductTypeExtension.fromJsonString(map['Type']),
      description: map['Description'],
      parentRef: (map['ParentRef'] != null)
          ? QuickbooksReferenceType.fromMap(map['ParentRef'])
          : null,
      syncToken: map['SyncToken'],
      sparse: map['sparse'],
      active: map['Active'],
      taxable: map['Taxable'],
      incomeAccountRef: (map['IncomeAccountRef'] != null)
          ? QuickbooksReferenceType.fromMap(map['IncomeAccountRef'])
          : null,
      purchaseDesc: map['PurchaseDesc'],
      expenseAccountRef: (map['ExpenseAccountRef'] != null)
          ? QuickbooksReferenceType.fromMap(map['ExpenseAccountRef'])
          : null,
      assetAccountRef: (map['AssetAccountRef'] != null)
          ? QuickbooksReferenceType.fromMap(map['AssetAccountRef'])
          : null,
      trackQtyOnHand: map['TrackQtyOnHand'],
      qtyOnHand: int.tryParse(map['QtyOnHand'].toString()),
      invStartDate: DateTime.tryParse(map['InvStartDate'].toString()),
      metaData: map['MetaData'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksProduct.fromJson(String source) =>
      QuickbooksProduct.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuickbooksProduct(id: $id, fullyQualifiedName: $fullyQualifiedName, domain: $domain, name: $name, syncToken: $syncToken, '
        'sparse: $sparse, active: $active, taxable: $taxable, incomeAccountRef: $incomeAccountRef, purchaseDesc: $purchaseDesc, '
        'expenseAccountRef: $expenseAccountRef, assetAccountRef: $assetAccountRef, trackQtyOnHand: $trackQtyOnHand, qtyOnHand: $qtyOnHand, '
        'invStartDate: $invStartDate, metaData: $metaData, sku: $sku, price: $price, cost: $cost, type: $type, description: $description, '
        'parentRef: $parentRef)';
  }

  @override
  bool operator ==(Object? other) {
    if (identical(this, other)) return true;

    return other is QuickbooksProduct &&
        other.id == id &&
        other.fullyQualifiedName == fullyQualifiedName &&
        other.domain == domain &&
        other.name == name &&
        other.syncToken == syncToken &&
        other.sparse == sparse &&
        other.active == active &&
        taxable == other.taxable &&
        incomeAccountRef == other.incomeAccountRef &&
        purchaseDesc == other.purchaseDesc &&
        expenseAccountRef == other.expenseAccountRef &&
        assetAccountRef == other.expenseAccountRef &&
        trackQtyOnHand == other.trackQtyOnHand &&
        qtyOnHand == other.qtyOnHand &&
        invStartDate == other.invStartDate &&
        metaData == other.metaData &&
        sku == other.sku &&
        price == other.price &&
        cost == other.cost &&
        type == other.type &&
        description == other.description &&
        parentRef == other.parentRef;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullyQualifiedName.hashCode ^
        domain.hashCode ^
        name.hashCode ^
        syncToken.hashCode ^
        sparse.hashCode ^
        active.hashCode ^
        taxable.hashCode ^
        incomeAccountRef.hashCode ^
        purchaseDesc.hashCode ^
        expenseAccountRef.hashCode ^
        assetAccountRef.hashCode ^
        trackQtyOnHand.hashCode ^
        qtyOnHand.hashCode ^
        invStartDate.hashCode ^
        metaData.hashCode ^
        sku.hashCode ^
        price.hashCode ^
        cost.hashCode ^
        type.hashCode ^
        description.hashCode ^
        parentRef.hashCode;
  }
}
