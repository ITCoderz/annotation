import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class GridOptionTile extends StatelessWidget {
  final String optionImage, optionTitle;
  final Function()? onTapFunction;
  final bool isWhatsHappeningScreen;

  const GridOptionTile({
    super.key,
    required this.optionImage,
    required this.optionTitle,
    required this.onTapFunction,
    this.isWhatsHappeningScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 225,
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
                color: CColors.buttonDarkBackground,
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
        Flexible(
          child: Text(
            optionTitle,
            style: isWhatsHappeningScreen
                ? CustomTextStyles.fontBright650
                : CustomTextStyles.fontBright970,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
