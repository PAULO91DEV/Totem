import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:totem/app/commons/enums.dart';
import 'package:totem/app/data/datasources/devices/internet/internet_datasource.dart';

class InternetRemoteDataSourceImpl implements InternetDataSource {
  @override
  Future<DeviceStatus> getStatus() {
    return DataConnectionChecker().hasConnection.then((result) {
      if (result == true) {
        return DeviceStatus.OK;
      }
      return DeviceStatus.Error;
    }).catchError((error) {
      return DeviceStatus.Error;
    });
  }
}
