import 'package:totem/app/commons/enums.dart';
import 'package:totem/app/core/usecase.dart';
import 'package:totem/app/domain/driver/internet/internet_driver.dart';

class GetInternetStatusUseCase implements UseCase<DeviceStatus, NoParams> {
  final InternetDriver _driver;
  GetInternetStatusUseCase(this._driver);

  @override
  Future<DeviceStatus> call(NoParams params) {
    return this._driver.getStatus();
  }
}
