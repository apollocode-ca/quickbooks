import 'package:quickbooks/entities/quickbooks_category.entity.dart';
import 'package:quickbooks/entities/quickbooks_attachable.entity.dart';
import 'package:quickbooks/services/base/quickbooks_query.service.dart';

/// Service for the [QuickbooksCategory]
class QuickbooksCategoriesService extends QuickbooksQueryService {
  /// [QuickbooksCategoriesService] constructor.
  ///
  /// [postEndpoint] Endpoint used to make requests that are not sql queries
  ///
  /// [baseQuery] The base query to get all the wanted items
  ///
  /// [baseConditions] The base conditions to get the wanted items. DO NOT INCLUDE 'WHERE'
  ///
  /// [isProduction] Specifies if the service is in production or in sandbox. This will
  /// define the base endpoint url used by the service. If not given, takes the environement
  /// value QUICKBOOKS_IS_PRODUCTION or is true by default.
  QuickbooksCategoriesService(
      {super.isProduction,
      super.postEndpoint = 'item',
      super.baseQuery = "SELECT * FROM Item",
      super.baseConditions = "Type = 'Category'"});

  /// Gets all [QuickbooksCategory] in the Quickbooks API for the given [accessToken] and [companyId]
  Future<List<QuickbooksCategory>> getAll({
    required String accessToken,
    required String companyId,
    String? conditions,
  }) async {
    List<Map<String, dynamic>> items = await getMany(
      accessToken: accessToken,
      companyId: companyId,
      conditions: conditions,
    );

    List<QuickbooksCategory> results = [];

    for (var item in items) {
      results.add(QuickbooksCategory.fromMap(item));
    }
    return results;
  }

  /// Gets a [QuickbooksCategory] from the Quickbooks API with the given
  /// [accessToken], [companyId] and [id].
  /// Returns null if no data found.
  Future<QuickbooksCategory?> get({
    required String accessToken,
    required String companyId,
    required String id,
  }) async {
    Map<String, dynamic>? item = await getOne(
      accessToken: accessToken,
      companyId: companyId,
      id: id,
    );
    if (item == null) {
      return null;
    }
    try {
      var result = QuickbooksCategory.fromMap(item);
      return result;
    } catch (_) {
      return null;
    }
  }

  /// Gets all [QuickbooksAttachableEntity] for the requested [id]
  /// in the Quickbooks API for the given [accessToken]
  Future<List<QuickbooksAttachableEntity>> getAttachables({
    required String id,
    required String accessToken,
    required String companyId,
  }) async {
    var query = buildQuery(
        query: "select * from attachable",
        firstConditions: "AttachableRef.EntityRef.Type = 'Item'",
        conditions: "AttachableRef.EntityRef.value = '$id'");

    List<Map<String, dynamic>> items = await getQuery(
      query: query,
      accessToken: accessToken,
      companyId: companyId,
      location: 'Attachable',
    );

    List<QuickbooksAttachableEntity> results = [];

    for (var item in items) {
      results.add(QuickbooksAttachableEntity.fromMap(item));
    }
    return results;
  }

  /// Creates a [QuickbooksCategory] with
  /// the given [accessToken] and [companyId]
  Future<QuickbooksCategory> createOne({
    required String accessToken,
    required String companyId,
    required QuickbooksCategory data,
  }) async {
    var result = await post(
        accessToken: accessToken,
        companyId: companyId,
        data: data.toMap(withId: false));
    var newData = QuickbooksCategory.fromMap(result);
    return newData;
  }

  /// Updates a [QuickbooksCategory] with
  /// the given [accessToken] and [companyId]
  Future<QuickbooksCategory> updateOne({
    required String accessToken,
    required String companyId,
    required QuickbooksCategory data,
  }) async {
    var result = await post(
        accessToken: accessToken, companyId: companyId, data: data.toMap());
    var newData = QuickbooksCategory.fromMap(result);
    return newData;
  }
}
