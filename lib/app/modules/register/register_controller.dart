import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:totem/app/commons/constants.dart';
import 'package:totem/app/domain/entities/device_location.dart';
import 'package:totem/app/domain/usecases/register/get_device_location_by_code_usecase.dart';
import 'package:totem/app/domain/usecases/register/register_device_usecase.dart';
import 'package:totem/app/modules/home/home_page.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final GetDeviceLocationByCodeUseCase _getDeviceLocationByCodeUseCase;
  final RegisterDeviceUseCase _registerDeviceUseCase;
  _RegisterControllerBase(
      this._getDeviceLocationByCodeUseCase, this._registerDeviceUseCase);

  @observable
  String code = "";

  @observable
  String errorCode;

  @observable
  DeviceLocation deviceLocation;

  @observable
  bool isLoading = false;

  @computed
  bool get isRegisterButtonEnabled => this.code.isNotEmpty;

  @action
  void setCode(String code) => this.code = code;

  @action
  void onConfirmButtonClicked(Function onResult) {
    this.errorCode = null;
    this.isLoading = true;
    this
        ._getDeviceLocationByCodeUseCase
        .call(GetDeviceLocationByCodeUseCaseParam(code: this.code))
        .then((response) {
      this.isLoading = false;
      this.deviceLocation = response;
    }).catchError((error) {
      this.isLoading = false;
      if (error is DioError) {
        if (error.response.statusCode == 404) {
          this.errorCode = kTextErrorCodeNotFound;
          return;
        }
      }
      onResult(error);
      print("#### error: $error");
    });
  }

  @action
  void onRegisterButtonClicked(Function onError) {
    this.isLoading = true;
    this
        ._registerDeviceUseCase
        .call(RegisterDeviceUseCaseParams(this.code))
        .then((_) {
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString(
            kPrefsDeviceLocation, deviceLocationToJson(this.deviceLocation));
        Modular.to.popAndPushNamed(HomePage.routeName);
      });
    }).catchError((error) {
      this.isLoading = false;
      this.errorCode = kTextErrorCodeNotFound;
      onError(error);
    });
  }
}
