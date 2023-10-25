import 'package:alfred/alfred.dart';
import 'package:quickbooks/entities/payment/quickbooks_payment.entity.dart';
import 'package:quickbooks/entities/quickbooks_attachable.entity.dart';
import 'package:quickbooks/services/base/quickbooks_query.service.dart';

/// Service for the [QuickbooksPayment]
class QuickbooksPaymentService extends QuickbooksQueryService {
  /// [QuickbooksPaymentService] constructor.
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
  QuickbooksPaymentService(
      {super.isProduction,
      super.postEndpoint = 'payment',
      super.baseQuery = "SELECT * FROM Payment",
      super.baseConditions});

  /// Gets all [QuickbooksPayment] in the Quickbooks API for the given [accessToken] and [companyId]
  Future<List<QuickbooksPayment>> getAll({
    required String accessToken,
    required String companyId,
    String? conditions,
  }) async {
    List<Map<String, dynamic>> items = await getMany(
      accessToken: accessToken,
      companyId: companyId,
      conditions: conditions,
      location: 'Payment',
    );

    List<QuickbooksPayment> results = [];

    for (var item in items) {
      try {
        results.add(QuickbooksPayment.fromMap(item));
      } catch (e) {
        print(e);
      }
    }
    return results;
  }

  /// Gets a [QuickbooksPayment] from the Quickbooks API with the given
  /// [accessToken], [companyId] and [id].
  /// Returns null if no data found.
  Future<QuickbooksPayment?> get({
    required String accessToken,
    required String companyId,
    required String id,
  }) async {
    Map<String, dynamic>? item = await getOne(
      accessToken: accessToken,
      companyId: companyId,
      id: id,
      location: 'Payment',
    );
    if (item == null) {
      return null;
    }
    try {
      var result = QuickbooksPayment.fromMap(item);
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

  /// Creates a [QuickbooksPayment] with
  /// the given [accessToken] and [companyId]
  Future<QuickbooksPayment> createOne({
    required String accessToken,
    required String companyId,
    required QuickbooksPayment data,
  }) async {
    var result = await post(
      accessToken: accessToken,
      companyId: companyId,
      data: data.toMap(withId: false),
      location: 'Payment',
    );
    var newData = QuickbooksPayment.fromMap(result);
    return newData;
  }

  /// Updates a [QuickbooksPayment] with
  /// the given [accessToken] and [companyId]
  Future<QuickbooksPayment> updateOne({
    required String accessToken,
    required String companyId,
    required QuickbooksPayment data,
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
      location: 'Payment',
    );
    var newData = QuickbooksPayment.fromMap(result);
    return newData;
  }

  /// Deletes a [QuickbooksPayment] with
  /// the given [accessToken] and [companyId]
  ///
  /// Sets the [active] field to false
  Future<QuickbooksPayment> deleteOne({
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
      location: 'Payment',
    );

    var newData = QuickbooksPayment.fromMap(result);

    return newData;
  }
}
