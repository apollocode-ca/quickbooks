// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quickbooks/entities/entity.export.dart';

/// Details of a [QuickbooksDescriptionOnlyLine]
class QuickbooksDescriptionLineDetails {
  QuickbooksReferenceType? taxCodeRef;
  DateTime? serviceDate;
  QuickbooksDescriptionLineDetails({
    this.taxCodeRef,
    this.serviceDate,
  });

  QuickbooksDescriptionLineDetails copyWith({
    QuickbooksReferenceType? taxCodeRef,
    DateTime? serviceDate,
  }) {
    return QuickbooksDescriptionLineDetails(
      taxCodeRef: taxCodeRef ?? this.taxCodeRef,
      serviceDate: serviceDate ?? this.serviceDate,
    );
  }

  /// Converts to a map value
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'TaxCodeRef': taxCodeRef?.toMap(),
      'ServiceDate': serviceDate?.toString(),
    };
  }

  /// Converts from a map value
  factory QuickbooksDescriptionLineDetails.fromMap(Map<String, dynamic> map) {
    return QuickbooksDescriptionLineDetails(
      taxCodeRef: map['TaxCodeRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['TaxCodeRef'] as Map<String, dynamic>)
          : null,
      serviceDate: DateTime.tryParse(map['ServiceDate'].toString()),
    );
  }

  /// Converts to a json value
  String toJson() => json.encode(toMap());

  /// Converts from a json value
  factory QuickbooksDescriptionLineDetails.fromJson(String source) =>
      QuickbooksDescriptionLineDetails.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuickbooksDescriptionLineDetails(taxCodeRef: $taxCodeRef, serviceDate: $serviceDate)';

  @override
  bool operator ==(covariant QuickbooksDescriptionLineDetails other) {
    if (identical(this, other)) return true;

    return other.taxCodeRef == taxCodeRef && other.serviceDate == serviceDate;
  }

  @override
  int get hashCode => taxCodeRef.hashCode ^ serviceDate.hashCode;
}
