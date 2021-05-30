import 'package:totem/app/commons/enums.dart';
import 'package:totem/app/data/datasources/devices/internet/internet_datasource.dart';

class IntertnetMockDataSourceImpl implements InternetDataSource {
  @override
  Future<DeviceStatus> getStatus() {
    return Future.delayed(Duration(seconds: 3)).then((_) {
      return DeviceStatus.Error;
    });
  }
}
