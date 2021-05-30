import 'package:totem/app/data/datasources/register/register_datasource.dart';
import 'package:totem/app/domain/entities/device_location.dart';
import 'package:totem/app/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSource _dataSource;
  RegisterRepositoryImpl(this._dataSource);

  @override
  Future<DeviceLocation> getDeviceLocationByCode(String token, String code) {
    return this._dataSource.getDeviceLocationByCode(token, code);
  }

  @override
  Future<void> registerDevice(String token, String macAddress, String code) {
    return this._dataSource.registerDevice(token, macAddress, code);
  }
}
