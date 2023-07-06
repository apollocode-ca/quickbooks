import 'dart:convert';

import 'package:quickbooks/entities/lines/line.entity.dart';
import 'package:quickbooks/entities/lines/tax_line_details.entity.dart';
import 'package:quickbooks/enums/invoice/detail_type.enum.dart';

/// Line of type tax for a [QuickbooksInvoice]
class QuickbooksTaxLine extends QuickbooksLine {
  QuickbooksTaxLineDetails taxLineDetail;

  QuickbooksTaxLine({
    super.id,
    required super.lineNum,
    super.description,
    required super.amount,
    required super.type,
    required this.taxLineDetail,
  });

  QuickbooksTaxLine copyWith(String? id, int? lineNum, String? description,
      double? amount, QuickbooksTaxLineDetails? taxLineDetail) {
    return QuickbooksTaxLine(
      id: id ?? this.id,
      lineNum: lineNum ?? this.lineNum,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      type: type,
      taxLineDetail: taxLineDetail ?? this.taxLineDetail,
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
      'TaxLineDetail': taxLineDetail.toMap(),
    };
  }

  /// Converts from a map value
  factory QuickbooksTaxLine.fromMap(Map<String, dynamic> map) {
    return QuickbooksTaxLine(
      id: map['Id'],
      lineNum: int.tryParse(map['LineNum'].toString()) ?? 0,
      description: map['Description'],
      amount: double.tryParse(map['Amount'].toString()) ?? 0,
      type: QuickbooksLineDetailType.taxLineDetail,
      taxLineDetail: QuickbooksTaxLineDetails.fromMap(map['TaxLineDetail']),
    );
  }

  /// Converts to a json value
  @override
  String toJson() => json.encode(toMap());

  /// Converts from a json value
  factory QuickbooksTaxLine.fromJson(String source) =>
      QuickbooksTaxLine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant QuickbooksLine other) {
    if (identical(this, other)) return true;

    return other is QuickbooksTaxLine &&
        other.id == id &&
        other.lineNum == lineNum &&
        other.description == description &&
        other.amount == amount &&
        other.type == type &&
        other.taxLineDetail == taxLineDetail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        lineNum.hashCode ^
        description.hashCode ^
        amount.hashCode ^
        type.hashCode ^
        taxLineDetail.hashCode;
  }
}
