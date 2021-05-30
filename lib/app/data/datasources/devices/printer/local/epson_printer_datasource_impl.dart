import 'package:flutter/services.dart';
import 'package:totem/app/data/datasources/devices/printer/printer_datasource.dart';
import 'package:totem/app/domain/driver/commons/printer_constants.dart';
import 'package:totem/app/domain/entities/device_info.dart';

class EpsonPrinterDataSourceImpl implements PrinterDataSource {
  static const platform =
      const MethodChannel('totem.financegroup.com.br/devices');

  Future<bool> initialize() async {
    try {
      final bool result =
          await platform.invokeMethod(kPrinterCallMethodInitialize);
      print("##### Epson::$kPrinterCallMethodInitialize - successfull");
      return result;
    } on PlatformException catch (e) {
      print("##### Epson::$kPrinterCallMethodInitialize - fail to initialize");
      return false;
    }
  }

  Future<DeviceInfo> discovery() async {
    var deviceInfo;
    try {
      final String result =
          await platform.invokeMethod(kPrinterCallMethodDiscovery);
      print("##### Epson::$kPrinterCallMethodDiscovery - result=$result");
      if (result != null && result.isNotEmpty) {
        deviceInfo = deviceInfoFromJson(result);
        print(
            "##### Epson::$kPrinterCallMethodDiscovery - deviceName: ${deviceInfo.deviceName}");
      }
      return deviceInfo;
    } on PlatformException catch (e) {
      print("##### Epson::$kPrinterCallMethodDiscovery - fail to discovery");
      return deviceInfo;
    }
  }

  Future<bool> connect(DeviceInfo deviceInfo) async {
    try {
      final bool result = await platform.invokeMethod(
        kPrinterCallMethodConnect,
        {kPrinterCallMethodPortArgument: deviceInfo.target},
      );
      return result;
    } on PlatformException catch (e) {
      print("##### Epson::$kPrinterCallMethodConnect - fail to connect");
      return false;
    }
  }

  Future<bool> addLogo() async {
    try {
      await platform.invokeMethod(kPrinterCallMethodAddLogo);
      print("##### Epson::$kPrinterCallMethodAddLogo - add logo successfull");
      return true;
    } on PlatformException catch (e) {
      print("##### Epson::$kPrinterCallMethodAddLogo - fail to add logo");
      return false;
    }
  }

  Future<bool> addTextAlign(int align) async {
    try {
      final bool result = await platform.invokeMethod(
        kPrinterCallMethodAddTextAlign,
        {kPrinterCallMethodAlignArgument: align},
      );
      print(
          "##### Epson::$kPrinterCallMethodAddTextAlign - add text align successfull");
      return result;
    } on PlatformException catch (e) {
      print("##### Epson::$kPrinterCallMethodConnect - fail to add text align");
      return false;
    }
  }

  Future<bool> addFeedLine(int line) async {
    try {
      final bool result = await platform.invokeMethod(
        kPrinterCallMethodAddFeedLine,
        {kPrinterCallMethodLineArgument: line},
      );
      print(
          "##### Epson::$kPrinterCallMethodAddFeedLine - add feedline successfull");
      return result;
    } on PlatformException catch (e) {
      print(
          "##### Epson::$kPrinterCallMethodAddFeedLine - fail to add feedline");
      return false;
    }
  }

  Future<bool> addText(String text) async {
    try {
      final bool result = await platform.invokeMethod(
        kPrinterCallMethodAddText,
        {kPrinterCallMethodTextArgument: text},
      );
      print("##### Epson::$kPrinterCallMethodAddText - add text successfull");
      return result;
    } on PlatformException catch (e) {
      print("##### Epson::$kPrinterCallMethodAddText - fail to add text");
      return false;
    }
  }

  Future<bool> addTextSize(int width, int height) async {
    try {
      final bool result = await platform.invokeMethod(
        kPrinterCallMethodAddTextSize,
        {
          kPrinterCallMethodWidthArgument: width,
          kPrinterCallMethodHeightArgument: height
        },
      );
      print(
          "##### Epson::$kPrinterCallMethodAddTextSize - add text size successfull");
      return result;
    } on PlatformException catch (e) {
      print(
          "##### Epson::$kPrinterCallMethodAddTextSize - fail to add text size");
      return false;
    }
  }

  Future<bool> addBarcode(String code) async {
    try {
      final bool result = await platform.invokeMethod(
        kPrinterCallMethodAddBarcode,
        {kPrinterCallMethodCodeArgument: code},
      );
      print(
          "##### Epson::$kPrinterCallMethodAddBarcode - add barcode successfull");
      return result;
    } on PlatformException catch (e) {
      print("##### Epson::$kPrinterCallMethodAddBarcode - fail to add barcode");
      return false;
    }
  }

  Future<bool> addCut(int type) async {
    try {
      final bool result = await platform.invokeMethod(
        kPrinterCallMethodAddCut,
        {kPrinterCallMethodTypeArgument: type},
      );
      print("##### Epson::$kPrinterCallMethodAddCut - add cute successfull");
      return result;
    } on PlatformException catch (e) {
      print("##### Epson::$kPrinterCallMethodAddCut - fail to add cute");
      return false;
    }
  }

  Future<bool> clearCommandBuffer() async {
    try {
      final bool result =
          await platform.invokeMethod(kPrinterCallMethodClearCommandBuffer);
      print(
          "##### Epson::$kPrinterCallMethodClearCommandBuffer - clear command buffer successfull");
      return result;
    } on PlatformException catch (e) {
      print(
          "##### Epson::$kPrinterCallMethodClearCommandBuffer - fail to clear command buffer");
      return false;
    }
  }

  Future<bool> sendData(int timeout) async {
    try {
      final bool result = await platform.invokeMethod(
        kPrinterCallMethodSendData,
        {kPrinterCallMethodTimeoutArgument: timeout},
      );
      print("##### Epson::$kPrinterCallMethodSendData - send data successfull");
      return result;
    } on PlatformException catch (e) {
      print("##### Epson::$kPrinterCallMethodSendData - fail to send data");
      return false;
    }
  }

  Future<bool> disconnect() async {
    try {
      final bool result =
          await platform.invokeMethod(kPrinterCallMethodDisconnect);
      print(
          "##### Epson::$kPrinterCallMethodDisconnect - disconnect successfull");
      return result;
    } on PlatformException catch (e) {
      print("##### Epson::$kPrinterCallMethodDisconnect - fail to disconnect");
      return false;
    }
  }

  Future<String> getStatus() async {
    try {
      final String result =
          await platform.invokeMethod(kPrinterCallMethodGetStatus);
      return result;
    } on PlatformException catch (e) {
      print("##### Epson::$kPrinterCallMethodDisconnect - fail to disconnect");
      return "OFFLINE";
    }
  }
}
