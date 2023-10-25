import 'dart:convert';

/// Quickbooks items categories
class QuickbooksCategory {
  String? id;
  String? fullyQualifiedName;
  String? domain;
  String? name;
  String? syncToken;
  bool? sparse;
  bool? active;

  QuickbooksCategory({
    this.id,
    this.fullyQualifiedName,
    this.domain,
    this.name,
    this.syncToken,
    this.sparse,
    this.active,
  });

  QuickbooksCategory copyWith({
    String? id,
    String? fullyQualifiedName,
    String? domain,
    String? name,
    String? syncToken,
    bool? sparse,
    bool? active,
  }) {
    return QuickbooksCategory(
      id: id ?? this.id,
      fullyQualifiedName: fullyQualifiedName ?? this.fullyQualifiedName,
      domain: domain ?? this.domain,
      name: name ?? this.name,
      syncToken: syncToken ?? this.syncToken,
      sparse: sparse ?? this.sparse,
      active: active ?? this.active,
    );
  }

  /// If [withId] is true, will send the [id] in the map
  Map<String, dynamic> toMap({bool withId = true}) {
    return {
      if (withId) 'Id': id,
      'FullyQualifiedName': fullyQualifiedName,
      'domain': domain,
      'Name': name,
      'SyncToken': syncToken,
      'sparse': sparse,
      'Active': active,
      'Type': 'Category',
    };
  }

  factory QuickbooksCategory.fromMap(Map<String, dynamic> map) {
    return QuickbooksCategory(
      id: map['Id'],
      fullyQualifiedName: map['FullyQualifiedName'],
      domain: map['domain'],
      name: map['Name'],
      syncToken: map['SyncToken'],
      sparse: map['sparse'],
      active: map['Active'],
    );
  }

  String toJson() => json.encode(toMap());

  factory QuickbooksCategory.fromJson(String source) =>
      QuickbooksCategory.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuickbooksCategory(id: $id, fullyQualifiedName: $fullyQualifiedName, domain: $domain, name: $name, syncToken: $syncToken, sparse: $sparse, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuickbooksCategory &&
        other.id == id &&
        other.fullyQualifiedName == fullyQualifiedName &&
        other.domain == domain &&
        other.name == name &&
        other.syncToken == syncToken &&
        other.sparse == sparse &&
        other.active == active;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullyQualifiedName.hashCode ^
        domain.hashCode ^
        name.hashCode ^
        syncToken.hashCode ^
        sparse.hashCode ^
        active.hashCode;
  }
}
