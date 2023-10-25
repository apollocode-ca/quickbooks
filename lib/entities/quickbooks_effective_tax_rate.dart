// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Effective tax rate for a [QuickbooksTaxRate]
class QuickbooksEffectiveTaxRate {
  double? rateValue;
  DateTime? endDate;
  DateTime? effectiveDate;
  QuickbooksEffectiveTaxRate({
    this.rateValue,
    this.endDate,
    this.effectiveDate,
  });

  QuickbooksEffectiveTaxRate copyWith({
    double? rateValue,
    DateTime? endDate,
    DateTime? effectiveDate,
  }) {
    return QuickbooksEffectiveTaxRate(
      rateValue: rateValue ?? this.rateValue,
      endDate: endDate ?? this.endDate,
      effectiveDate: effectiveDate ?? this.effectiveDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'RateValue': rateValue,
      'EndDate': endDate,
      'EffectiveDate': effectiveDate,
    };
  }

  factory QuickbooksEffectiveTaxRate.fromMap(Map<String, dynamic> map) {
    return QuickbooksEffectiveTaxRate(
      rateValue: double.tryParse(map['RateValue'].toString()),
      endDate: map['EndDate'] != null
          ? DateTime.parse(map['EndDate'].toString())
          : null,
      effectiveDate: map['EffectiveDate'] != null
          ? DateTime.parse(map['EffectiveDate'].toString())
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksEffectiveTaxRate.fromJson(String source) =>
      QuickbooksEffectiveTaxRate.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuickbooksEffectiveTaxRate(rateValue: $rateValue, endDate: $endDate, effectiveDate: $effectiveDate)';

  @override
  bool operator ==(covariant QuickbooksEffectiveTaxRate other) {
    if (identical(this, other)) return true;

    return other.rateValue == rateValue &&
        other.endDate == endDate &&
        other.effectiveDate == effectiveDate;
  }

  @override
  int get hashCode =>
      rateValue.hashCode ^ endDate.hashCode ^ effectiveDate.hashCode;
}
