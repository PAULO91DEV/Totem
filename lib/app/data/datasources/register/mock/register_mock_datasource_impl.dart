import 'package:totem/app/data/datasources/register/register_datasource.dart';
import 'package:totem/app/domain/entities/device_location.dart';

class RegisterMockDataSourceImpl implements RegisterDataSource {
  @override
  Future<DeviceLocation> getDeviceLocationByCode(String token, String code) {
    return Future.delayed(Duration(seconds: 2)).then((_) {
      DeviceLocation location = deviceLocationFromJson(
          '{"company":"FINANCE","site":"MATRIZ","locationId":"BONNAIRE MALL","description":"BONNAIRE MALL","parameters":[{"key":"Departamento","value":"HALL"},{"key":"Latitude","value":"-23.6219"},{"key":"Longitude","value":"-46.7415"},{"key":"Endereço","value":"Rua Dr Luiz Migliano"},{"key":"Número","value":"1986"},{"key":"Complemento","value":"cj 1416"},{"key":"Bairro","value":"Jardim Vazani"},{"key":"CEP","value":"05711-001"},{"key":"Cidade","value":"São Paulo"},{"key":"Estado","value":"SP"},{"key":"País","value":"Brasil"}]}');
      return location;
    });
  }

  @override
  Future<void> registerDevice(String token, String macAddress, String code) {
    return Future.delayed(Duration(seconds: 2)).then((_) {
      return;
    });
  }
}
