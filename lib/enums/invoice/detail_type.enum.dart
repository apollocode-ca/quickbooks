/// Enum for the different possible line types
enum QuickbooksLineDetailType {
  salesItemLineDetail,
  groupLineDetail,
  subTotalLineDetail,
  discountLineDetail,
  descriptionOnlyLineDetail,
  paymentLineDetail,
  taxLineDetail,
  accountBasedExpenseLineDetail,
  itemBasedExpenseLineDetail,
  depositLineDetail,
  purchaseOrderItemLineDetail,
  salesOrderItemLineDetail,
  itemReceiptLineDetail,
  journalEntryLineDetail,
  serviceBasedExpenseLineDetail,
  fixedAssetPurchaseLineDetail,
  tDSLineDetail,
  cSTaxLineDetail,
}

/// Extension of [QuickbooksLineDetailType] for json string conversion
extension QuickbooksLineDetailTypeExtension on QuickbooksLineDetailType {
  /// Transforms the enum value in json string to be send to Quickbooks API
  String toJsonString() {
    switch (this) {
      case QuickbooksLineDetailType.salesItemLineDetail:
        return 'SalesItemLineDetail';
      case QuickbooksLineDetailType.groupLineDetail:
        return 'GroupLineDetail';
      case QuickbooksLineDetailType.subTotalLineDetail:
        return 'SubTotalLineDetail';
      case QuickbooksLineDetailType.discountLineDetail:
        return 'DiscountLineDetail';
      case QuickbooksLineDetailType.descriptionOnlyLineDetail:
        return 'DescriptionOnlyLineDetail';
      case QuickbooksLineDetailType.paymentLineDetail:
        return 'PaymentLineDetail';
      case QuickbooksLineDetailType.taxLineDetail:
        return 'TaxLineDetail';
      case QuickbooksLineDetailType.accountBasedExpenseLineDetail:
        return 'AccountBasedExpenseLineDetail';
      case QuickbooksLineDetailType.itemBasedExpenseLineDetail:
        return 'ItemBasedExpenseLineDetail';
      case QuickbooksLineDetailType.depositLineDetail:
        return 'DepositLineDetail';
      case QuickbooksLineDetailType.purchaseOrderItemLineDetail:
        return 'PurchaseOrderItemLineDetail';
      case QuickbooksLineDetailType.salesOrderItemLineDetail:
        return 'SalesOrderItemLineDetail';
      case QuickbooksLineDetailType.itemReceiptLineDetail:
        return 'ItemReceiptLineDetail';
      case QuickbooksLineDetailType.journalEntryLineDetail:
        return 'JournalEntryLineDetail';
      case QuickbooksLineDetailType.serviceBasedExpenseLineDetail:
        return 'ServiceBasedExpenseLineDetail';
      case QuickbooksLineDetailType.fixedAssetPurchaseLineDetail:
        return 'FixedAssetPurchaseLineDetail';
      case QuickbooksLineDetailType.tDSLineDetail:
        return 'TDSLineDetail';
      case QuickbooksLineDetailType.cSTaxLineDetail:
        return 'CSTaxLineDetail';
      default:
        throw Exception('Unknown detail type $this');
    }
  }

  /// Transforms a json string in an enum value
  static QuickbooksLineDetailType fromJsonString(String json) {
    for (var value in QuickbooksLineDetailType.values) {
      if (value.toJsonString() == json) {
        return value;
      }
    }
    throw Exception('Unknown detail type');
  }
}
