import 'package:totem/app/data/datasources/oauth/oauth_datasource.dart';
import 'package:totem/app/domain/repositories/oauth_repository.dart';

class OAuthRepositoryImpl implements OAuthRepository {
  final OAuthDataSource _dataSource;
  OAuthRepositoryImpl(this._dataSource);

  @override
  Future<String> authentication(String username, String password) {
    return this._dataSource.authentication(username, password);
  }
}
