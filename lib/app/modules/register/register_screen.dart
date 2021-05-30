import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:totem/app/commons/constants.dart';
import 'package:totem/app/domain/entities/device_location.dart';
import 'package:totem/app/modules/register/register_controller.dart';
import 'package:totem/app/popups/internal_error_popup_widget.dart';
import 'package:totem/app/widgets/default_button_widget.dart';
import 'package:totem/app/widgets/outline_default_button_widget.dart';
import 'package:totem/app/widgets/top_bar_widget.dart';
import 'package:fullscreen/fullscreen.dart';
import '../../commons/extensions.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = "/register";

  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState
    extends ModularState<RegisterScreen, RegisterController> {
  FullScreen fullscreen = new FullScreen();

  @override
  Widget build(BuildContext context) {
    fullscreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);//essa funcão ultiliza a tela todo do dispositivo.
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopBarWidget(
            title: kTitleRegisterTotem,
          ),
          SizedBox(
            height: 120,
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                return createBody();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget createBody() {
    if (this.controller.deviceLocation != null) {
      return showLocation();
    }
    return createGetLocationByCodeBody();
  }

  Widget showLocation() {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: this.controller.deviceLocation.parameters.length,
          itemBuilder: (context, index) {
            Parameter parameter =
                this.controller.deviceLocation.parameters[index];
            return ListTileTheme(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: (index % 2 == 0 ? kColroRed5 : kColorWhite),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          parameter.key,
                          style: textStyleGothamBook24(kColorGray1),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          parameter.value,
                          textAlign: TextAlign.end,
                          style: textStyleGothamMedium24(kColorGray1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Expanded(
                child: OutlineDefaultButtonWidget(
                  text: "Voltar",
                  isEnabled: !this.controller.isLoading,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: DefaultButtonWidget(
                  text: "Registrar",
                  isEnabled: !this.controller.isLoading,
                  isLoading: this.controller.isLoading,
                  onPressed: () {
                    this.controller.onRegisterButtonClicked((error) {
                      if (error != null) {
                        showInternalError();
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }

  Widget createGetLocationByCodeBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 48),
          child: Text(
            kTextActivationCode,
            style: textStyleGothamBook24(kColorGray3),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Theme(
            data: ThemeData(
              primaryColor: kColorGray3,
              focusColor: kColorGray3,
            ),
            child: TextFormField(
              style: textStyleGothamBook24(kColorGray3),
              cursorColor: kColorGray3,
              onChanged: this.controller.setCode,
              decoration: InputDecoration(
                hintText: kTextInsertCode,
                hintStyle: textStyleGothamBook24(kColorGray5),
                errorText: this.controller.errorCode,
                errorStyle: textStyleGothamBook24(kColorRed4),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: kColorGray3),
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: DefaultButtonWidget(
            text: kTextConfirm,
            isEnabled: this.controller.isRegisterButtonEnabled &&
                !this.controller.isLoading,
            isLoading: this.controller.isLoading,
            onPressed: () {
              FocusScope.of(context).unfocus();
              this.controller.onConfirmButtonClicked((error) {
                if (error != null) {
                  showInternalError();
                }
              });
            },
          ),
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }

  void showInternalError() {
    createPopupView(InternalErrorPopupWidget());
  }
}
