// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  Computed<bool> _$isRegisterButtonEnabledComputed;

  @override
  bool get isRegisterButtonEnabled => (_$isRegisterButtonEnabledComputed ??=
          Computed<bool>(() => super.isRegisterButtonEnabled,
              name: '_RegisterControllerBase.isRegisterButtonEnabled'))
      .value;

  final _$codeAtom = Atom(name: '_RegisterControllerBase.code');

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  final _$errorCodeAtom = Atom(name: '_RegisterControllerBase.errorCode');

  @override
  String get errorCode {
    _$errorCodeAtom.reportRead();
    return super.errorCode;
  }

  @override
  set errorCode(String value) {
    _$errorCodeAtom.reportWrite(value, super.errorCode, () {
      super.errorCode = value;
    });
  }

  final _$deviceLocationAtom =
      Atom(name: '_RegisterControllerBase.deviceLocation');

  @override
  DeviceLocation get deviceLocation {
    _$deviceLocationAtom.reportRead();
    return super.deviceLocation;
  }

  @override
  set deviceLocation(DeviceLocation value) {
    _$deviceLocationAtom.reportWrite(value, super.deviceLocation, () {
      super.deviceLocation = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_RegisterControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  void setCode(String code) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setCode');
    try {
      return super.setCode(code);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onConfirmButtonClicked(Function onResult) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.onConfirmButtonClicked');
    try {
      return super.onConfirmButtonClicked(onResult);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onRegisterButtonClicked(Function onError) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.onRegisterButtonClicked');
    try {
      return super.onRegisterButtonClicked(onError);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
code: ${code},
errorCode: ${errorCode},
deviceLocation: ${deviceLocation},
isLoading: ${isLoading},
isRegisterButtonEnabled: ${isRegisterButtonEnabled}
    ''';
  }
}
