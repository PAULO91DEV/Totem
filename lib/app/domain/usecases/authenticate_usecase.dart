import 'package:shared_preferences/shared_preferences.dart';
import 'package:totem/app/commons/constants.dart';
import 'package:totem/app/core/usecase.dart';
import 'package:totem/app/domain/repositories/oauth_repository.dart';

class AuthenticateUseCase implements UseCase<void, NoParams> {
  final OAuthRepository _repository;
  AuthenticateUseCase(this._repository);

  @override
  Future<String> call(NoParams params) {
    return this._repository.authentication(kClientId, kClientSecret);
  }
}
