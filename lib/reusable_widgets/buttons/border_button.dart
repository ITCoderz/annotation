import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class CustomBorderedElevatedButton extends StatelessWidget {
  final Function()? onPressedFunction;
  final String buttonText;
  final double height, width;
  final Color backgroundColor, borderColor;

  const CustomBorderedElevatedButton({
    super.key,
    required this.onPressedFunction,
    required this.buttonText,
    required this.width,
    this.height = 55,
    this.borderColor = CColors.buttonDarkBackground,
    this.backgroundColor = CColors.fontColorBrightBackground,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedFunction,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          width,
          height,
        ),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
            width: 12,
          ),
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
      ),
      child: FittedBox(
        child: Text(
          buttonText,
          style: CustomTextStyles.mButtonDark750,
        ),
      ),
    );
  }
}
