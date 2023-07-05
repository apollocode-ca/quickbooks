/// Enum pour les différents types de lignes possible
enum QuickbooksGlobalTaxCalculationType {
  taxExcluded,
  taxInclusive,
  notApplicable
}

extension QuickbooksGlobalTaxCalculationTypeExtension
    on QuickbooksGlobalTaxCalculationType {
  String toJsonString() {
    switch (this) {
      case QuickbooksGlobalTaxCalculationType.taxExcluded:
        return 'TaxExcluded';
      case QuickbooksGlobalTaxCalculationType.taxInclusive:
        return 'TaxInclusive';
      case QuickbooksGlobalTaxCalculationType.notApplicable:
        return 'NotApplicable';
      default:
        throw Exception('Unknown detail type');
    }
  }

  /// Extension of [QuickbooksGlobalTaxCalculationType] for json string conversion
  static QuickbooksGlobalTaxCalculationType fromJsonString(String json) {
    for (var value in QuickbooksGlobalTaxCalculationType.values) {
      if (value.toJsonString() == json) {
        return value;
      }
    }
    throw Exception('Unknown detail type');
  }
}
