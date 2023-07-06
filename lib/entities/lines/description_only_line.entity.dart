import 'dart:convert';

import 'package:quickbooks/entities/lines/description_line_details.entity.dart';
import 'package:quickbooks/entities/lines/line.entity.dart';
import 'package:quickbooks/enums/invoice/detail_type.enum.dart';

/// Line of type description only for a [QuickbooksInvoice]
class QuickbooksDescriptionOnlyLine extends QuickbooksLine {
  QuickbooksDescriptionLineDetails descriptionLineDetail;

  QuickbooksDescriptionOnlyLine({
    super.id,
    required super.lineNum,
    super.description,
    required super.amount,
    required super.type,
    required this.descriptionLineDetail,
  });

  QuickbooksDescriptionOnlyLine copyWith(
      String? id,
      int? lineNum,
      String? description,
      double? amount,
      QuickbooksDescriptionLineDetails? salesItemLineDetails) {
    return QuickbooksDescriptionOnlyLine(
      id: id ?? this.id,
      lineNum: lineNum ?? this.lineNum,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      type: type,
      descriptionLineDetail: salesItemLineDetails ?? descriptionLineDetail,
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
      'DescriptionLineDetail': descriptionLineDetail.toMap(),
    };
  }

  /// Converts from a map value
  factory QuickbooksDescriptionOnlyLine.fromMap(Map<String, dynamic> map) {
    return QuickbooksDescriptionOnlyLine(
      id: map['Id'],
      lineNum: int.tryParse(map['LineNum'].toString()) ?? 0,
      description: map['Description'],
      amount: double.tryParse(map['Amount'].toString()) ?? 0,
      type: QuickbooksLineDetailType.descriptionOnlyLineDetail,
      descriptionLineDetail: QuickbooksDescriptionLineDetails.fromMap(
          map['DescriptionLineDetails']),
    );
  }

  /// Converts to a json value
  @override
  String toJson() => json.encode(toMap());

  /// Converts from a json value
  factory QuickbooksDescriptionOnlyLine.fromJson(String source) =>
      QuickbooksDescriptionOnlyLine.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant QuickbooksLine other) {
    if (identical(this, other)) return true;

    return other is QuickbooksDescriptionOnlyLine &&
        other.id == id &&
        other.lineNum == lineNum &&
        other.description == description &&
        other.amount == amount &&
        other.type == type &&
        other.descriptionLineDetail == descriptionLineDetail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        lineNum.hashCode ^
        description.hashCode ^
        amount.hashCode ^
        type.hashCode ^
        descriptionLineDetail.hashCode;
  }
}
