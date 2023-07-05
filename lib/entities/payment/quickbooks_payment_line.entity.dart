// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:quickbooks/entities/entity.export.dart';

/// Line for a [QuickbooksPayment]
class QuickbooksPaymentLine {
  double? amount;
  List<QuickbooksLinkedTxn>? linkedTxn;
  QuickbooksPaymentLine({
    this.amount,
    this.linkedTxn,
  });

  QuickbooksPaymentLine copyWith({
    double? amount,
    List<QuickbooksLinkedTxn>? linkedTxn,
  }) {
    return QuickbooksPaymentLine(
      amount: amount ?? this.amount,
      linkedTxn: linkedTxn ?? this.linkedTxn,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Amount': amount,
      'LinkedTxn': linkedTxn?.map((x) => x.toMap()).toList(),
    };
  }

  factory QuickbooksPaymentLine.fromMap(Map<String, dynamic> map) {
    return QuickbooksPaymentLine(
      amount: double.tryParse(map['Amount'].toString()),
      linkedTxn: map['LinkedTxn'] != null
          ? List<QuickbooksLinkedTxn>.from(
              (map['LinkedTxn'] as List).map<QuickbooksLinkedTxn?>(
                (x) => QuickbooksLinkedTxn.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksPaymentLine.fromJson(String source) =>
      QuickbooksPaymentLine.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuickbooksPaymentLine(amount: $amount, linkedTxn: $linkedTxn)';

  @override
  bool operator ==(covariant QuickbooksPaymentLine other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.amount == amount && listEquals(other.linkedTxn, linkedTxn);
  }

  @override
  int get hashCode => amount.hashCode ^ linkedTxn.hashCode;
}
