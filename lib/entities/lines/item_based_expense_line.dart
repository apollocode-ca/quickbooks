// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:quickbooks/entities/lines/item_based_expense_line_details.dart';
import 'package:quickbooks/entities/lines/line.entity.dart';
import 'package:quickbooks/entities/quickbooks_linked_txn.entity.dart';
import 'package:quickbooks/enums/invoice/detail_type.enum.dart';

/// Details of a [QuickbooksItemBasedExpenseLine]
class QuickbooksItemBasedExpenseLine extends QuickbooksLine {
  QuickbooksItemBasedExpenseLineDetails? itemBasedExpenseLineDetail;
  List<QuickbooksLinkedTxn>? linkedTxn;
  QuickbooksItemBasedExpenseLine({
    super.id,
    super.lineNum,
    super.description,
    required super.amount,
    required super.type,
    this.itemBasedExpenseLineDetail,
    this.linkedTxn,
  });

  QuickbooksItemBasedExpenseLine copyWith({
    String? id,
    int? lineNum,
    String? description,
    double? amount,
    QuickbooksItemBasedExpenseLineDetails? itemBasedExpenseLineDetail,
    List<QuickbooksLinkedTxn>? linkedTxn,
  }) {
    return QuickbooksItemBasedExpenseLine(
      id: id ?? this.id,
      lineNum: lineNum ?? this.lineNum,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      type: type,
      itemBasedExpenseLineDetail:
          itemBasedExpenseLineDetail ?? this.itemBasedExpenseLineDetail,
      linkedTxn: linkedTxn ?? this.linkedTxn,
    );
  }

  /// Converts to a map value
  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Id': id,
      'LineNum': lineNum,
      'Description': description,
      'Amount': amount,
      'DetailType': type.toJsonString(),
      'ItemBasedExpenseLineDetail': itemBasedExpenseLineDetail?.toMap(),
      'LinkedTxn': linkedTxn?.map((x) => x.toMap()).toList(),
    };
  }

  /// Converts from a map value
  factory QuickbooksItemBasedExpenseLine.fromMap(Map<String, dynamic> map) {
    return QuickbooksItemBasedExpenseLine(
      id: map['Id'],
      lineNum: int.tryParse(map['LineNum'].toString()) ?? 0,
      description: map['Description'],
      amount: double.tryParse(map['Amount'].toString()) ?? 0,
      type: QuickbooksLineDetailType.itemBasedExpenseLineDetail,
      itemBasedExpenseLineDetail: map['ItemBasedExpenseLineDetail'] != null
          ? QuickbooksItemBasedExpenseLineDetails.fromMap(
              map['ItemBasedExpenseLineDetail'] as Map<String, dynamic>)
          : null,
      linkedTxn: map['LinkedTxn'] != null
          ? List<QuickbooksLinkedTxn>.from(
              (map['LinkedTxn'] as List<int>).map<QuickbooksLinkedTxn?>(
                (x) => QuickbooksLinkedTxn.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  /// Converts to a json value
  @override
  String toJson() => json.encode(toMap());

  /// Converts from a json value
  factory QuickbooksItemBasedExpenseLine.fromJson(String source) =>
      QuickbooksItemBasedExpenseLine.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QuickbooksItemBasedExpenseLine(linkedTxn: $linkedTxn)';

  @override
  bool operator ==(covariant QuickbooksItemBasedExpenseLine other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.linkedTxn, linkedTxn);
  }

  @override
  int get hashCode => linkedTxn.hashCode;
}
