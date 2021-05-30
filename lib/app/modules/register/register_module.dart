import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:totem/app/data/datasources/register/mock/register_mock_datasource_impl.dart';
import 'package:totem/app/data/datasources/register/remote/register_remote_datasource_impl.dart';
import 'package:totem/app/data/repositories/register_repository_impl.dart';
import 'package:totem/app/domain/usecases/register/get_device_location_by_code_usecase.dart';
import 'package:totem/app/domain/usecases/register/register_device_usecase.dart';
import 'package:totem/app/modules/home/home_module.dart';
import 'package:totem/app/modules/home/home_page.dart';
import 'package:totem/app/modules/register/register_controller.dart';
import 'package:totem/app/modules/register/register_screen.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => RegisterRepositoryImpl(
              RegisterRemoteDataSourceImpl(i.get<Dio>())),
        ),
        //RegisterRepositoryImpl(RegisterMockDataSourceImpl())),
        Bind(
          (i) =>
              GetDeviceLocationByCodeUseCase(i.get<RegisterRepositoryImpl>()),
        ),
        Bind(
          (i) => RegisterDeviceUseCase(i.get<RegisterRepositoryImpl>()),
        ),
        Bind(
          (i) => RegisterController(
            i.get<GetDeviceLocationByCodeUseCase>(),
            i.get<RegisterDeviceUseCase>(),
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => RegisterScreen()),
      ];

  static Inject get to => Inject<RegisterModule>.of();
}
