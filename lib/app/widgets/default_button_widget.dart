import 'package:flutter/material.dart';
import 'package:totem/app/commons/constants.dart';

class DefaultButtonWidget extends StatelessWidget {
  final double padding;
  final String text;
  final bool isVisible;
  final bool isEnabled;
  final bool isLoading;
  final Function onPressed;

  const DefaultButtonWidget({
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
            child: RaisedButton(
              onPressed: (this.isEnabled
                  ? (this.onPressed != null ? this.onPressed : () {})
                  : null),
              color: kColorRed3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
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
        style: textStyleGothamMedium32(Colors.white),
      );
    }
    return Center(
      child: Container(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}
