import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:totem/app/commons/constants.dart';
import 'package:totem/app/commons/enums.dart';
import 'package:totem/app/modules/devices/devices_controller.dart';
import 'package:totem/app/widgets/default_button_widget.dart';
import 'package:totem/app/widgets/device_status_widget.dart';
import 'package:totem/app/widgets/top_bar_widget.dart';

class DevicesScreen extends StatefulWidget {
  DevicesScreen({Key key}) : super(key: key);

  @override
  _DevicesScreenState createState() => _DevicesScreenState();
}

class _DevicesScreenState
    extends ModularState<DevicesScreen, DevicesController> {
  @override
  void initState() {
    super.initState();
    this.controller.checkDevices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TopBarWidget(
            title: kTitleDevices,
          ),
          SizedBox(
            height: 120,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(builder: (_) {
                  return DeviceStatusWidget(
                    text: "Scanner",
                    status: this.controller.scannerStatus,
                  );
                }),
                SizedBox(
                  height: 80,
                ),
                Observer(builder: (_) {
                  return DeviceStatusWidget(
                    text: "Impressora",
                    status: this.controller.printerStatus,
                  );
                }),
                SizedBox(
                  height: 80,
                ),
                Observer(builder: (_) {
                  return DeviceStatusWidget(
                    text: "Pinpad",
                    status: this.controller.pinpadStatus,
                  );
                }),
                SizedBox(
                  height: 80,
                ),
                Observer(builder: (_) {
                  return DeviceStatusWidget(
                    text: "Internet",
                    status: this.controller.internetStatus,
                  );
                }),
              ],
            ),
          ),
          Spacer(),
          Observer(
            builder: (_) {
              return DefaultButtonWidget(
                text: "Tentar novamente",
                padding: 40,
                isVisible: this.controller.isButtonVisible,
                isEnabled: true,
                isLoading:
                    this.controller.internetStatus == DeviceStatus.Loading,
                onPressed: () {
                  this.controller.checkDevices();
                },
              );
            },
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
