import 'package:alfred/alfred.dart';
import 'package:quickbooks/entities/quickbooks_attachable.entity.dart';
import 'package:quickbooks/entities/quickbooks_customer.dart';
import 'package:quickbooks/services/base/quickbooks_query.service.dart';

/// Service for the [QuickbooksCustomer]
class QuickbooksCustomerService extends QuickbooksQueryService {
  /// [QuickbooksCustomerService] constructor.
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
  QuickbooksCustomerService(
      {super.isProduction,
      super.postEndpoint = 'customer',
      super.baseQuery = "SELECT * FROM Customer",
      super.baseConditions});

  /// Gets all [QuickbooksCustomer] in the Quickbooks API for the given [accessToken] and [companyId]
  Future<List<QuickbooksCustomer>> getAll({
    required String accessToken,
    required String companyId,
    String? conditions,
  }) async {
    List<Map<String, dynamic>> items = await getMany(
      accessToken: accessToken,
      companyId: companyId,
      conditions: conditions,
      location: 'Customer',
    );

    List<QuickbooksCustomer> results = [];

    for (var item in items) {
      try {
        results.add(QuickbooksCustomer.fromMap(item));
      } catch (e) {
        print(e);
      }
    }
    return results;
  }

  /// Gets a [QuickbooksCustomer] from the Quickbooks API with the given
  /// [accessToken], [companyId] and [id].
  /// Returns null if no data found.
  Future<QuickbooksCustomer?> get({
    required String accessToken,
    required String companyId,
    required String id,
  }) async {
    Map<String, dynamic>? item = await getOne(
      accessToken: accessToken,
      companyId: companyId,
      id: id,
      location: 'Customer',
    );
    if (item == null) {
      return null;
    }
    try {
      var result = QuickbooksCustomer.fromMap(item);
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

  /// Creates a [QuickbooksCustomer] with
  /// the given [accessToken] and [companyId]
  Future<QuickbooksCustomer> createOne({
    required String accessToken,
    required String companyId,
    required QuickbooksCustomer data,
  }) async {
    var result = await post(
      accessToken: accessToken,
      companyId: companyId,
      data: data.toMap(withId: false),
      location: 'Customer',
    );
    var newData = QuickbooksCustomer.fromMap(result);
    return newData;
  }

  /// Updates a [QuickbooksCustomer] with
  /// the given [accessToken] and [companyId]
  Future<QuickbooksCustomer> updateOne({
    required String accessToken,
    required String companyId,
    required QuickbooksCustomer data,
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
      location: 'Customer',
    );
    var newData = QuickbooksCustomer.fromMap(result);
    return newData;
  }

  /// Deletes a [QuickbooksCustomer] with
  /// the given [accessToken] and [companyId]
  ///
  /// Sets the [active] field to false
  Future<QuickbooksCustomer> deleteOne({
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
      location: 'Customer',
    );

    var newData = QuickbooksCustomer.fromMap(result);

    return newData;
  }
}
