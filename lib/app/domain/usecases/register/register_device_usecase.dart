import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:totem/app/commons/constants.dart';
import 'package:totem/app/core/usecase.dart';
import 'package:totem/app/domain/repositories/register_repository.dart';
import 'package:wifi_info_plugin/wifi_info_plugin.dart';

class RegisterDeviceUseCase
    implements UseCase<void, RegisterDeviceUseCaseParams> {
  final RegisterRepository _repository;
  RegisterDeviceUseCase(this._repository);

  @override
  Future<void> call(RegisterDeviceUseCaseParams params) {
    String token;
    return SharedPreferences.getInstance().then((prefs) {
      token = prefs.getString(kPrefsAccessToken);
      return WifiInfoPlugin.wifiDetails;
    }).then((wifiInfo) {
      String macAddress = formatMacAddress(wifiInfo.macAddress);
      return this._repository.registerDevice(token, macAddress, params.code);
    });
  }

  String formatMacAddress(String macAddress) {
    String formattedMacAddress = "";
    List<String> bytes = macAddress.split(":");
    for (var idx = 0; idx < bytes.length; idx++) {
      var byte = bytes[idx];
      if (idx > 0) {
        formattedMacAddress += ":";
      }
      if (byte.length == 1) {
        formattedMacAddress += "0";
      }
      formattedMacAddress += byte;
    }
    return formattedMacAddress;
  }
}

class RegisterDeviceUseCaseParams extends Equatable {
  final String code;
  RegisterDeviceUseCaseParams(this.code);

  @override
  List<Object> get props => [this.code];
}
