# quickbooks

The quickbooks package gives you all the tools you need to get the date from QuickbooksPlatform in dart.

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
dependencies:
  quickbooks: <latest_version>
```

To import it in your `dart` file, add the following line:

```dart
import 'package:quickbooks/quickbooks.dart';
```

## Getting started

To use the different features of this project, you will need:

1. A Quickbooks developper account: https://developer.intuit.com/app/developer/qbdesktop/docs/get-started/create-an-intuit-developer-account
2. A quickbooks app: https://developer.intuit.com/app/developer/qbo/docs/get-started/start-developing-your-app

Your Quickbooks app will give you a client_id and a client_secret keys: https://developer.intuit.com/app/developer/qbo/docs/get-started/get-client-id-and-client-secret

You can set these values in the environment variables as QUICKBOOKS_CLIENT_ID and QUICKBOOKS_CLIENT_SECRET or set it directly on the Oauth2 authentification service.

## Environment

This package is set to use automatically the environment variables of your system if you didn't specify values to services that uses them.

The environment variables used by this package are:

- QUICKBOOKS_CLIENT_ID: The id of the app you use.
- QUICKBOOKS_CLIENT_SECRET: The secret key of the app you use.
- QUICKBOOKS_REDIRECT_URI: The uri Oauth2 will redirect after connection to send informations.
- QUICKBOOKS_STATE: The confirmation string used by Oauth2 to confirm a connection is valid.
- QUICKBOOKS_IS_PRODUCTION: Boolean that specifies if the app is in production or in sandbox mode. Will be automatically set to production if no value is given.

## Features

### Oauth2 connection

You can use this package to connect to a Quickbooks account via Oauth2 authentification standard.

To perform an authentification, you must:

1. Generate an authentification url for your quickbooks app. Example:

```dart
var service = QuickbooksOauth2Service(
    clientId: QuickbooksEnvironment.clientId,
    clientSecret: QuickbooksEnvironment.clientSecret,
    redirectUrl: QuickbooksEnvironment.redirectUri,
    isProduction: QuickbooksEnvironment.isProduction,
);

String authUrl = await service.getAuthUrl();
```

2. Get the authentification code and realm id by receiving it at the redirection url (set in the QUICKBOOKS_REDIRECT_URI environment variable or directly on the service). You must run you own api to do so.
3. Get the tokens from the authentification code and realm id. Example:

```dart
QuickbooksOauth2Tokens tokens =
      await service.getTokens(authorizationCode: code, realmId: realmId);
```

You now have the tokens you need to query the Quickbooks api.

### Data management

This package can manage these types of Quickbooks data:

- Products
- Categories
- Your own company
- Customers
- Invoices
- Payments

Each of these data types have their own service that can get, create, update and delete data.
Example:

```dart
var service = QuickbooksPaymentService();

var value = await service.getAll(
    accessToken: tokens.accessToken,
    companyId: tokens.companyId!,
    conditions: '<your conditions in MySql>',
);
```

If you need to get a data that is not covered by the prebuilt services, you can use the QuickbooksQueryService to build your own custom service easily.
Example:

```dart
var service = QuickbooksQueryService(
    postEndpoint: '<post endpoint of your date>',
    baseQuery: '<base query to get your data in MySql>',
    baseConditions: '<base conditions to get your data in Mysql>', // Is null by default
    isProduction: true //Will be set with the environment variable by default
);
```

By example, to set a QuickbooksQueryService to get Payments, you need this code:

```dart
var service = QuickbooksQueryService(
    postEndpoint: '<post endpoint of your date>',
    baseQuery: '<base query to get your data in MySql>',
    baseConditions: '<base conditions to get your data in Mysql>', // Is null by default
    isProduction: true //Will be set with the environment variable by default
);
```
