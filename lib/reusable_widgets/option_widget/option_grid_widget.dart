import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class GridOptionTile extends StatelessWidget {
  final String optionImage, optionTitle;
  final Function()? onTapFunction;
  final bool isWhatsHappeningScreen, isBabyConditionScreen, isDark;

  const GridOptionTile({
    super.key,
    required this.optionImage,
    required this.optionTitle,
    required this.onTapFunction,
    required this.isDark,
    this.isWhatsHappeningScreen = false,
    this.isBabyConditionScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: InkWell(
            onTap: onTapFunction,
            borderRadius: BorderRadius.circular(
              20,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isDark
                    ? CColors.buttonDarkBackground
                    : CColors.fontColorDarkBackground,
                borderRadius: BorderRadius.circular(
                  40,
                ),
              ),
              child: Image.asset(
                optionImage,
              ),
            ),
          ),
        ),
        5.ph,
        FittedBox(
          child: Text(
            optionTitle,
            style: isDark
                ? isWhatsHappeningScreen
                    ? CustomTextStyles.fontBright640
                    : isBabyConditionScreen
                        ? CustomTextStyles.fontBright640
                        : CustomTextStyles.fontBright970
                : isWhatsHappeningScreen
                    ? CustomTextStyles.fontDark640
                    : isBabyConditionScreen
                        ? CustomTextStyles.fontDark640
                        : CustomTextStyles.fontDark970,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class GridOptionBabyConditionTile extends StatelessWidget {
  final String optionImage, optionTitle;
  final Function()? onTapFunction;
  final double? height, width;
  final bool isDark, isSelected;

  const GridOptionBabyConditionTile({
    super.key,
    required this.optionImage,
    required this.optionTitle,
    required this.onTapFunction,
    required this.isDark,
    required this.isSelected,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: height,
          width: width,
          child: InkWell(
            onTap: onTapFunction,
            borderRadius: BorderRadius.circular(
              20,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isDark && isSelected == false
                    ? CColors.buttonDarkBackground
                    : isDark && isSelected
                        ? CColors.buttonBrightBackground
                        : isDark == false && isSelected == true
                            ? CColors.fontColorDarkBackground
                            : CColors.buttonBrightBackground,
                borderRadius: BorderRadius.circular(
                  40,
                ),
              ),
              child: Image.asset(
                optionImage,
              ),
            ),
          ),
        ),
        5.ph,
        Text(
          optionTitle,
          style: isDark
              ? CustomTextStyles.fontBright630
              : CustomTextStyles.fontDark630,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
