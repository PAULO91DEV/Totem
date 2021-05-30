import 'package:totem/app/commons/enums.dart';
import 'package:totem/app/data/datasources/devices/internet/internet_datasource.dart';
import 'package:totem/app/domain/driver/internet/internet_driver.dart';

class InternetDriverImpl implements InternetDriver {
  final InternetDataSource _dataSource;
  InternetDriverImpl(this._dataSource);

  @override
  Future<DeviceStatus> getStatus() {
    return this._dataSource.getStatus();
  }
}
