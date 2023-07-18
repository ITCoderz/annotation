import 'package:annotation/reusable_widgets/buttons/border_button.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors/app_colors.dart';
import 'custom_text_field.dart';

class CustomAlertDialog extends StatelessWidget {
  final bool isDark;
  final TextEditingController textEditingController;
  final Function()? saveFunction;
  final String? Function(String?)? validatorFunction;
  final GlobalKey<FormState> formKey;

  const CustomAlertDialog({
    super.key,
    required this.isDark,
    required this.textEditingController,
    required this.saveFunction,
    required this.validatorFunction,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      alignment: Alignment.center,
      backgroundColor: isDark
          ? CColors.buttonDarkBackground
          : CColors.topLefBrightButtonBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              width: context.width * 0.6,
              height: 100,
              isDark: isDark,
              validatorFunction: validatorFunction,
              textEditingController: textEditingController,
            ),
            50.ph,
            CustomBorderedElevatedButton(
              onPressedFunction: saveFunction,
              buttonText: "Megment",
              width: context.width * 0.5,
              height: 100,
              isDark: isDark,
            ),
          ],
        ),
      ),
    );
  }
}
