import 'dart:convert';

import 'package:quickbooks/entities/lines/line.entity.dart';
import 'package:quickbooks/entities/lines/sub_total_line_details.entity.dart';
import 'package:quickbooks/enums/invoice/detail_type.enum.dart';

/// Line of type subtotal for a [QuickbooksInvoice]
class QuickbooksSubtotalLine extends QuickbooksLine {
  QuickbooksSubtotalLineDetails? subtotalLineDetail;

  QuickbooksSubtotalLine({
    super.id,
    super.lineNum,
    super.description,
    required super.amount,
    required super.type,
    required this.subtotalLineDetail,
  });

  QuickbooksSubtotalLine copyWith(String? id, int? lineNum, String? description,
      double? amount, QuickbooksSubtotalLineDetails? subtotalLineDetail) {
    return QuickbooksSubtotalLine(
      id: id ?? this.id,
      lineNum: lineNum ?? this.lineNum,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      type: type,
      subtotalLineDetail: subtotalLineDetail ?? this.subtotalLineDetail,
    );
  }

  /// Converts to a map value
  @override
  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'LineNum': lineNum,
      'Description': description,
      'Amount': amount,
      'DetailType': type.toJsonString(),
      'SubtotalLineDetail': subtotalLineDetail?.toMap(),
    };
  }

  /// Converts from a map value
  factory QuickbooksSubtotalLine.fromMap(Map<String, dynamic> map) {
    return QuickbooksSubtotalLine(
      id: map['Id'],
      lineNum: int.tryParse(map['LineNum'].toString()) ?? 0,
      description: map['Description'],
      amount: double.tryParse(map['Amount'].toString()) ?? 0,
      type: QuickbooksLineDetailType.subTotalLineDetail,
      subtotalLineDetail: map['SubtotalLineDetail'] != null
          ? QuickbooksSubtotalLineDetails.fromMap(map['SubtotalLineDetail'])
          : null,
    );
  }

  /// Converts to a json value
  @override
  String toJson() => json.encode(toMap());

  /// Converts from a json value
  factory QuickbooksSubtotalLine.fromJson(String source) =>
      QuickbooksSubtotalLine.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant QuickbooksLine other) {
    if (identical(this, other)) return true;

    return other is QuickbooksSubtotalLine &&
        other.id == id &&
        other.lineNum == lineNum &&
        other.description == description &&
        other.amount == amount &&
        other.type == type &&
        other.subtotalLineDetail == subtotalLineDetail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        lineNum.hashCode ^
        description.hashCode ^
        amount.hashCode ^
        type.hashCode ^
        subtotalLineDetail.hashCode;
  }
}
