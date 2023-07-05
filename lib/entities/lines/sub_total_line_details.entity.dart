// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:quickbooks/entities/entity.export.dart';

/// Details of a [QuickbooksSubtotalLine]
class QuickbooksSubtotalLineDetails {
  QuickbooksReferenceType? itemRef;
  QuickbooksSubtotalLineDetails({
    this.itemRef,
  });

  QuickbooksSubtotalLineDetails copyWith({
    QuickbooksReferenceType? itemRef,
  }) {
    return QuickbooksSubtotalLineDetails(
      itemRef: itemRef ?? this.itemRef,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ItemRef': itemRef?.toMap(),
    };
  }

  factory QuickbooksSubtotalLineDetails.fromMap(Map<String, dynamic> map) {
    return QuickbooksSubtotalLineDetails(
      itemRef: map['ItemRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['ItemRef'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksSubtotalLineDetails.fromJson(String source) =>
      QuickbooksSubtotalLineDetails.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QuickbooksSubtotalLineDetails(itemRef: $itemRef)';

  @override
  bool operator ==(covariant QuickbooksSubtotalLineDetails other) {
    if (identical(this, other)) return true;

    return other.itemRef == itemRef;
  }

  @override
  int get hashCode => itemRef.hashCode;
}
