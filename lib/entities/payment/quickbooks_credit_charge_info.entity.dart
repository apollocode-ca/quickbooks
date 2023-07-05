// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Credit charge for a [QuickbooksCreditCardPayment]
class QuickbooksCreditChargeInfo {
  int? ccExpiryMonth;
  bool? processPayment;
  String? postalCode;
  double? amount;
  String? nameOnAcct;
  int? ccExpiryYear;
  String? type;
  String? billAddrStreet;
  QuickbooksCreditChargeInfo({
    this.ccExpiryMonth,
    this.processPayment,
    this.postalCode,
    this.amount,
    this.nameOnAcct,
    this.ccExpiryYear,
    this.type,
    this.billAddrStreet,
  });

  QuickbooksCreditChargeInfo copyWith({
    int? ccExpiryMonth,
    bool? processPayment,
    String? postalCode,
    double? amount,
    String? nameOnAcct,
    int? ccExpiryYear,
    String? type,
    String? billAddrStreet,
  }) {
    return QuickbooksCreditChargeInfo(
      ccExpiryMonth: ccExpiryMonth ?? this.ccExpiryMonth,
      processPayment: processPayment ?? this.processPayment,
      postalCode: postalCode ?? this.postalCode,
      amount: amount ?? this.amount,
      nameOnAcct: nameOnAcct ?? this.nameOnAcct,
      ccExpiryYear: ccExpiryYear ?? this.ccExpiryYear,
      type: type ?? this.type,
      billAddrStreet: billAddrStreet ?? this.billAddrStreet,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'CcExpiryMonth': ccExpiryMonth,
      'ProcessPayment': processPayment,
      'PostalCode': postalCode,
      'Amount': amount,
      'NameOnAcct': nameOnAcct,
      'CcExpiryYear': ccExpiryYear,
      'Type': type,
      'BillAddrStreet': billAddrStreet,
    };
  }

  factory QuickbooksCreditChargeInfo.fromMap(Map<String, dynamic> map) {
    return QuickbooksCreditChargeInfo(
      ccExpiryMonth: int.tryParse(map['CcExpiryMonth'].toString()),
      processPayment: map['ProcessPayment'],
      postalCode: map['PostalCode'],
      amount: double.tryParse(map['Amount'].toString()),
      nameOnAcct: map['NameOnAcct'],
      ccExpiryYear: int.tryParse(map['CcExpiryYear'].toString()),
      type: map['Type'],
      billAddrStreet: map['BillAddrStreet'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksCreditChargeInfo.fromJson(String source) =>
      QuickbooksCreditChargeInfo.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksCreditChargeInfo(ccExpiryMonth: $ccExpiryMonth, processPayment: $processPayment, postalCode: $postalCode, amount: $amount, nameOnAcct: $nameOnAcct, ccExpiryYear: $ccExpiryYear, type: $type, billAddrStreet: $billAddrStreet)';
  }

  @override
  bool operator ==(covariant QuickbooksCreditChargeInfo other) {
    if (identical(this, other)) return true;

    return other.ccExpiryMonth == ccExpiryMonth &&
        other.processPayment == processPayment &&
        other.postalCode == postalCode &&
        other.amount == amount &&
        other.nameOnAcct == nameOnAcct &&
        other.ccExpiryYear == ccExpiryYear &&
        other.type == type &&
        other.billAddrStreet == billAddrStreet;
  }

  @override
  int get hashCode {
    return ccExpiryMonth.hashCode ^
        processPayment.hashCode ^
        postalCode.hashCode ^
        amount.hashCode ^
        nameOnAcct.hashCode ^
        ccExpiryYear.hashCode ^
        type.hashCode ^
        billAddrStreet.hashCode;
  }
}
