import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:totem/app/commons/constants.dart';
import 'package:totem/app/widgets/default_button_widget.dart';

class InternalErrorPopupWidget extends StatefulWidget {
  InternalErrorPopupWidget({Key key}) : super(key: key);

  @override
  _InternalErrorPopupWidgetState createState() =>
      _InternalErrorPopupWidgetState();
}

class _InternalErrorPopupWidgetState extends State<InternalErrorPopupWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      content: Container(
        width: 672,
        color: Colors.white,
        child: createViews(),
      ),
    );
  }

  Widget createViews() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          "assets/images/internal_error.svg",
          height: 384,
        ),
        SizedBox(
          height: 48,
        ),
        Text(
          kTextErrorInternalErrorTitle,
          style: textStyleGothamMedium32(kColorRed1),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          kTextErrorInternalErrorSubtitle,
          textAlign: TextAlign.center,
          style: textStyleGothamMedium24(kColorGray2),
        ),
        SizedBox(
          height: 48,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: DefaultButtonWidget(
            text: kTextTryAgain,
            isEnabled: true,
            onPressed: () {
              Modular.to.pop();
            },
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
