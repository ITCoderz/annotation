import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors/app_colors.dart';
import '../buttons/border_button.dart';

class CustomSelectionDialog extends StatelessWidget {
  final bool isDark;
  final Function()? babyFunction, nurseFunction;
final String selectionOneString,selectionSecondString;
  const CustomSelectionDialog({
    super.key,
    required this.isDark,
    required this.babyFunction,
    required this.nurseFunction,
    required this.selectionOneString,
    required this.selectionSecondString,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      alignment: Alignment.center,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 30,
      ),
      backgroundColor: isDark
          ? CColors.buttonDarkBackground
          : CColors.topLefBrightButtonBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomBorderedElevatedButton(
            onPressedFunction: babyFunction,
            buttonText: selectionOneString,
            width: context.width * 0.7,
            height: 120,
            isDark: isDark,
          ),
          50.ph,
          CustomBorderedElevatedButton(
            onPressedFunction: nurseFunction,
            buttonText: selectionSecondString,
            width: context.width * 0.7,
            height: 120,
            isDark: isDark,
          ),
        ],
      ),
    );
  }
}

