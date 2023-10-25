// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Entity to manage physical addresses in Quickbooks entities
class QuickbooksPhysicalAddress {
  String? id;
  String? line1;
  String? line2;
  String? line3;
  String? line4;
  String? line5;
  String? city;
  String? country;
  String? countrySubDivisionCode;
  String? postalCode;
  double? lat;
  double? long;
  QuickbooksPhysicalAddress({
    this.id,
    this.line1,
    this.line2,
    this.line3,
    this.line4,
    this.line5,
    this.city,
    this.country,
    this.countrySubDivisionCode,
    this.postalCode,
    this.lat,
    this.long,
  });

  QuickbooksPhysicalAddress copyWith({
    String? id,
    String? line1,
    String? line2,
    String? line3,
    String? line4,
    String? line5,
    String? city,
    String? country,
    String? countrySubDivisionCode,
    String? postalCode,
    double? lat,
    double? long,
  }) {
    return QuickbooksPhysicalAddress(
      id: id ?? this.id,
      line1: line1 ?? this.line1,
      line2: line2 ?? this.line2,
      line3: line3 ?? this.line3,
      line4: line4 ?? this.line4,
      line5: line5 ?? this.line5,
      city: city ?? this.city,
      country: country ?? this.country,
      countrySubDivisionCode:
          countrySubDivisionCode ?? this.countrySubDivisionCode,
      postalCode: postalCode ?? this.postalCode,
      lat: lat ?? this.lat,
      long: long ?? this.long,
    );
  }

  /// If [withId] is true, will send the [id] in the map
  Map<String, dynamic> toMap({bool withId = true}) {
    return <String, dynamic>{
      if (withId) 'Id': id,
      'Line1': line1,
      'Line2': line2,
      'Line3': line3,
      'Line4': line4,
      'Line5': line5,
      'City': city,
      'Country': country,
      'CountrySubDivisionCode': countrySubDivisionCode,
      'PostalCode': postalCode,
      'Lat': lat,
      'Long': long,
    };
  }

  factory QuickbooksPhysicalAddress.fromMap(Map<String, dynamic> map) {
    return QuickbooksPhysicalAddress(
      id: map['Id'],
      line1: map['Line1'],
      line2: map['Line2'],
      line3: map['Line3'],
      line4: map['Line4'],
      line5: map['Line5'],
      city: map['City'],
      country: map['Country'],
      countrySubDivisionCode: map['CountrySubDivisionCode'],
      postalCode: map['PostalCode'],
      lat: double.tryParse(map['Lat'].toString()),
      long: double.tryParse(map['Long'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksPhysicalAddress.fromJson(String source) =>
      QuickbooksPhysicalAddress.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QuickbooksAddress(id: $id, line1: $line1, line2: $line2, line3: $line3, line4: $line4, line5: $line5, city: $city, country: $country, countrySubDivisionCode: $countrySubDivisionCode, postalCode: $postalCode, lat: $lat, long: $long)';
  }

  @override
  bool operator ==(covariant QuickbooksPhysicalAddress other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.line1 == line1 &&
        other.line2 == line2 &&
        other.line3 == line3 &&
        other.line4 == line4 &&
        other.line5 == line5 &&
        other.city == city &&
        other.country == country &&
        other.countrySubDivisionCode == countrySubDivisionCode &&
        other.postalCode == postalCode &&
        other.lat == lat &&
        other.long == long;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        line1.hashCode ^
        line2.hashCode ^
        line3.hashCode ^
        line4.hashCode ^
        line5.hashCode ^
        city.hashCode ^
        country.hashCode ^
        countrySubDivisionCode.hashCode ^
        postalCode.hashCode ^
        lat.hashCode ^
        long.hashCode;
  }
}
