// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:quickbooks/entities/payment/quickbooks_payment_line_ex.entity.dart';

/// List of [QuickbooksPaymentLineEx] for a [QuickbooksPaymentLine]
class QuickbooksPaymentLineExList {
  List<QuickbooksPaymentLineEx>? any;
  QuickbooksPaymentLineExList({
    this.any,
  });

  QuickbooksPaymentLineExList copyWith({
    List<QuickbooksPaymentLineEx>? any,
  }) {
    return QuickbooksPaymentLineExList(
      any: any ?? this.any,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'any': any?.map((x) => x.toMap()).toList(),
    };
  }

  factory QuickbooksPaymentLineExList.fromMap(Map<String, dynamic> map) {
    return QuickbooksPaymentLineExList(
      any: map['any'] != null
          ? List<QuickbooksPaymentLineEx>.from(
              (map['any'] as List).map<QuickbooksPaymentLineEx?>(
                (x) =>
                    QuickbooksPaymentLineEx.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksPaymentLineExList.fromJson(String source) =>
      QuickbooksPaymentLineExList.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QuickbooksPaymentLineExList(any: $any)';

  @override
  bool operator ==(covariant QuickbooksPaymentLineExList other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.any, any);
  }

  @override
  int get hashCode => any.hashCode;
}
