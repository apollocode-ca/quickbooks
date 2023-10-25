// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QuickbooksVendorPaymentBankDetail {
  String? bankAccountName;
  String? bankBranchIdentifier;
  String? bankAccountNumber;
  String? statementText;
  QuickbooksVendorPaymentBankDetail({
    this.bankAccountName,
    this.bankBranchIdentifier,
    this.bankAccountNumber,
    this.statementText,
  });

  QuickbooksVendorPaymentBankDetail copyWith({
    String? bankAccountName,
    String? bankBranchIdentifier,
    String? bankAccountNumber,
    String? statementText,
  }) {
    return QuickbooksVendorPaymentBankDetail(
      bankAccountName: bankAccountName ?? this.bankAccountName,
      bankBranchIdentifier: bankBranchIdentifier ?? this.bankBranchIdentifier,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
      statementText: statementText ?? this.statementText,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'BankAccountName': bankAccountName,
      'BankBranchIdentifier': bankBranchIdentifier,
      'BankAccountNumber': bankAccountNumber,
      'StatementText': statementText,
    };
  }

  factory QuickbooksVendorPaymentBankDetail.fromMap(Map<String, dynamic> map) {
    return QuickbooksVendorPaymentBankDetail(
      bankAccountName: map['BankAccountName'],
      bankBranchIdentifier: map['BankBranchIdentifier'],
      bankAccountNumber: map['BankAccountNumber'],
      statementText: map['StatementText'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksVendorPaymentBankDetail.fromJson(String source) =>
      QuickbooksVendorPaymentBankDetail.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksVendorPaymentBankDetail(bankAccountName: $bankAccountName, bankBranchIdentifier: $bankBranchIdentifier, bankAccountNumber: $bankAccountNumber, statementText: $statementText)';
  }

  @override
  bool operator ==(covariant QuickbooksVendorPaymentBankDetail other) {
    if (identical(this, other)) return true;

    return other.bankAccountName == bankAccountName &&
        other.bankBranchIdentifier == bankBranchIdentifier &&
        other.bankAccountNumber == bankAccountNumber &&
        other.statementText == statementText;
  }

  @override
  int get hashCode {
    return bankAccountName.hashCode ^
        bankBranchIdentifier.hashCode ^
        bankAccountNumber.hashCode ^
        statementText.hashCode;
  }
}
