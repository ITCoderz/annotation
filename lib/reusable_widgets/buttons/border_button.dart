import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class CustomBorderedElevatedButton extends StatelessWidget {
  final Function()? onPressedFunction;
  final String buttonText;
  final double height, width;
  final bool isDark;

  const CustomBorderedElevatedButton({
    super.key,
    required this.onPressedFunction,
    required this.buttonText,
    required this.width,
    required this.isDark,
    this.height = 55,
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
        backgroundColor: isDark
            ? CColors.fontColorBrightBackground
            : CColors.buttonBrightBackground,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isDark ? CColors.buttonDarkBackground : CColors.whiteColor,
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
          style: isDark
              ? CustomTextStyles.buttonDark950
              : CustomTextStyles.buttonLight950,
        ),
      ),
    );
  }
}
