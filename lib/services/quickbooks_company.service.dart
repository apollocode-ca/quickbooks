import 'package:quickbooks/entities/quickbooks_attachable.entity.dart';
import 'package:quickbooks/entities/quickbooks_company_infos.entity.dart';
import 'package:quickbooks/services/base/quickbooks_query.service.dart';

/// Service for the [QuickbooksCompanyInfo]
class QuickbooksCompanyService extends QuickbooksQueryService {
  /// [QuickbooksCompanyService] constructor.
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
  QuickbooksCompanyService({
    super.isProduction,
    super.postEndpoint = 'company',
    super.baseQuery = "SELECT * FROM CompanyInfo",
  });

  /// Gets a [QuickbooksCompanyInfo] from the Quickbooks API with the given
  /// [accessToken], [companyId].
  /// Returns null if no data found.
  Future<QuickbooksCompanyInfo?> get({
    required String accessToken,
    required String companyId,
  }) async {
    Map<String, dynamic>? item = await getOne(
        accessToken: accessToken,
        companyId: companyId,
        id: companyId,
        location: 'CompanyInfo');
    if (item == null) {
      return null;
    }
    try {
      var result = QuickbooksCompanyInfo.fromMap(item);
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
}
