import 'package:flutter/material.dart';

extension CreatePopup on State<StatefulWidget> {
  void createPopupView(Widget alertWidget, {Function onResult}) {
    showDialog(
        context: this.context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return alertWidget;
        }).then((result) {
      if (onResult != null) {
        onResult(result);
      }
    });
  }
}
