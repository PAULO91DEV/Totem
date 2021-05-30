import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:totem/app/commons/constants.dart';
import 'package:totem/app/core/usecase.dart';
import 'package:totem/app/domain/entities/device_location.dart';
import 'package:totem/app/domain/repositories/register_repository.dart';

class GetDeviceLocationByCodeUseCase
    implements UseCase<DeviceLocation, GetDeviceLocationByCodeUseCaseParam> {
  final RegisterRepository _repository;
  GetDeviceLocationByCodeUseCase(this._repository);

  @override
  Future<DeviceLocation> call(GetDeviceLocationByCodeUseCaseParam params) {
    return SharedPreferences.getInstance().then((prefs) {
      var token = prefs.getString(kPrefsAccessToken);
      return this._repository.getDeviceLocationByCode(token, params.code);
    });
  }
}

class GetDeviceLocationByCodeUseCaseParam extends Equatable {
  final String code;
  GetDeviceLocationByCodeUseCaseParam({@required this.code});

  @override
  List<Object> get props => [this.code];
}
