import 'package:flutter/material.dart';
import 'package:sd_ui_app/core/services/get_ui.dart';
import '../core/models/login_ui_model.dart';
import 'package:flutter/material.dart';

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

Widget parseUIToJson(Map<String, dynamic> response) {
  LoginUI loginUI = LoginUI.fromJson(response);
  // for(var item in loginUI.data?.fields!)
  // print(loginUI.data?.fields!.length);
  List<Widget> populatedWidget = <Widget>[];
  int len = loginUI.data!.fields!.length;
  for (int i = 0; i < len; i++) {
    String color = loginUI.data?.fields![i]?.design?.color as String;
    populatedWidget.add(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
          decoration: BoxDecoration(
            borderRadius: loginUI.data?.fields![i]?.widgetType == 'textButton' ? BorderRadius.circular(20) : BorderRadius.circular(5),
            border: Border.all(color: hexToColor('#$color')),
          ),
          child: loginUI.data?.fields![i]?.widgetType == 'textField'
              ? parseTextField(
                  isEnabled: loginUI.data?.fields![i]?.isEnabled as bool,
                  label: loginUI.data?.fields![i]?.fieldName as String,
                )
              : loginUI.data?.fields![i]?.widgetType == 'textButton'
                  ? parseButton(
                      isEnabled: loginUI.data?.fields![i]?.isEnabled as bool,
                      label: loginUI.data?.fields![i]?.fieldName as String,
                    )
                  : parseDropDownButton(),
        ),
      ),
    );
  }
  return Column(
    children: populatedWidget,
  );
}

Widget parseTextField({required bool isEnabled, required String label}) {
  return TextField(
    // enabled: loginUI.data?.fields![i]?.isEnabled,
    enabled: isEnabled,
    decoration: InputDecoration(
      border: InputBorder.none,
      // labelText: loginUI.data?.fields![i]?.fieldName,
      labelText: label,
    ),
  );
}

Widget parseButton({required bool isEnabled, required String label}) {
  return TextButton(
    onPressed: () {},
    child: Text(label),
  );
}

Widget parseDropDownButton() {
  return Container();
}
