import 'package:totem/app/domain/entities/device_location.dart';

class RegisterDataSource {
  // ignore: missing_return
  Future<DeviceLocation> getDeviceLocationByCode(String token, String code) {}
  // ignore: missing_return
  Future<void> registerDevice(String token, String macAddress, String code) {}
}
