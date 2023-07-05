// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// Entity to get oauth2 tokens from Quickbooks
class QuickbooksOauth2Tokens {
  int xRefreshTokenExpiresIn;
  int expiresIn;
  DateTime refreshTokenExpireDate;
  DateTime accessTokenExpireDate;
  String refreshToken;
  String accessToken;
  String tokenType;
  String? companyId;

  /// Indicates if the [refreshToken] is expired
  bool get isRefreshTokenExpired {
    return DateTime.now().millisecondsSinceEpoch >=
        refreshTokenExpireDate.millisecondsSinceEpoch;
  }

  /// Indicates if the [accessToken] is expired
  bool get iAccessTokenExpired {
    return DateTime.now().millisecondsSinceEpoch >=
        accessTokenExpireDate.millisecondsSinceEpoch;
  }

  QuickbooksOauth2Tokens({
    required this.xRefreshTokenExpiresIn,
    required this.expiresIn,
    required this.refreshTokenExpireDate,
    required this.accessTokenExpireDate,
    required this.refreshToken,
    required this.accessToken,
    required this.tokenType,
    this.companyId,
  });

  QuickbooksOauth2Tokens copyWith({
    int? xRefreshTokenExpiresIn,
    int? expiresIn,
    DateTime? refreshTokenExpireDate,
    DateTime? accessTokenExpireDate,
    String? refreshToken,
    String? accessToken,
    String? tokenType,
    String? companyId,
  }) {
    return QuickbooksOauth2Tokens(
      xRefreshTokenExpiresIn:
          xRefreshTokenExpiresIn ?? this.xRefreshTokenExpiresIn,
      expiresIn: expiresIn ?? this.expiresIn,
      refreshTokenExpireDate:
          refreshTokenExpireDate ?? this.refreshTokenExpireDate,
      accessTokenExpireDate:
          accessTokenExpireDate ?? this.accessTokenExpireDate,
      refreshToken: refreshToken ?? this.refreshToken,
      accessToken: accessToken ?? this.accessToken,
      tokenType: tokenType ?? this.tokenType,
      companyId: companyId ?? this.companyId,
    );
  }

  /// If [quickbooksFormat] is false, will send the [accessTokenExpireDate] and
  /// the [refreshTokenExpireDate], which are not originally given by quickbooks.
  Map<String, dynamic> toMap({bool quickbooksFormat = false}) {
    return <String, dynamic>{
      'x_refresh_token_expires_in': xRefreshTokenExpiresIn,
      'expires_in': expiresIn,
      if (!quickbooksFormat)
        'access_token_expire_date':
            accessTokenExpireDate.millisecondsSinceEpoch,
      if (!quickbooksFormat)
        'refresh_token_expire_date':
            refreshTokenExpireDate.microsecondsSinceEpoch,
      'refresh_token': refreshToken,
      'access_token': accessToken,
      'token_type': tokenType,
      'company_id': companyId,
    };
  }

  /// [accessTokenExpireDate] and [refreshTokenExpireDate] are generated
  /// with DateTime.now() and the [expiresIn]/[xRefreshTokenExpiresIn] values.
  factory QuickbooksOauth2Tokens.fromMap(Map<String, dynamic> map) {
    return QuickbooksOauth2Tokens(
      xRefreshTokenExpiresIn:
          int.parse(map['x_refresh_token_expires_in'].toString()),
      expiresIn: int.parse(map['expires_in'].toString()),
      refreshTokenExpireDate: map['refresh_token_expire_date'] != null
          ? DateTime.fromMicrosecondsSinceEpoch(
              int.parse(map['refresh_token_expire_date'].toString()))
          : DateTime.now().add(Duration(
              seconds:
                  int.parse(map['x_refresh_token_expires_in'].toString()))),
      accessTokenExpireDate: map['access_token_expire_date'] != null
          ? DateTime.fromMicrosecondsSinceEpoch(
              int.parse(map['access_token_expire_date'].toString()))
          : DateTime.now()
              .add(Duration(seconds: int.parse(map['expires_in'].toString()))),
      refreshToken: map['refresh_token'].toString(),
      accessToken: map['access_token'].toString(),
      tokenType: map['token_type'].toString(),
      companyId: map['company_id'],
    );
  }

  Map<String, dynamic> toJson() => toMap();

  /// Creates a [LevelState] from a json data [source]
  factory QuickbooksOauth2Tokens.fromJson(String source) =>
      QuickbooksOauth2Tokens.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuickbooksOauth2Tokens(xRefreshTokenExpiresIn: $xRefreshTokenExpiresIn, expiresIn: $expiresIn, refreshToken: $refreshToken, accessToken: $accessToken, tokenType: $tokenType, companyId: $companyId)';
  }

  @override
  bool operator ==(covariant QuickbooksOauth2Tokens other) {
    if (identical(this, other)) return true;

    return other.xRefreshTokenExpiresIn == xRefreshTokenExpiresIn &&
        other.expiresIn == expiresIn &&
        other.refreshToken == refreshToken &&
        other.accessToken == accessToken &&
        other.tokenType == tokenType &&
        other.companyId == companyId;
  }

  @override
  int get hashCode {
    return xRefreshTokenExpiresIn.hashCode ^
        expiresIn.hashCode ^
        refreshToken.hashCode ^
        accessToken.hashCode ^
        tokenType.hashCode ^
        companyId.hashCode;
  }
}
