// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Delivery info for a [QuickbooksInvoice]
class QuickbooksDeliveryInfo {
  String? deliveryType;
  DateTime? deliveryTime;
  QuickbooksDeliveryInfo({
    this.deliveryType,
    this.deliveryTime,
  });

  QuickbooksDeliveryInfo copyWith({
    String? deliveryType,
    DateTime? deliveryTime,
  }) {
    return QuickbooksDeliveryInfo(
      deliveryType: deliveryType ?? this.deliveryType,
      deliveryTime: deliveryTime ?? this.deliveryTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deliveryType': deliveryType,
      'deliveryTime': deliveryTime?.toString(),
    };
  }

  factory QuickbooksDeliveryInfo.fromMap(Map<String, dynamic> map) {
    return QuickbooksDeliveryInfo(
      deliveryType: map['deliveryType'],
      deliveryTime: DateTime.tryParse(map['deliveryTime'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksDeliveryInfo.fromJson(String source) =>
      QuickbooksDeliveryInfo.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuickbooksDeliveryInfo(deliveryType: $deliveryType, deliveryTime: $deliveryTime)';

  @override
  bool operator ==(covariant QuickbooksDeliveryInfo other) {
    if (identical(this, other)) return true;

    return other.deliveryType == deliveryType &&
        other.deliveryTime == deliveryTime;
  }

  @override
  int get hashCode => deliveryType.hashCode ^ deliveryTime.hashCode;
}
