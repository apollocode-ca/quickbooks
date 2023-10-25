import 'dart:convert';

import 'package:quickbooks/entities/lines/group_line_defails.entity.dart';
import 'package:quickbooks/entities/lines/line.entity.dart';
import 'package:quickbooks/enums/invoice/detail_type.enum.dart';

/// Line of type group for a [QuickbooksInvoice]
class QuickbooksGroupLine extends QuickbooksLine {
  QuickbooksGroupLineDetails groupLineDetail;

  QuickbooksGroupLine({
    super.id,
    super.lineNum,
    super.description,
    required super.amount,
    required super.type,
    required this.groupLineDetail,
  });

  QuickbooksGroupLine copyWith(String? id, int? lineNum, String? description,
      double? amount, QuickbooksGroupLineDetails? groupLineDetail) {
    return QuickbooksGroupLine(
      id: id ?? this.id,
      lineNum: lineNum ?? this.lineNum,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      type: type,
      groupLineDetail: groupLineDetail ?? this.groupLineDetail,
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
      'GroupLineDetail': groupLineDetail.toMap(),
    };
  }

  /// Converts from a map value
  factory QuickbooksGroupLine.fromMap(Map<String, dynamic> map) {
    return QuickbooksGroupLine(
      id: map['Id'],
      lineNum: int.tryParse(map['LineNum'].toString()) ?? 0,
      description: map['Description'],
      amount: double.tryParse(map['Amount'].toString()) ?? 0,
      type: QuickbooksLineDetailType.groupLineDetail,
      groupLineDetail:
          QuickbooksGroupLineDetails.fromMap(map['GroupLineDetail']),
    );
  }

  /// Converts to a json value
  @override
  String toJson() => json.encode(toMap());

  /// Converts from a json value
  factory QuickbooksGroupLine.fromJson(String source) =>
      QuickbooksGroupLine.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant QuickbooksLine other) {
    if (identical(this, other)) return true;

    return other is QuickbooksGroupLine &&
        other.id == id &&
        other.lineNum == lineNum &&
        other.description == description &&
        other.amount == amount &&
        other.type == type &&
        other.groupLineDetail == groupLineDetail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        lineNum.hashCode ^
        description.hashCode ^
        amount.hashCode ^
        type.hashCode ^
        groupLineDetail.hashCode;
  }
}
