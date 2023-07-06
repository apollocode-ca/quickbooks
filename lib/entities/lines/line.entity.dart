// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quickbooks/entities/entity.export.dart';
import 'package:quickbooks/enums/invoice/detail_type.enum.dart';

/// Main line for a [QuickbooksInvoice]
abstract class QuickbooksLine {
  String? id;
  int lineNum;
  String? description;
  double amount;

  final QuickbooksLineDetailType type;
  QuickbooksLine({
    this.id,
    required this.lineNum,
    this.description,
    required this.amount,
    required this.type,
  });

  @override
  String toString() {
    return 'QuickbooksLine(id: $id, lineNum: $lineNum, description: $description, amount: $amount, type: $type)';
  }

  /// Converts a line into a Map<String, dynamic>
  Map<String, dynamic> toMap();

  /// Converts a map into a line by the line type.
  /// Throws an error if the line type is not supported.
  ///
  /// Currently supported lines are:
  /// - SalesItemLineDetail
  /// - GroupLineDetail
  /// - DescriptionOnlyLineDetail
  /// - DiscountLineDetail
  /// - SubTotalLineDetail
  /// - TaxLineDetail
  factory QuickbooksLine.fromMap(Map<String, dynamic> map) {
    var type =
        QuickbooksLineDetailTypeExtension.fromJsonString(map['DetailType']);

    switch (type) {
      case QuickbooksLineDetailType.salesItemLineDetail:
        return QuickbooksSalesItemLine.fromMap(map);
      case QuickbooksLineDetailType.groupLineDetail:
        return QuickbooksGroupLine.fromMap(map);
      case QuickbooksLineDetailType.descriptionOnlyLineDetail:
        return QuickbooksDescriptionOnlyLine.fromMap(map);
      case QuickbooksLineDetailType.discountLineDetail:
        return QuickbooksDiscountLine.fromMap(map);
      case QuickbooksLineDetailType.subTotalLineDetail:
        return QuickbooksSubtotalLine.fromMap(map);
      case QuickbooksLineDetailType.taxLineDetail:
        return QuickbooksTaxLine.fromMap(map);
      default:
        throw UnimplementedError(
            "No entity implemented for the line type $type");
    }
  }

  /// Converts a line to a json value
  String toJson();

  /// Converts a json value into a line by the line type.
  /// Throws an error if the line type is not supported.
  ///
  /// Currently supported lines are:
  /// - SalesItemLineDetail
  /// - GroupLineDetail
  /// - DescriptionOnlyLineDetail
  /// - DiscountLineDetail
  /// - SubTotalLineDetail
  /// - TaxLineDetail
  factory QuickbooksLine.fromJson(String source) =>
      QuickbooksLine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant QuickbooksLine other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.lineNum == lineNum &&
        other.description == description &&
        other.amount == amount &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        lineNum.hashCode ^
        description.hashCode ^
        amount.hashCode ^
        type.hashCode;
  }
}
