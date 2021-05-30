import 'package:totem/app/data/datasources/devices/printer/printer_datasource.dart';
import 'package:totem/app/domain/entities/device_info.dart';

class PrinterMockDataSourceImpl implements PrinterDataSource {
  @override
  Future<bool> addBarcode(String code) {
    return Future.delayed(Duration(seconds: 1)).then((_) {
      return true;
    });
  }

  @override
  Future<bool> addCut(int type) {
    return Future.delayed(Duration(milliseconds: 10)).then((_) {
      return true;
    });
  }

  @override
  Future<bool> addFeedLine(int line) {
    return Future.delayed(Duration(milliseconds: 10)).then((_) {
      return true;
    });
  }

  @override
  Future<bool> addLogo() {
    return Future.delayed(Duration(milliseconds: 10)).then((_) {
      return true;
    });
  }

  @override
  Future<bool> addText(String text) {
    return Future.delayed(Duration(milliseconds: 10)).then((_) {
      return true;
    });
  }

  @override
  Future<bool> addTextAlign(int align) {
    return Future.delayed(Duration(milliseconds: 10)).then((_) {
      return true;
    });
  }

  @override
  Future<bool> addTextSize(int width, int height) {
    return Future.delayed(Duration(milliseconds: 10)).then((_) {
      return true;
    });
  }

  @override
  Future<bool> clearCommandBuffer() {
    return Future.delayed(Duration(milliseconds: 10)).then((_) {
      return true;
    });
  }

  @override
  Future<bool> connect(DeviceInfo deviceInfo) {
    return Future.delayed(Duration(seconds: 1)).then((_) {
      return true;
    });
  }

  @override
  Future<bool> disconnect() {
    return Future.delayed(Duration(seconds: 1)).then((_) {
      return true;
    });
  }

  @override
  Future<DeviceInfo> discovery() {
    return Future.delayed(Duration(seconds: 2)).then((_) {
      return DeviceInfo(
        deviceType: 0,
        deviceName: "",
        target: "USB",
        ipAddress: "",
        macAddress: "",
        bdAddress: "",
      );
    });
  }

  @override
  Future<String> getStatus() {
    return Future.delayed(Duration(seconds: 3)).then((_) {
      return "ONLINE";
    });
  }

  @override
  Future<bool> initialize() {
    return Future.delayed(Duration(milliseconds: 10)).then((_) {
      return true;
    });
  }

  @override
  Future<bool> sendData(int timeout) {
    return Future.delayed(Duration(milliseconds: 10)).then((_) {
      return true;
    });
  }
}
