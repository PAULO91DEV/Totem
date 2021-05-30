import 'package:flutter/material.dart';

// Urls
const String kUrlOAuth2 = "https://authentication2.imevo.net";
const String kUrlApiDevice = "https://apidevice.imevo.net";

// API
const String kGrantType = "client_credentials";
const String kClientId = "advertising-client";
const String kClientSecret = "advertising-secret-p@ssw0rD";
const String kFieldApiAccessToken = "access_token";

// Textos
const String kTitleDevices = "Validando o totem";
const String kTitleRegisterTotem = "Registrar totem";
const String kTextActivationCode = "Código de ativação";
const String kTextInsertCode = "Insira o código";
const String kTextRegister = "Registrar";
const String kTextConfirm = "Confirmar";
const String kTextTryAgain = "Tentar novamente";

// Textos Erros
const String kTextErrorCodeNotFound = "Código inválido";
const String kTextErrorInternalErrorTitle = "Ocorreu um erro inesperado";
const String kTextErrorInternalErrorSubtitle =
    "Estamos resolvendo este problema\nPor favor, tente novamente";

// Status
const kDeviceStatusOK = 0;
const kDeviceStatusError = 1;

// SharedPrefs
const String kPrefsAccessToken = "PREFS_ACCESS_TOKEN";
const String kPrefsDeviceLocation = "PREFS_DEVICE_LOCATION";

// Colors
const Color kColorRed1 = Color(0xff790009);
const Color kColorRed2 = Color(0xffA0141E);
const Color kColorRed3 = Color(0xffC82835);
const Color kColorRed4 = Color(0xffDB4F59);
const Color kColroRed5 = Color(0xffF9818A);

const Color kColorGray1 = Color(0xff131415);
const Color kColorGray2 = Color(0xff3A3B3D);
const Color kColorGray3 = Color(0xff58595B);
const Color kColorGray4 = Color(0xff757678);
const Color kColorGray5 = Color(0xff969799);
const Color kColorGray6 = Color(0xffE6E6E8);
const Color kColorWhite = Color(0xffFFFFFF);

// Text Styles
TextStyle createTextStyleGothamMedium(double fontSize, Color color) {
  return TextStyle(
    fontFamily: 'Gotham Medium',
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle createTextStyleGothamBook(double fontSize, Color color) {
  return TextStyle(
    fontFamily: 'Gotham Book',
    fontSize: fontSize,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle textStyleGothamMedium40(Color color) {
  return createTextStyleGothamMedium(40, color);
}

TextStyle textStyleGothamMedium32(Color color) {
  return createTextStyleGothamMedium(32, color);
}

TextStyle textStyleGothamMedium24(Color color) {
  return createTextStyleGothamMedium(24, color);
}

TextStyle textStyleGothamMedium16(Color color) {
  return createTextStyleGothamMedium(16, color);
}

TextStyle textStyleGothamMedium8(Color color) {
  return createTextStyleGothamMedium(8, color);
}

TextStyle textStyleGothamBook40(Color color) {
  return createTextStyleGothamBook(40, color);
}

TextStyle textStyleGothamBook32(Color color) {
  return createTextStyleGothamBook(32, color);
}

TextStyle textStyleGothamBook24(Color color) {
  return createTextStyleGothamBook(24, color);
}

TextStyle textStyleGothamBook16(Color color) {
  return createTextStyleGothamBook(16, color);
}

TextStyle textStyleGothamBook8(Color color) {
  return createTextStyleGothamBook(8, color);
}
