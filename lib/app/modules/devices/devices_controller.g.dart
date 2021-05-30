// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DevicesController on _DevicesControllerBase, Store {
  Computed<bool> _$isButtonLoadingComputed;

  @override
  bool get isButtonLoading =>
      (_$isButtonLoadingComputed ??= Computed<bool>(() => super.isButtonLoading,
              name: '_DevicesControllerBase.isButtonLoading'))
          .value;

  final _$scannerStatusAtom =
      Atom(name: '_DevicesControllerBase.scannerStatus');

  @override
  DeviceStatus get scannerStatus {
    _$scannerStatusAtom.reportRead();
    return super.scannerStatus;
  }

  @override
  set scannerStatus(DeviceStatus value) {
    _$scannerStatusAtom.reportWrite(value, super.scannerStatus, () {
      super.scannerStatus = value;
    });
  }

  final _$printerStatusAtom =
      Atom(name: '_DevicesControllerBase.printerStatus');

  @override
  DeviceStatus get printerStatus {
    _$printerStatusAtom.reportRead();
    return super.printerStatus;
  }

  @override
  set printerStatus(DeviceStatus value) {
    _$printerStatusAtom.reportWrite(value, super.printerStatus, () {
      super.printerStatus = value;
    });
  }

  final _$pinpadStatusAtom = Atom(name: '_DevicesControllerBase.pinpadStatus');

  @override
  DeviceStatus get pinpadStatus {
    _$pinpadStatusAtom.reportRead();
    return super.pinpadStatus;
  }

  @override
  set pinpadStatus(DeviceStatus value) {
    _$pinpadStatusAtom.reportWrite(value, super.pinpadStatus, () {
      super.pinpadStatus = value;
    });
  }

  final _$internetStatusAtom =
      Atom(name: '_DevicesControllerBase.internetStatus');

  @override
  DeviceStatus get internetStatus {
    _$internetStatusAtom.reportRead();
    return super.internetStatus;
  }

  @override
  set internetStatus(DeviceStatus value) {
    _$internetStatusAtom.reportWrite(value, super.internetStatus, () {
      super.internetStatus = value;
    });
  }

  final _$isButtonVisibleAtom =
      Atom(name: '_DevicesControllerBase.isButtonVisible');

  @override
  bool get isButtonVisible {
    _$isButtonVisibleAtom.reportRead();
    return super.isButtonVisible;
  }

  @override
  set isButtonVisible(bool value) {
    _$isButtonVisibleAtom.reportWrite(value, super.isButtonVisible, () {
      super.isButtonVisible = value;
    });
  }

  final _$_DevicesControllerBaseActionController =
      ActionController(name: '_DevicesControllerBase');

  @override
  void checkDevices() {
    final _$actionInfo = _$_DevicesControllerBaseActionController.startAction(
        name: '_DevicesControllerBase.checkDevices');
    try {
      return super.checkDevices();
    } finally {
      _$_DevicesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
scannerStatus: ${scannerStatus},
printerStatus: ${printerStatus},
pinpadStatus: ${pinpadStatus},
internetStatus: ${internetStatus},
isButtonVisible: ${isButtonVisible},
isButtonLoading: ${isButtonLoading}
    ''';
  }
}
