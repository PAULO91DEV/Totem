import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:totem/app/commons/constants.dart';

class TopBarWidget extends StatelessWidget {
  final String title;

  const TopBarWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(40, 40, 40, 38),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/images/logo.svg",
                width: 64,
                height: 64,
              ),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: textStyleGothamMedium40(kColorRed1),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                height: 2,
                color: kColorGray6,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
