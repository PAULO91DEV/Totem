import 'package:totem/app/commons/enums.dart';
import 'package:totem/app/core/usecase.dart';
import 'package:totem/app/domain/driver/printer/printer_driver.dart';

class GetPrinterStatusUseCase implements UseCase<DeviceStatus, NoParams> {
  final PrinterDriver _printerDriver;
  GetPrinterStatusUseCase(this._printerDriver);

  @override
  Future<DeviceStatus> call(NoParams params) {
    return this._printerDriver.discovery().then((deviceInfo) {
      return this._printerDriver.connect(deviceInfo);
    }).then((result) {
      return this._printerDriver.getStatus();
    }).then((result) async {
      await this._printerDriver.disconnect();
      if (result.contains("OFFLINE")) {
        return DeviceStatus.Error;
      }
      return DeviceStatus.OK;
    }).catchError((error) {
      return DeviceStatus.Error;
    });
  }
}
