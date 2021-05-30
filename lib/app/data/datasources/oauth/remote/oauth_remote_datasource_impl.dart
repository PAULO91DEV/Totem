import 'package:dio/dio.dart';
import 'package:totem/app/commons/constants.dart';
import 'package:totem/app/data/datasources/oauth/oauth_datasource.dart';

class OAuthRemoteDataSourceImpl implements OAuthDataSource {
  final Dio _dio;
  OAuthRemoteDataSourceImpl(this._dio);

  @override
  Future<String> authentication(String username, String password) {
    return this
        ._dio
        .post(
          "$kUrlOAuth2/connect/token",
          data: {
            "grant_type": kGrantType,
            "client_id": username,
            "client_secret": password
          },
          options: Options(contentType: Headers.formUrlEncodedContentType),
        )
        .then((result) {
      String accessToken = "";
      if (result.statusCode == 200) {
        accessToken = result.data[kFieldApiAccessToken];
      }
      return accessToken;
    });
  }
}
