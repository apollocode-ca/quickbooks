// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:quickbooks/entities/entity.export.dart';

/// Details of a [QuickbooksGroupLine]
class QuickbooksGroupLineDetails {
  double? quantity;
  List<QuickbooksLine>? line;
  QuickbooksReferenceType? groupItemRef;
  QuickbooksGroupLineDetails({
    this.quantity,
    this.line,
    this.groupItemRef,
  });

  QuickbooksGroupLineDetails copyWith({
    double? quantity,
    List<QuickbooksLine>? line,
    QuickbooksReferenceType? groupItemRef,
  }) {
    return QuickbooksGroupLineDetails(
      quantity: quantity ?? this.quantity,
      line: line ?? this.line,
      groupItemRef: groupItemRef ?? this.groupItemRef,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Quantity': quantity,
      'Line': line?.map((x) => x.toMap()).toList(),
      'GroupItemRef': groupItemRef?.toMap(),
    };
  }

  factory QuickbooksGroupLineDetails.fromMap(Map<String, dynamic> map) {
    return QuickbooksGroupLineDetails(
      quantity: double.tryParse(map['Quantity'].toString()),
      line: map['Line'] != null
          ? List<QuickbooksLine>.from(
              (map['Line'] as List).map<QuickbooksLine?>(
                (x) => QuickbooksLine.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      groupItemRef: map['GroupItemRef'] != null
          ? QuickbooksReferenceType.fromMap(
              map['GroupItemRef'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksGroupLineDetails.fromJson(String source) =>
      QuickbooksGroupLineDetails.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuickbooksGroupLineDetails(quantity: $quantity, line: $line, groupItemRef: $groupItemRef)';

  @override
  bool operator ==(covariant QuickbooksGroupLineDetails other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.quantity == quantity &&
        listEquals(other.line, line) &&
        other.groupItemRef == groupItemRef;
  }

  @override
  int get hashCode => quantity.hashCode ^ line.hashCode ^ groupItemRef.hashCode;
}
