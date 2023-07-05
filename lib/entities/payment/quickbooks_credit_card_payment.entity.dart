// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quickbooks/entities/payment/quickbooks_credit_charge_info.entity.dart';
import 'package:quickbooks/entities/payment/quickbooks_credit_charge_response.entity.dart';

/// Credit card payment for a [QuickbooksPayment]
class QuickbooksCreditCardPayment {
  QuickbooksCreditChargeResponse? creditChargeResponse;
  QuickbooksCreditChargeInfo? creditChargeInfo;
  QuickbooksCreditCardPayment({
    this.creditChargeResponse,
    this.creditChargeInfo,
  });

  QuickbooksCreditCardPayment copyWith({
    QuickbooksCreditChargeResponse? creditChargeResponse,
    QuickbooksCreditChargeInfo? creditChargeInfo,
  }) {
    return QuickbooksCreditCardPayment(
      creditChargeResponse: creditChargeResponse ?? this.creditChargeResponse,
      creditChargeInfo: creditChargeInfo ?? this.creditChargeInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CreditChargeResponse': creditChargeResponse?.toMap(),
      'CreditChargeInfo': creditChargeInfo?.toMap(),
    };
  }

  factory QuickbooksCreditCardPayment.fromMap(Map<String, dynamic> map) {
    return QuickbooksCreditCardPayment(
      creditChargeResponse: map['CreditChargeResponse'] != null
          ? QuickbooksCreditChargeResponse.fromMap(
              map['CreditChargeResponse'] as Map<String, dynamic>)
          : null,
      creditChargeInfo: map['creditChargeInfo'] != null
          ? QuickbooksCreditChargeInfo.fromMap(
              map['CreditChargeInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksCreditCardPayment.fromJson(String source) =>
      QuickbooksCreditCardPayment.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuickbooksCreditCardPayment(creditChargeResponse: $creditChargeResponse, creditChargeInfo: $creditChargeInfo)';

  @override
  bool operator ==(covariant QuickbooksCreditCardPayment other) {
    if (identical(this, other)) return true;

    return other.creditChargeResponse == creditChargeResponse &&
        other.creditChargeInfo == creditChargeInfo;
  }

  @override
  int get hashCode => creditChargeResponse.hashCode ^ creditChargeInfo.hashCode;
}
