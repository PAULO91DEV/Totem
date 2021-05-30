import 'package:totem/app/commons/enums.dart';
import 'package:totem/app/core/usecase.dart';
import 'package:totem/app/domain/driver/scanner/scanner_driver.dart';

class GetScannerStatusUseCase implements UseCase<DeviceStatus, NoParams> {
  final ScannerDriver _driver;
  GetScannerStatusUseCase(this._driver);

  @override
  Future<DeviceStatus> call(NoParams params) {
    return this._driver.getStatus();
  }
}
