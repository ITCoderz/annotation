import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String? Function(String?)? validatorFunction;
  final TextEditingController textEditingController;
  final String hintText;
  final double width, height;
  final bool isDark;

  const CustomTextField({
    Key? key,
    this.width = 250,
    this.height = 50,
    this.hintText = "",
    required this.isDark,
    required this.validatorFunction,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller: textEditingController,
        textAlignVertical: TextAlignVertical.center,
        style: isDark
            ? CustomTextStyles.fontDark640
            : CustomTextStyles.fontBright640,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 20,
          ),
          hintText: hintText,
          hintStyle: isDark
              ? CustomTextStyles.fontDark640
              : CustomTextStyles.fontBright640,
          enabled: true,
          filled: true,
          errorStyle: CustomTextStyles.errorStyle520,
          fillColor: isDark
              ? CColors.fontColorBrightBackground
              : CColors.buttonBrightBackground,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
        ),
        validator: validatorFunction,
      ),
    );
  }
}
