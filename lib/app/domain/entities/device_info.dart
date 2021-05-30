import 'dart:convert';

DeviceInfo deviceInfoFromJson(String str) =>
    DeviceInfo.fromJson(json.decode(str));

String deviceInfoToJson(DeviceInfo data) => json.encode(data.toJson());

class DeviceInfo {
  DeviceInfo({
    this.deviceType,
    this.target,
    this.deviceName,
    this.ipAddress,
    this.macAddress,
    this.bdAddress,
  });

  int deviceType;
  String target;
  String deviceName;
  String ipAddress;
  String macAddress;
  String bdAddress;

  factory DeviceInfo.fromJson(Map<String, dynamic> json) => DeviceInfo(
        deviceType: json["deviceType"] == null ? null : json["deviceType"],
        target: json["target"] == null ? null : json["target"],
        deviceName: json["deviceName"] == null ? null : json["deviceName"],
        ipAddress: json["ipAddress"] == null ? null : json["ipAddress"],
        macAddress: json["macAddress"] == null ? null : json["macAddress"],
        bdAddress: json["bdAddress"] == null ? null : json["bdAddress"],
      );

  Map<String, dynamic> toJson() => {
        "deviceType": deviceType == null ? null : deviceType,
        "target": target == null ? null : target,
        "deviceName": deviceName == null ? null : deviceName,
        "ipAddress": ipAddress == null ? null : ipAddress,
        "macAddress": macAddress == null ? null : macAddress,
        "bdAddress": bdAddress == null ? null : bdAddress,
      };
}
