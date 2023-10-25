enum QuickbooksProductType {
  inventory,
  nonInventory,
  service,
}

extension QuickbooksProductTypeExtension on QuickbooksProductType {
  static QuickbooksProductType fromJsonString(String jsonString) {
    switch (jsonString) {
      case 'Inventory':
        return QuickbooksProductType.inventory;
      case 'NonInventory':
        return QuickbooksProductType.nonInventory;
      case 'Service':
        return QuickbooksProductType.service;
      default:
        throw RangeError(
            'There\'s no product type corresponding to $jsonString.');
    }
  }

  String toJsonString() {
    switch (this) {
      case QuickbooksProductType.inventory:
        return 'Inventory';
      case QuickbooksProductType.nonInventory:
        return 'NonInventory';
      case QuickbooksProductType.service:
        return 'Service';
    }
  }
}
