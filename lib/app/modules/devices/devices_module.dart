import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:totem/app/data/datasources/devices/internet/local/internet_remote_datasource_impl.dart';
import 'package:totem/app/data/datasources/devices/pinpad/mock/pinpad_mock_datasource_impl.dart';
import 'package:totem/app/data/datasources/devices/printer/mock/printer_mock_datasource_impl.dart';
import 'package:totem/app/data/datasources/devices/scanner/mock/scanner_mock_datasource_impl.dart';
import 'package:totem/app/data/datasources/oauth/remote/oauth_remote_datasource_impl.dart';
import 'package:totem/app/data/driver/internet/internet_driver_impl.dart';
import 'package:totem/app/data/driver/pinpad/pinpad_driver_impl.dart';
import 'package:totem/app/data/driver/printer/epson/printer_driver_impl.dart';
import 'package:totem/app/data/driver/scanner/scanner_driver_impl.dart';
import 'package:totem/app/data/repositories/oauth_repository_impl.dart';
import 'package:totem/app/domain/usecases/authenticate_usecase.dart';
import 'package:totem/app/domain/usecases/get_internet_status_usecase.dart';
import 'package:totem/app/domain/usecases/get_pinpad_status_usecase.dart';
import 'package:totem/app/domain/usecases/get_printer_status_usecase.dart';
import 'package:totem/app/domain/usecases/get_scanner_status_usecase.dart';
import 'package:totem/app/domain/usecases/register/register_device_usecase.dart';
import 'package:totem/app/modules/devices/devices_controller.dart';
import 'package:totem/app/modules/devices/devices_screen.dart';
import 'package:totem/app/modules/home/home_module.dart';
import 'package:totem/app/modules/home/home_page.dart';
import 'package:totem/app/modules/register/register_module.dart';
import 'package:totem/app/modules/register/register_screen.dart';

class DevicesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ScannerDriverImpl(ScannerMockDataSourceImpl())),
        Bind((i) => PinPadDriverImpl(PinPadMockDataSourceImpl())),
        Bind((i) => InternetDriverImpl(InternetRemoteDataSourceImpl())),
        Bind((i) => PrinterDriverImpl(PrinterMockDataSourceImpl())),
        Bind((i) => GetPrinterStatusUseCase(i.get<PrinterDriverImpl>())),
        Bind((i) => GetInternetStatusUseCase(i.get<InternetDriverImpl>())),
        Bind((i) => GetPinPadStatusUseCase(i.get<PinPadDriverImpl>())),
        Bind((i) => GetScannerStatusUseCase(i.get<ScannerDriverImpl>())),
        Bind(
          (i) => OAuthRepositoryImpl(OAuthRemoteDataSourceImpl(i.get<Dio>())),
        ),
        Bind((i) => AuthenticateUseCase(i.get<OAuthRepositoryImpl>())),
        Bind((i) => DevicesController(
              getPrinterStatusUseCase: i.get<GetPrinterStatusUseCase>(),
              getInternetStatusUseCase: i.get<GetInternetStatusUseCase>(),
              getPinPadStatusUseCase: i.get<GetPinPadStatusUseCase>(),
              getScannerStatusUseCase: i.get<GetScannerStatusUseCase>(),
              authenticateUseCase: i.get<AuthenticateUseCase>(),
            )),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => DevicesScreen(),
        ),
        //
        ModularRouter(RegisterScreen.routeName, module: RegisterModule()),
        //
        ModularRouter(HomePage.routeName, module: HomeModule()),
      ];

  static Inject get to => Inject<DevicesModule>.of();
}
