import 'package:totem/app/domain/entities/device_info.dart';

class PrinterDataSource {
  // ignore: missing_return
  Future<bool> initialize() {}
  // ignore: missing_return
  Future<DeviceInfo> discovery() {}
  // ignore: missing_return
  Future<bool> connect(DeviceInfo deviceInfo) {}
  // ignore: missing_return
  Future<bool> addLogo() {}
  // ignore: missing_return
  Future<bool> addTextAlign(int align) {}
  // ignore: missing_return
  Future<bool> addFeedLine(int line) {}
  // ignore: missing_return
  Future<bool> addText(String text) {}
  // ignore: missing_return
  Future<bool> addTextSize(int width, int height) {}
  // ignore: missing_return
  Future<bool> addBarcode(String code) {}
  // ignore: missing_return
  Future<bool> addCut(int type) {}
  // ignore: missing_return
  Future<bool> clearCommandBuffer() {}
  // ignore: missing_return
  Future<bool> sendData(int timeout) {}
  // ignore: missing_return
  Future<bool> disconnect() {}
  // ignore: missing_return
  Future<String> getStatus() {}
}
