import 'package:annotation/utils/colors/app_colors.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackContainerButton extends StatelessWidget {
  final bool needSpaceFromLeft, needSpaceFromTop, isDark;

  const BackContainerButton({
    super.key,
    required this.isDark,
    this.needSpaceFromLeft = true,
    this.needSpaceFromTop = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        needSpaceFromTop ? 30.ph : const SizedBox.shrink(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            needSpaceFromLeft ? 20.pw : const SizedBox.shrink(),
            InkWell(
              borderRadius: BorderRadius.circular(
                10,
              ),
              onTap: () {
                Get.back();
              },
              child: Container(
                alignment: Alignment.center,
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: isDark
                      ? CColors.buttonDarkBackground
                      : CColors.topLefBrightButtonBackground,
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                ),
                child:  Icon(
                  Icons.arrow_back_ios_new,
                  color: isDark
                      ? CColors.fontColorBrightBackground
                      : CColors.whiteColor,
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
