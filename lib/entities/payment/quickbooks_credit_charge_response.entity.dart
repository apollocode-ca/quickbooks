// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

/// Credit charge response for a [QuickbooksCreditCardPayment]
class QuickbooksCreditChargeResponse {
  String? status;
  String? authCode;
  DateTime? txnAuthorizationTime;
  String? CCTransid;
  QuickbooksCreditChargeResponse({
    this.status,
    this.authCode,
    this.txnAuthorizationTime,
    this.CCTransid,
  });

  QuickbooksCreditChargeResponse copyWith({
    String? status,
    String? authCode,
    DateTime? txnAuthorizationTime,
    String? CCTransid,
  }) {
    return QuickbooksCreditChargeResponse(
      status: status ?? this.status,
      authCode: authCode ?? this.authCode,
      txnAuthorizationTime: txnAuthorizationTime ?? this.txnAuthorizationTime,
      CCTransid: CCTransid ?? this.CCTransid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Status': status,
      'AuthCode': authCode,
      'TxnAuthorizationTime': txnAuthorizationTime?.millisecondsSinceEpoch,
      'CCTransid': CCTransid,
    };
  }

  factory QuickbooksCreditChargeResponse.fromMap(Map<String, dynamic> map) {
    return QuickbooksCreditChargeResponse(
      status: map['Status'],
      authCode: map['AuthCode'],
      txnAuthorizationTime:
          DateTime.tryParse(map['TxnAuthorizationTime'].toString()),
      CCTransid: map['CCTransid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksCreditChargeResponse.fromJson(String source) =>
      QuickbooksCreditChargeResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksCreditChargeResponse(status: $status, authCode: $authCode, txnAuthorizationTime: $txnAuthorizationTime, CCTransid: $CCTransid)';
  }

  @override
  bool operator ==(covariant QuickbooksCreditChargeResponse other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.authCode == authCode &&
        other.txnAuthorizationTime == txnAuthorizationTime &&
        other.CCTransid == CCTransid;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        authCode.hashCode ^
        txnAuthorizationTime.hashCode ^
        CCTransid.hashCode;
  }
}
