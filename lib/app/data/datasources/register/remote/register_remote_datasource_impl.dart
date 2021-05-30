import 'package:dio/dio.dart';
import 'package:totem/app/commons/constants.dart';
import 'package:totem/app/commons/exceptions.dart';
import 'package:totem/app/data/datasources/register/register_datasource.dart';
import 'package:totem/app/domain/entities/device_location.dart';

class RegisterRemoteDataSourceImpl implements RegisterDataSource {
  final Dio _dio;
  RegisterRemoteDataSourceImpl(this._dio);

  @override
  Future<DeviceLocation> getDeviceLocationByCode(String token, String code) {
    return this
        ._dio
        .get(
          "$kUrlApiDevice/v2/Activate/$code",
          options: Options(headers: {"Authorization": "Bearer $token"}),
        )
        .then((result) {
      DeviceLocation deviceLocation;
      if (result.statusCode == 200) {
        deviceLocation = DeviceLocation.fromJson(result.data);
      }
      return deviceLocation;
    });
  }

  @override
  Future<void> registerDevice(String token, String macAddress, String code) {
    return this
        ._dio
        .post(
          "$kUrlApiDevice/v2/Activate",
          data: {'macAddress': macAddress, 'activateCode': code},
          options: Options(headers: {"Authorization": "Bearer $token"}),
        )
        .then((result) {
      if (result.statusCode == 201) {
        return;
      }
      throw NotFoundException();
    });
  }
}
