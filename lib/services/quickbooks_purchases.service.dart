import 'dart:convert';

import 'package:alfred/alfred.dart';
import 'package:quickbooks/entities/quickbooks_attachable.entity.dart';
import 'package:quickbooks/entities/quickbooks_purchase.entity.dart';
import 'package:quickbooks/services/base/quickbooks_query.service.dart';
import 'package:http/http.dart' as http;

/// Service for the [QuickbooksPurchase]
class QuickbooksPurchasesService extends QuickbooksQueryService {
  /// [QuickbooksPurchasesService] constructor.
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
  QuickbooksPurchasesService(
      {super.isProduction,
      super.postEndpoint = 'purchase',
      super.baseQuery = "SELECT * FROM Purchase",
      super.baseConditions});

  /// Gets all [QuickbooksPurchase] in the Quickbooks API for the given [accessToken] and [companyId]
  Future<List<QuickbooksPurchase>> getAll({
    required String accessToken,
    required String companyId,
    String? conditions,
  }) async {
    List<Map<String, dynamic>> items = await getMany(
      accessToken: accessToken,
      companyId: companyId,
      conditions: conditions,
      location: 'Purchase',
    );

    List<QuickbooksPurchase> results = [];

    for (var item in items) {
      try {
        results.add(QuickbooksPurchase.fromMap(item));
      } catch (e) {
        print(e);
      }
    }
    return results;
  }

  /// Gets a [QuickbooksPurchase] from the Quickbooks API with the given
  /// [accessToken], [companyId] and [id].
  /// Returns null if no data found.
  Future<QuickbooksPurchase?> get({
    required String accessToken,
    required String companyId,
    required String id,
  }) async {
    Map<String, dynamic>? item = await getOne(
      accessToken: accessToken,
      companyId: companyId,
      id: id,
      location: 'Purchase',
    );
    if (item == null) {
      return null;
    }
    try {
      var result = QuickbooksPurchase.fromMap(item);
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

  /// Creates a [QuickbooksPurchase] with
  /// the given [accessToken] and [companyId]
  Future<QuickbooksPurchase> createOne({
    required String accessToken,
    required String companyId,
    required QuickbooksPurchase data,
  }) async {
    var result = await post(
      accessToken: accessToken,
      companyId: companyId,
      data: data.toMap(withId: false),
      location: 'Purchase',
    );
    var newData = QuickbooksPurchase.fromMap(result);
    return newData;
  }

  /// Updates a [QuickbooksPurchase] with
  /// the given [accessToken] and [companyId]
  Future<QuickbooksPurchase> updateOne({
    required String accessToken,
    required String companyId,
    required QuickbooksPurchase data,
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
      location: 'Purchase',
    );
    var newData = QuickbooksPurchase.fromMap(result);
    return newData;
  }

  /// Deletes a [QuickbooksInvoice] with
  /// the given [accessToken] and [companyId]
  Future<bool> deleteOne({
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

    return await http
        .post(
      Uri.https(
        baseEndpoint,
        '$companyEndpoint$companyId/$postEndpoint?operation=delete',
        {
          'minorversion': '65',
        },
      ),
      headers: {
        'Accept': 'application/json',
        'content-type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      },
      body: jsonEncode({
        "SyncToken": data.syncToken,
        "Id": data.id,
      }),
    )
        .then((response) async {
      switch (response.statusCode) {
        case 200:
          return true;
        default:
          throw AlfredException(500, 'Quickbooks error: ${response.body}');
      }
    });
  }
}
