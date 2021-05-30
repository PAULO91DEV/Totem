import 'package:flutter/material.dart';
import 'package:totem/app/commons/constants.dart';

class OutlineDefaultButtonWidget extends StatelessWidget {
  final double padding;
  final String text;
  final bool isVisible;
  final bool isEnabled;
  final bool isLoading;
  final Function onPressed;

  const OutlineDefaultButtonWidget({
    Key key,
    this.padding,
    this.text,
    this.onPressed,
    this.isVisible = true,
    this.isEnabled = true,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.isVisible == false) {
      return Container();
    }

    return Row(
      children: [
        SizedBox(
          width: this.padding,
        ),
        Expanded(
          child: Container(
            height: 94,
            child: FlatButton(
              onPressed: (this.isEnabled
                  ? (this.onPressed != null ? this.onPressed : () {})
                  : null),
              disabledColor: kColorGray5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
                side: BorderSide(
                  width: 1,
                  color: (isEnabled ? kColorRed3 : kColorGray5),
                ),
              ),
              child: getText(),
            ),
          ),
        ),
        SizedBox(
          width: this.padding,
        ),
      ],
    );
  }

  Widget getText() {
    if (!this.isLoading) {
      return Text(
        this.text,
        style: textStyleGothamMedium32((isEnabled ? kColorRed3 : kColorWhite)),
      );
    }
    return Center(
      child: Container(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(kColorRed3),
        ),
      ),
    );
  }
}
