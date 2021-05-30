import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:totem/app/commons/constants.dart';
import 'package:totem/app/commons/enums.dart';

class DeviceStatusWidget extends StatelessWidget {
  final String text;
  final DeviceStatus status;
  const DeviceStatusWidget(
      {Key key, @required this.text, @required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          child: getDeviceStatusImage(status),
        ),
        SizedBox(
          width: 32,
        ),
        Text(
          text,
          style: textStyleGothamMedium32(
            kColorGray3,
          ),
        ),
      ],
    );
  }

  Widget getDeviceStatusImage(DeviceStatus status) {
    if (status == DeviceStatus.Loading) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(kColorRed3),
      );
    } else {
      return SvgPicture.asset(
        (status == DeviceStatus.OK
            ? "assets/images/success.svg"
            : "assets/images/warning.svg"),
        height: 40,
        width: 40,
      );
    }
  }
}
