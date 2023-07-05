import 'dart:convert';

import 'package:quickbooks/entities/lines/line.entity.dart';
import 'package:quickbooks/entities/lines/sales_item_line_detail.entity.dart';
import 'package:quickbooks/enums/invoice/detail_type.enum.dart';

/// Line of type sales item for a [QuickbooksInvoice]
class QuickbooksSalesItemLine extends QuickbooksLine {
  QuickbooksSalesItemLineDetails salesItemLineDetail;

  QuickbooksSalesItemLine({
    super.id,
    required super.lineNum,
    super.description,
    required super.amount,
    required super.type,
    required this.salesItemLineDetail,
  });

  QuickbooksSalesItemLine copyWith(
      String? id,
      int? lineNum,
      String? description,
      double? amount,
      QuickbooksSalesItemLineDetails? salesItemLineDetail) {
    return QuickbooksSalesItemLine(
      id: id ?? this.id,
      lineNum: lineNum ?? this.lineNum,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      type: type,
      salesItemLineDetail: salesItemLineDetail ?? this.salesItemLineDetail,
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
      'SalesItemLineDetail': salesItemLineDetail.toMap(),
    };
  }

  factory QuickbooksSalesItemLine.fromMap(Map<String, dynamic> map) {
    return QuickbooksSalesItemLine(
      id: map['Id'],
      lineNum: int.tryParse(map['LineNum'].toString()) ?? 0,
      description: map['Description'],
      amount: double.tryParse(map['Amount'].toString()) ?? 0,
      type: QuickbooksLineDetailType.salesItemLineDetail,
      salesItemLineDetail:
          QuickbooksSalesItemLineDetails.fromMap(map['SalesItemLineDetail']),
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory QuickbooksSalesItemLine.fromJson(String source) =>
      QuickbooksSalesItemLine.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant QuickbooksLine other) {
    if (identical(this, other)) return true;

    return other is QuickbooksSalesItemLine &&
        other.id == id &&
        other.lineNum == lineNum &&
        other.description == description &&
        other.amount == amount &&
        other.type == type &&
        other.salesItemLineDetail == salesItemLineDetail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        lineNum.hashCode ^
        description.hashCode ^
        amount.hashCode ^
        type.hashCode ^
        salesItemLineDetail.hashCode;
  }
}
