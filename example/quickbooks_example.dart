import 'dart:io';

import 'package:quickbooks/entities/entity.export.dart';
import 'package:quickbooks/environment/environment.export.dart';
import 'package:quickbooks/services/quickbooks_tax_rates.service.dart';
import 'package:quickbooks/services/services.export.dart';

/// Note that to run this example, you must have your environment variables set
void main() async {
  var tokens = await oauthConnectExample();
  await getCompanyExample(tokens);
  await getCustomersExample(tokens);
  await getCategoriesExample(tokens);
  await getProductsExample(tokens);
  await getInvoicesExample(tokens);
  await getPaymentsExample(tokens);
  await getAccountsExample(tokens);
  await getPurchasesExample(tokens);
  await getVendorsExample(tokens);
  await getTaxRatesExample(tokens);
}

/// Example of how to use the oauth connection with Quickbooks.
///
/// If you don't provide the needed values, it will take it from environment variables.
Future<QuickbooksOauth2Tokens> oauthConnectExample(
    {String? clientId,
    String? clientSecret,
    String? redirectUri,
    bool? isProduction}) async {
  //Init of the Oauth2 service
  var service = QuickbooksOauth2Service(
    clientId: clientId ?? QuickbooksEnvironment.clientId,
    clientSecret: clientSecret ?? QuickbooksEnvironment.clientSecret,
    redirectUrl: redirectUri ?? QuickbooksEnvironment.redirectUri,
    isProduction: isProduction ?? QuickbooksEnvironment.isProduction,
  );

  String authUrl = await service.getAuthUrl();

  // Prints the connection instructions in the console and
  // gets the informations from the console entry
  print('Please connect on the link below:\n');
  print(authUrl);
  print(
      "\nAfter connecting, enter the code in the console. It is in que query parameters.");
  print("The code:");
  String? code = stdin.readLineSync();
  print('You entered: $code');
  print("Now, enter the realmId. It is also in the query parameters.");
  print("The realmId:");
  String? realmId = stdin.readLineSync();
  print('You entered: $realmId');
  print("Retrieving data");

  // Gets the tokens from Quickbooks
  QuickbooksOauth2Tokens value =
      await service.getTokens(authorizationCode: code ?? "", realmId: realmId);
  print('Oauth2 tokens');
  print(value);
  print('');
  return value;
}

/// Gets and prints all the customers
Future getCustomersExample(QuickbooksOauth2Tokens tokens) async {
  var accessToken = tokens.accessToken;
  var service = QuickbooksCustomerService();

  var value = await service.getAll(
    accessToken: accessToken,
    companyId: tokens.companyId!,
  );
  print('Customers');
  print(value);
  print('');
}

/// Gets and prints all the categories
Future getCategoriesExample(QuickbooksOauth2Tokens tokens) async {
  var accessToken = tokens.accessToken;
  var service = QuickbooksCategoriesService();

  var value = await service.getAll(
    accessToken: accessToken,
    companyId: tokens.companyId!,
  );
  print('Categories');
  print(value);
  print('');
}

/// Gets and prints your company
Future getCompanyExample(QuickbooksOauth2Tokens tokens) async {
  var accessToken = tokens.accessToken;
  var service = QuickbooksCompanyService();

  var value =
      await service.get(accessToken: accessToken, companyId: tokens.companyId!);
  print('Company');
  print(value);
  print('');
}

/// Gets and prints all the invoices
Future getInvoicesExample(QuickbooksOauth2Tokens tokens) async {
  var accessToken = tokens.accessToken;
  var service = QuickbooksInvoiceService();

  var value = await service.getAll(
    accessToken: accessToken,
    companyId: tokens.companyId!,
  );
  print('Invoices');
  print(value);
  print('');
}

/// Gets and prints all the payments
Future getPaymentsExample(QuickbooksOauth2Tokens tokens) async {
  var accessToken = tokens.accessToken;
  var service = QuickbooksPaymentService();

  var value = await service.getAll(
    accessToken: accessToken,
    companyId: tokens.companyId!,
  );
  print('Payments');
  print(value);
  print('');
}

/// Gets and prints all the products
Future getProductsExample(QuickbooksOauth2Tokens tokens) async {
  var accessToken = tokens.accessToken;
  var service = QuickbooksProductsService();

  var value = await service.getAll(
    accessToken: accessToken,
    companyId: tokens.companyId!,
  );
  print('Products');
  print(value);
  print('');
}

/// Gets and prints all the accounts
Future getAccountsExample(QuickbooksOauth2Tokens tokens) async {
  var accessToken = tokens.accessToken;
  var service = QuickbooksAccountsService();

  var value = await service.getAll(
    accessToken: accessToken,
    companyId: tokens.companyId!,
  );
  print('Accounts');
  print(value);
  print('');
}

/// Gets and prints all the purchases
Future getPurchasesExample(QuickbooksOauth2Tokens tokens) async {
  var accessToken = tokens.accessToken;
  var service = QuickbooksPurchasesService();

  var value = await service.getAll(
    accessToken: accessToken,
    companyId: tokens.companyId!,
  );
  print('Purchases');
  print(value);
  print('');
}

/// Gets and prints all the vendors
Future getVendorsExample(QuickbooksOauth2Tokens tokens) async {
  var accessToken = tokens.accessToken;
  var service = QuickbooksVendorsService();

  var value = await service.getAll(
    accessToken: accessToken,
    companyId: tokens.companyId!,
  );
  print('Vendors');
  print(value);
  print('');
}

/// Gets and prints all the tax rates
Future getTaxRatesExample(QuickbooksOauth2Tokens tokens) async {
  var accessToken = tokens.accessToken;
  var service = QuickbooksTaxRatesService();

  var value = await service.getAll(
    accessToken: accessToken,
    companyId: tokens.companyId!,
  );
  print('Tax Rates');
  print(value);
  print('');
}
