import 'dart:convert';

import 'package:alfred/alfred.dart';
import 'package:http/http.dart' as http;

import '../../environment/quickbooks_environment.dart';

/// Base class for services to call Quickbooks API
class QuickbooksQueryService {
  late final String _baseEndpoint;
  late final bool _isProduction;
  late final String _baseQuery;
  late final String? _baseConditions;
  late final String _postEndpoint;

  static const String _productionString = "quickbooks.api.intuit.com";
  static const String _sandboxString = "sandbox-quickbooks.api.intuit.com";

  final String _companyEndpoint = "/v3/company/";

  /// [QuickbooksQueryService] constructor.
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
  QuickbooksQueryService(
      {required String postEndpoint,
      required String baseQuery,
      String? baseConditions,
      bool? isProduction}) {
    _baseQuery = baseQuery;
    _baseConditions = baseConditions;
    _postEndpoint = postEndpoint;
    _isProduction = isProduction ?? QuickbooksEnvironment.isProduction;
    _baseEndpoint = _isProduction ? _productionString : _sandboxString;
  }

  /// Build an sql query with the given [query], [firstConditions] and [conditions].
  ///
  /// If you don't give it, [query] will be initialized with [baseQuery].
  ///
  /// If you don't five it, [firstConditions] will be initialized with [baseConditions].
  String buildQuery({
    String? query,
    String? firstConditions,
    String? conditions,
  }) {
    query ??= _baseQuery;
    firstConditions ?? _baseConditions;

    if (firstConditions == null && conditions == null) {
      return query;
    }

    String finalQuery = "$query WHERE ";

    if (firstConditions != null) {
      finalQuery += "($firstConditions)";
      if (conditions != null) {
        finalQuery += " and ";
      }
    }

    if (conditions != null) {
      finalQuery += "($conditions)";
    }

    return finalQuery;
  }

  /// Gets the requested [query] from Quickbooks Api with the given [accessToken] and [companyId].
  /// Parse it in a [List<Map<String, dynamic>>] with the [location] given with the searched
  /// data in it.
  Future<List<Map<String, dynamic>>> getQuery({
    required String query,
    required String accessToken,
    required String companyId,
    String location = 'Item',
  }) async {
    return await http.get(
        Uri.https(
          _baseEndpoint,
          '$_companyEndpoint$companyId/query',
          {
            'minorversion': '65',
            'query': query,
          },
        ),
        headers: {
          'Accept': 'application/json',
          'content-type': 'text/plain',
          'Authorization': 'Bearer $accessToken'
        }).then((response) async {
      switch (response.statusCode) {
        case 200:
          Map<String, dynamic> body = jsonDecode(response.body);
          List<Map<String, dynamic>> items = [];
          try {
            items = body["QueryResponse"][location];
          } catch (_) {
            return [];
          }
          return items;
        default:
          throw AlfredException(500, 'Quickbooks error');
      }
    });
  }

  /// Gets the requested data group from Quickbooks Api with the given [accessToken] and [companyId].
  /// Parse it in a [List<Map<String, dynamic>>] with the [location] given with the searched
  /// data in it.
  Future<List<Map<String, dynamic>>> getMany(
      {required String accessToken,
      required String companyId,
      String location = 'Item',
      String? conditions}) async {
    var query = buildQuery(conditions: conditions);
    return await http.get(
        Uri.https(
          _baseEndpoint,
          '$_companyEndpoint$companyId/query',
          {
            'minorversion': '65',
            'query': query,
          },
        ),
        headers: {
          'Accept': 'application/json',
          'content-type': 'text/plain',
          'Authorization': 'Bearer $accessToken'
        }).then((response) async {
      switch (response.statusCode) {
        case 200:
          Map<String, dynamic> body = jsonDecode(response.body);
          List<Map<String, dynamic>> items = [];
          try {
            for (var value in body["QueryResponse"][location] as List) {
              try {
                items.add(value as Map<String, dynamic>);
              } catch (_) {}
            }
          } catch (_) {
            return [];
          }
          return items;
        default:
          throw AlfredException(500, 'Quickbooks error');
      }
    });
  }

  /// Gets the requested data from Quickbooks Api with the given [accessToken], [companyId] ans [id].
  /// Parse it in a [List<Map<String, dynamic>>] with the [location] given with the searched
  /// data in it.
  Future<Map<String, dynamic>?> getOne({
    required String accessToken,
    required String companyId,
    required String id,
    String location = 'Item',
  }) async {
    return await http.get(
        Uri.https(
          _baseEndpoint,
          '$_companyEndpoint$companyId/$_postEndpoint/$id',
          {
            'minorversion': '65',
          },
        ),
        headers: {
          'Accept': 'application/json',
          'content-type': 'text/plain',
          'Authorization': 'Bearer $accessToken'
        }).then((response) async {
      switch (response.statusCode) {
        case 200:
          Map<String, dynamic> body = jsonDecode(response.body);
          Map<String, dynamic> result = body[location];
          return result;
        case 400:
          return null;
        default:
          throw AlfredException(500, 'Quickbooks error');
      }
    });
  }

  /// Post the given [data] to Quickbooks Api with the given [accessToken] and [companyId].
  /// Parse result in [Map<String, dynamic>] with the [location] given with the posted
  /// data in it.
  Future<Map<String, dynamic>> post({
    required String accessToken,
    required String companyId,
    required Map<String, dynamic> data,
    String location = 'Item',
  }) async {
    return await http
        .post(
      Uri.https(
        _baseEndpoint,
        '$_companyEndpoint$companyId/$_postEndpoint',
        {
          'minorversion': '65',
        },
      ),
      headers: {
        'Accept': 'application/json',
        'content-type': 'text/plain',
        'Authorization': 'Bearer $accessToken'
      },
      body: jsonEncode(data),
    )
        .then((response) async {
      switch (response.statusCode) {
        case 200:
          Map<String, dynamic> body = jsonDecode(response.body);
          Map<String, dynamic> result = body[location];
          return result;
        default:
          throw AlfredException(500, 'Quickbooks error');
      }
    });
  }
}
