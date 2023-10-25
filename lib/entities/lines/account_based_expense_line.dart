// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quickbooks/entities/entity.export.dart';
import 'package:quickbooks/enums/invoice/detail_type.enum.dart';

/// Details of a [QuickbooksAccountBasedExpenseLine]
class QuickbooksAccountBasedExpenseLine extends QuickbooksLine {
  QuickbooksAccountBasedExpenseLineDetails? accountBasedExpenseLineDetail;

  QuickbooksAccountBasedExpenseLine({
    super.id,
    super.lineNum,
    super.description,
    required super.amount,
    required super.type,
    this.accountBasedExpenseLineDetail,
  });

  QuickbooksAccountBasedExpenseLine copyWith({
    String? id,
    int? lineNum,
    String? description,
    double? amount,
    QuickbooksAccountBasedExpenseLineDetails? accountBasedExpenseLineDetail,
  }) {
    return QuickbooksAccountBasedExpenseLine(
      id: id ?? this.id,
      lineNum: lineNum ?? this.lineNum,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      type: type,
      accountBasedExpenseLineDetail:
          accountBasedExpenseLineDetail ?? this.accountBasedExpenseLineDetail,
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
      'AccountBasedExpenseLineDetail': accountBasedExpenseLineDetail?.toMap(),
    };
  }

  /// Converts from a map value
  factory QuickbooksAccountBasedExpenseLine.fromMap(Map<String, dynamic> map) {
    return QuickbooksAccountBasedExpenseLine(
      id: map['Id'],
      lineNum: int.tryParse(map['LineNum'].toString()) ?? 0,
      description: map['Description'],
      amount: double.tryParse(map['Amount'].toString()) ?? 0,
      type: QuickbooksLineDetailType.accountBasedExpenseLineDetail,
      accountBasedExpenseLineDetail:
          map['AccountBasedExpenseLineDetail'] == null
              ? null
              : QuickbooksAccountBasedExpenseLineDetails.fromMap(
                  map['AccountBasedExpenseLineDetail'] as Map<String, dynamic>),
    );
  }

  /// Converts to a json value
  @override
  String toJson() => json.encode(toMap());

  /// Converts from a json value
  factory QuickbooksAccountBasedExpenseLine.fromJson(String source) =>
      QuickbooksAccountBasedExpenseLine.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QuickbooksAccountBasedExpenseLine()';

  @override
  bool operator ==(covariant QuickbooksAccountBasedExpenseLine other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.lineNum == lineNum &&
        other.description == description &&
        other.amount == amount &&
        other.type == type &&
        other.accountBasedExpenseLineDetail == accountBasedExpenseLineDetail;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      lineNum.hashCode ^
      description.hashCode ^
      amount.hashCode ^
      type.hashCode ^
      accountBasedExpenseLineDetail.hashCode;
}
