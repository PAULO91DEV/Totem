import 'package:totem/app/commons/enums.dart';
import 'package:totem/app/data/datasources/devices/scanner/scanner_datasource.dart';
import 'package:totem/app/domain/driver/scanner/scanner_driver.dart';

class ScannerDriverImpl implements ScannerDriver {
  final ScannerDataSource _dataSource;
  ScannerDriverImpl(this._dataSource);

  @override
  Future<DeviceStatus> getStatus() {
    return this._dataSource.getStatus();
  }
}
