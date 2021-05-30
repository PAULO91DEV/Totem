import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:totem/app/commons/enums.dart';
import 'package:totem/app/core/usecase.dart';
import 'package:totem/app/modules/devices/devices_controller.dart';
import 'package:totem/app/modules/devices/devices_module.dart';

void main() {
  initModule(DevicesModule());

  DevicesController devicesController;
  setUp(() {
    devicesController = DevicesModule.to.get<DevicesController>();
  });

  group('DevicesController Test', () {
    test(" - Teste de inicialização", () {
      WidgetsFlutterBinding.ensureInitialized();
      expect(devicesController, isInstanceOf<DevicesController>());
      expect(devicesController.getInternetStatusUseCase != null, equals(true));
      expect(devicesController.getPrinterStatusUseCase != null, equals(true));
    });

    test(" - Verificando status de Loading", () {
      devicesController.checkDevices();
      expect(devicesController.pinpadStatus, equals(DeviceStatus.Loading));
      expect(devicesController.printerStatus, equals(DeviceStatus.Loading));
      expect(devicesController.scannerStatus, equals(DeviceStatus.Loading));
      expect(devicesController.internetStatus, equals(DeviceStatus.Loading));
    });

    test(" - getInternetStatusUseCase - Verificando se a Internet esta OK!",
        () async {
      var status =
          await devicesController.getInternetStatusUseCase.call(NoParams());
      expect(status, equals(DeviceStatus.OK));
    });

    // Não consegui fazer o teste da impressora usando o teste unitário
    // test(" - getPrinterStatusUseCase - Verificando se a impressora esta OK!",
    //     () async {
    //   var status =
    //       await devicesController.getPrinterStatusUseCase.call(NoParams());
    //   expect(status, equals(DeviceStatus.OK));
    // });
  });
}
