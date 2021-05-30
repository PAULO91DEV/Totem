import 'package:totem/app/commons/enums.dart';
import 'package:totem/app/data/datasources/devices/pinpad/pinpad_datasource.dart';
import 'package:totem/app/domain/driver/pinpad/pinpad_driver.dart';

class PinPadDriverImpl implements PinPadDriver {
  final PinPadDataSource _dataSource;
  PinPadDriverImpl(this._dataSource);

  @override
  Future<DeviceStatus> getStatus() {
    return this._dataSource.getStatus();
  }
}
