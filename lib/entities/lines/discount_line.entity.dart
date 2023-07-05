import 'dart:convert';

import 'package:quickbooks/entities/lines/discount_line_details.entity.dart';
import 'package:quickbooks/entities/lines/line.entity.dart';
import 'package:quickbooks/enums/invoice/detail_type.enum.dart';

/// Line of type discount for a [QuickbooksInvoice]
class QuickbooksDiscountLine extends QuickbooksLine {
  QuickbooksDiscountLineDetails discountLineDetail;

  QuickbooksDiscountLine({
    super.id,
    required super.lineNum,
    super.description,
    required super.amount,
    required super.type,
    required this.discountLineDetail,
  });

  QuickbooksDiscountLine copyWith(String? id, int? lineNum, String? description,
      double? amount, QuickbooksDiscountLineDetails? discountLineDetail) {
    return QuickbooksDiscountLine(
      id: id ?? this.id,
      lineNum: lineNum ?? this.lineNum,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      type: type,
      discountLineDetail: discountLineDetail ?? this.discountLineDetail,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'Id': id,
      'LineNum': lineNum,
      'Description': description,
      'Amount': amount,
      'DetailType': type.toJsonString(),
      'DiscountLineDetail': discountLineDetail.toMap(),
    };
  }

  factory QuickbooksDiscountLine.fromMap(Map<String, dynamic> map) {
    return QuickbooksDiscountLine(
      id: map['Id'],
      lineNum: int.tryParse(map['LineNum'].toString()) ?? 0,
      description: map['Description'],
      amount: double.tryParse(map['Amount'].toString()) ?? 0,
      type: QuickbooksLineDetailType.discountLineDetail,
      discountLineDetail:
          QuickbooksDiscountLineDetails.fromMap(map['DiscountLineDetail']),
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory QuickbooksDiscountLine.fromJson(String source) =>
      QuickbooksDiscountLine.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant QuickbooksLine other) {
    if (identical(this, other)) return true;

    return other is QuickbooksDiscountLine &&
        other.id == id &&
        other.lineNum == lineNum &&
        other.description == description &&
        other.amount == amount &&
        other.type == type &&
        other.discountLineDetail == discountLineDetail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        lineNum.hashCode ^
        description.hashCode ^
        amount.hashCode ^
        type.hashCode ^
        discountLineDetail.hashCode;
  }
}
