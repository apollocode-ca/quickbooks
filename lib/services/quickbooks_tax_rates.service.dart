import 'package:alfred/alfred.dart';
import 'package:quickbooks/entities/quickbooks_attachable.entity.dart';
import 'package:quickbooks/entities/quickbooks_tax_rate_entity.dart';
import 'package:quickbooks/services/base/quickbooks_query.service.dart';

/// Service for the [QuickbooksTaxRate]
class QuickbooksTaxRatesService extends QuickbooksQueryService {
  /// [QuickbooksTaxRatesService] constructor.
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
  QuickbooksTaxRatesService(
      {super.isProduction,
      super.postEndpoint = 'taxrate',
      super.baseQuery = "SELECT * FROM TaxRate",
      super.baseConditions});

  /// Gets all [QuickbooksTaxRate] in the Quickbooks API for the given [accessToken] and [companyId]
  Future<List<QuickbooksTaxRate>> getAll({
    required String accessToken,
    required String companyId,
    String? conditions,
  }) async {
    List<Map<String, dynamic>> items = await getMany(
      accessToken: accessToken,
      companyId: companyId,
      conditions: conditions,
      location: 'TaxRate',
    );

    List<QuickbooksTaxRate> results = [];

    for (var item in items) {
      try {
        results.add(QuickbooksTaxRate.fromMap(item));
      } catch (e) {
        print(e);
      }
    }
    return results;
  }

  /// Gets a [QuickbooksTaxRate] from the Quickbooks API with the given
  /// [accessToken], [companyId] and [id].
  /// Returns null if no data found.
  Future<QuickbooksTaxRate?> get({
    required String accessToken,
    required String companyId,
    required String id,
  }) async {
    Map<String, dynamic>? item = await getOne(
      accessToken: accessToken,
      companyId: companyId,
      id: id,
      location: 'TaxRate',
    );
    if (item == null) {
      return null;
    }
    try {
      var result = QuickbooksTaxRate.fromMap(item);
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

  /// Creates a [QuickbooksTaxRate] with
  /// the given [accessToken] and [companyId]
  Future<QuickbooksTaxRate> createOne({
    required String accessToken,
    required String companyId,
    required QuickbooksTaxRate data,
  }) async {
    var result = await post(
      accessToken: accessToken,
      companyId: companyId,
      data: data.toMap(withId: false),
      location: 'TaxRate',
    );

    var newData = QuickbooksTaxRate.fromMap(result);
    return newData;
  }

  /// Updates a [QuickbooksTaxRate] with
  /// the given [accessToken] and [companyId]
  Future<QuickbooksTaxRate> updateOne({
    required String accessToken,
    required String companyId,
    required QuickbooksTaxRate data,
  }) async {
    var oldData = await get(
      accessToken: accessToken,
      companyId: companyId,
      id: data.id!,
    );

    if (oldData == null) {
      throw AlfredException(404, 'Data not found');
    }

    data.syncToken = oldData.syncToken;

    var result = await post(
      accessToken: accessToken,
      companyId: companyId,
      data: data.toMap(),
      location: 'TaxRate',
    );
    var newData = QuickbooksTaxRate.fromMap(result);
    return newData;
  }

  /// Deletes a [QuickbooksTaxRate] with
  /// the given [accessToken] and [companyId]
  ///
  /// Sets the [active] field to false
  Future<QuickbooksTaxRate> deleteOne({
    required String accessToken,
    required String companyId,
    required String id,
  }) async {
    var data = await get(
      accessToken: accessToken,
      companyId: companyId,
      id: id,
    );

    if (data == null) {
      throw AlfredException(404, 'Data not found');
    }

    data.active = false;

    var result = await post(
      accessToken: accessToken,
      companyId: companyId,
      data: data.toMap(),
      location: 'TaxRate',
    );

    var newData = QuickbooksTaxRate.fromMap(result);

    return newData;
  }
}
