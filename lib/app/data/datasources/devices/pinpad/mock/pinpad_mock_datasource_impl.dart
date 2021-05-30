import 'package:totem/app/commons/enums.dart';
import 'package:totem/app/data/datasources/devices/pinpad/pinpad_datasource.dart';

class PinPadMockDataSourceImpl implements PinPadDataSource {
  @override
  Future<DeviceStatus> getStatus() {
    return Future.delayed(Duration(seconds: 3)).then((_) {
      return DeviceStatus.OK;
    });
  }
}
