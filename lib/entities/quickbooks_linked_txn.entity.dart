// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

///Entity for linked txn of all entities in quickbooks
class QuickbooksLinkedTxn {
  String? txnId;
  String? txnType;
  String? txnLineId;
  QuickbooksLinkedTxn({
    this.txnId,
    this.txnType,
    this.txnLineId,
  });

  QuickbooksLinkedTxn copyWith({
    String? txnId,
    String? txnType,
    String? txnLineId,
  }) {
    return QuickbooksLinkedTxn(
      txnId: txnId ?? this.txnId,
      txnType: txnType ?? this.txnType,
      txnLineId: txnLineId ?? this.txnLineId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'TxnId': txnId,
      'TxnType': txnType,
      'TxnLineId': txnLineId,
    };
  }

  factory QuickbooksLinkedTxn.fromMap(Map<String, dynamic> map) {
    return QuickbooksLinkedTxn(
      txnId: map['TxnId'],
      txnType: map['TxnType'],
      txnLineId: map['TxnLineId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksLinkedTxn.fromJson(String source) =>
      QuickbooksLinkedTxn.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuickbooksLinkedTxn(txnId: $txnId, txnType: $txnType, txnLineId: $txnLineId)';

  @override
  bool operator ==(covariant QuickbooksLinkedTxn other) {
    if (identical(this, other)) return true;

    return other.txnId == txnId &&
        other.txnType == txnType &&
        other.txnLineId == txnLineId;
  }

  @override
  int get hashCode => txnId.hashCode ^ txnType.hashCode ^ txnLineId.hashCode;
}
