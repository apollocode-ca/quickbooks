import 'dart:io';

import 'package:quickbooks/entities/oauth2/oauth2_tokens.entity.dart';
import 'package:quickbooks/environment/quickbooks_environment.dart';
import 'package:quickbooks/services/oauth2_connection.service.dart';
import 'package:quickbooks/services/quickbooks_customers.service.dart';

void main() async {
  var tokens = await oauthConnectExample();
  var accessToken = tokens.accessToken;
  // var accessToken =
  // "eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..QpML3yrLqhp3R_e6MRq9MQ.8hmsYPAwLyNHVW6evLOCk33D2_SHl3Q7D7FxNPl2fh4_9-0Fp14HIoDBk-qivzS1HvYMnrKPFnHP6obc7POA97pmwHiqTaNMNXqtnM9A4QZ8b7dAQpbhi4gsQcWEomenCTT8aDMxGdfOfbHf7Rr-wq-KByy-88h2TtDNp9BLZK7FdUfHSfIe3erVf_760bBNMGs12_dFYer_5qlwhO_OUB0OP--h8Tfa-00eyUN44pDm71-HO4tS0Wmi4yAoDRSvIfGWY899SltxYTys0h1oFdW8qxXWrEEfXMyUQiy0bPJV8VECQHD_NWm75CvHshMoRN82glhYRBeSj_4uAKZqoMO5rPPjI6mubdwEvvgzmQs2imOSafgoKRvesptvJ3gEv5HOkWRU8CUicQixsgI9wpSqWP6Zy-Rozr1GHB1C7dYKFJPXG07Pw0bliED_KzOU9CIc8pLytFGbryq9QFCOi8mzI_vNeoIfYyqkrRmG9sS8jU5cv3C5K4tUxo4kVrXSByUuCEJrLBb8y8pZj7GncfRfZj10MLPac-riXLrZbTz_S_I9THgiLEXcSGeXZVt_mJxjMp7CYK-aCIVOOJkSSA9QwH-eyN2nMVszaGoZJvgvd3sJqGzM420fXIp7PcFkBkUffQek2Zl5CKkKalrliqyUekUZkc4D-MeSBWQIgkfTI5k1pDdLrcdLu3Zf0OfLSe5XvdA901lGxOnA8J16yoXiVmheuuD0g7l4wGV7af7QuPdM0mIRtMkA1sM4opcJhOr_572MYRzrQ_RFHkAz5RrrGUg5cfQDKuPD12h4GLbCE7zM-hhNjjgfKSw03lwG3WQhlRufzFW4Ojy6ZC6QeRvv7R0t5NCMQXMZvBTR1QG6E4tk21no1-A-NUQkggnfp0u1uXobxF1hgEy1WJ0ZIg.f4ulAO7ts5kz2K4-qQjzSg";
  var service = QuickbooksCustomerService();
  String? companyId;
  // companyId = "4620816365302023290";

  var value = await service.getAll(
    accessToken: accessToken,
    companyId: companyId ?? tokens.companyId!,
  );
  print(value);
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

  QuickbooksOauth2Tokens value =
      await service.getTokens(authorizationCode: code ?? "", realmId: realmId);
  print(value);
  return value;
}
