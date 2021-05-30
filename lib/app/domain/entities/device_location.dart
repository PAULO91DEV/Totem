// To parse this JSON data, do
//
//     final deviceLocation = deviceLocationFromJson(jsonString);

import 'dart:convert';

DeviceLocation deviceLocationFromJson(String str) =>
    DeviceLocation.fromJson(json.decode(str));

String deviceLocationToJson(DeviceLocation data) => json.encode(data.toJson());

class DeviceLocation {
  DeviceLocation({
    this.company,
    this.site,
    this.locationId,
    this.description,
    this.parameters,
  });

  String company;
  String site;
  String locationId;
  String description;
  List<Parameter> parameters;

  factory DeviceLocation.fromJson(Map<String, dynamic> json) => DeviceLocation(
        company: json["company"] == null ? null : json["company"],
        site: json["site"] == null ? null : json["site"],
        locationId: json["locationId"] == null ? null : json["locationId"],
        description: json["description"] == null ? null : json["description"],
        parameters: json["parameters"] == null
            ? null
            : List<Parameter>.from(
                json["parameters"].map((x) => Parameter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "company": company == null ? null : company,
        "site": site == null ? null : site,
        "locationId": locationId == null ? null : locationId,
        "description": description == null ? null : description,
        "parameters": parameters == null
            ? null
            : List<dynamic>.from(parameters.map((x) => x.toJson())),
      };
}

class Parameter {
  Parameter({
    this.key,
    this.value,
  });

  String key;
  String value;

  factory Parameter.fromJson(Map<String, dynamic> json) => Parameter(
        key: json["key"] == null ? null : json["key"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "value": value == null ? null : value,
      };
}
