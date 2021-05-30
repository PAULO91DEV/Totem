import 'package:totem/app/data/datasources/devices/printer/printer_datasource.dart';
import 'package:totem/app/domain/entities/device_info.dart';
import 'package:totem/app/domain/driver/printer/printer_driver.dart';

class PrinterDriverImpl implements PrinterDriver {
  final PrinterDataSource _dataSource;
  PrinterDriverImpl(this._dataSource);

  Future<bool> initialize() {
    return this._dataSource.initialize();
  }

  Future<DeviceInfo> discovery() {
    return this._dataSource.discovery();
  }

  Future<bool> connect(DeviceInfo deviceInfo) {
    return this._dataSource.connect(deviceInfo);
  }

  Future<bool> addLogo() {
    return this._dataSource.addLogo();
  }

  Future<bool> addTextAlign(int align) {
    return this._dataSource.addTextAlign(align);
  }

  Future<bool> addFeedLine(int line) {
    return this._dataSource.addFeedLine(line);
  }

  Future<bool> addText(String text) {
    return this._dataSource.addText(text);
  }

  Future<bool> addTextSize(int width, int height) {
    return this._dataSource.addTextSize(width, height);
  }

  Future<bool> addBarcode(String code) {
    return this._dataSource.addBarcode(code);
  }

  Future<bool> addCut(int type) {
    return this._dataSource.addCut(type);
  }

  Future<bool> clearCommandBuffer() {
    return this._dataSource.clearCommandBuffer();
  }

  Future<bool> sendData(int timeout) {
    return this._dataSource.sendData(timeout);
  }

  Future<bool> disconnect() async {
    return this._dataSource.disconnect();
  }

  Future<String> getStatus() {
    return this._dataSource.getStatus();
  }
}
