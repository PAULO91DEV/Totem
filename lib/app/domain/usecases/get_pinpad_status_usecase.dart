import 'package:totem/app/commons/enums.dart';
import 'package:totem/app/core/usecase.dart';
import 'package:totem/app/domain/driver/pinpad/pinpad_driver.dart';

class GetPinPadStatusUseCase implements UseCase<DeviceStatus, NoParams> {
  final PinPadDriver _driver;
  GetPinPadStatusUseCase(this._driver);

  @override
  Future<DeviceStatus> call(NoParams params) {
    return this._driver.getStatus();
  }
}
