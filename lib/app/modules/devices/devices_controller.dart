import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:totem/app/commons/constants.dart';
import 'package:totem/app/commons/enums.dart';
import 'package:totem/app/core/usecase.dart';
import 'package:totem/app/domain/usecases/authenticate_usecase.dart';
import 'package:totem/app/domain/usecases/get_internet_status_usecase.dart';
import 'package:totem/app/domain/usecases/get_pinpad_status_usecase.dart';
import 'package:totem/app/domain/usecases/get_printer_status_usecase.dart';
import 'package:totem/app/domain/usecases/get_scanner_status_usecase.dart';
import 'package:totem/app/modules/home/home_page.dart';
import 'package:totem/app/modules/register/register_module.dart';
import 'package:totem/app/modules/register/register_screen.dart';

part 'devices_controller.g.dart';

class DevicesController = _DevicesControllerBase with _$DevicesController;

abstract class _DevicesControllerBase with Store {
  final GetPrinterStatusUseCase getPrinterStatusUseCase;
  final GetInternetStatusUseCase getInternetStatusUseCase;
  final GetPinPadStatusUseCase getPinPadStatusUseCase;
  final GetScannerStatusUseCase getScannerStatusUseCase;
  final AuthenticateUseCase authenticateUseCase;
  _DevicesControllerBase({
    @required this.getPrinterStatusUseCase,
    @required this.getInternetStatusUseCase,
    @required this.getPinPadStatusUseCase,
    @required this.getScannerStatusUseCase,
    @required this.authenticateUseCase,
  });

  @observable
  DeviceStatus scannerStatus = DeviceStatus.Loading;

  @observable
  DeviceStatus printerStatus = DeviceStatus.Loading;

  @observable
  DeviceStatus pinpadStatus = DeviceStatus.Loading;

  @observable
  DeviceStatus internetStatus = DeviceStatus.Loading;

  @observable
  bool isButtonVisible = false;

  @computed
  bool get isButtonLoading =>
      this.scannerStatus == DeviceStatus.Loading ||
      this.printerStatus == DeviceStatus.Loading ||
      this.pinpadStatus == DeviceStatus.Loading ||
      this.internetStatus == DeviceStatus.Loading;

  @action
  void checkDevices() {
    setLoadingForAllDevices();
    _checkPrinterDeviceStatus();
    _checkInternetDeviceStatus();
    _checkPinPadDeviceStatus();
    _checkScannerDeviceStatus();
  }

  void setLoadingForAllDevices() {
    this.scannerStatus = DeviceStatus.Loading;
    this.printerStatus = DeviceStatus.Loading;
    this.pinpadStatus = DeviceStatus.Loading;
    this.internetStatus = DeviceStatus.Loading;
  }

  void _checkPrinterDeviceStatus() {
    this.getPrinterStatusUseCase.call(NoParams()).then((status) {
      this.printerStatus = status;
      _checkAllDevicesAllChecked();
    }).catchError((error) {
      this.printerStatus = DeviceStatus.Error;
      _checkAllDevicesAllChecked();
    });
  }

  void _checkInternetDeviceStatus() {
    this.getInternetStatusUseCase.call(NoParams()).then((result) {
      this.internetStatus = result;
      _checkAllDevicesAllChecked();
    }).catchError((error) {
      this.internetStatus = DeviceStatus.Error;
      this.isButtonVisible = true;
    });
  }

  void _checkPinPadDeviceStatus() {
    this.getPinPadStatusUseCase.call(NoParams()).then((status) {
      this.pinpadStatus = status;
      _checkAllDevicesAllChecked();
    }).catchError((error) {
      this.pinpadStatus = DeviceStatus.Error;
      _checkAllDevicesAllChecked();
    });
  }

  void _checkScannerDeviceStatus() {
    this.getScannerStatusUseCase.call(NoParams()).then((status) {
      this.scannerStatus = status;
      _checkAllDevicesAllChecked();
    }).catchError((error) {
      this.scannerStatus = DeviceStatus.Error;
      _checkAllDevicesAllChecked();
    });
  }

  void _checkAllDevicesAllChecked() {
    if (this.scannerStatus != DeviceStatus.Loading &&
        this.printerStatus != DeviceStatus.Loading &&
        this.pinpadStatus != DeviceStatus.Loading &&
        this.internetStatus != DeviceStatus.Loading) {
      if (this.internetStatus == DeviceStatus.OK) {
        this.authenticateUseCase.call(NoParams()).then((result) {
          SharedPreferences.getInstance().then((prefs) {
            prefs.setString(kPrefsAccessToken, result);
            var deviceLocation = prefs.getString(kPrefsDeviceLocation);
            if (deviceLocation != null && deviceLocation.isNotEmpty) {
              Modular.to.pushReplacementNamed(HomePage.routeName);
            } else {
              Modular.to.pushReplacementNamed(RegisterScreen.routeName);
            }
          });
        }).catchError((error) {
          this.isButtonVisible = true;
          this.internetStatus = DeviceStatus.Error;
        });
      }
    }
  }
}
