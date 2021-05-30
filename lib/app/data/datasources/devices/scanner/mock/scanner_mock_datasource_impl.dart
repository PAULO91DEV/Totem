import 'package:totem/app/commons/enums.dart';
import 'package:totem/app/data/datasources/devices/scanner/scanner_datasource.dart';
import 'package:totem/app/domain/driver/scanner/scanner_driver.dart';

class ScannerMockDataSourceImpl implements ScannerDataSource {
  @override
  Future<DeviceStatus> getStatus() {
    return Future.delayed(Duration(seconds: 3)).then((_) {
      return DeviceStatus.OK;
    });
  }
}
