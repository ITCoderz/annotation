import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';

class SendButton extends StatelessWidget {
  final bool needSpaceFromRight, needSpaceFromTop, isDark;
  final Function()? onTapFunction;

  const SendButton({
    super.key,
    required this.isDark,
    this.needSpaceFromRight = true,
    this.needSpaceFromTop = true,
    required this.onTapFunction,
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
            InkWell(
              borderRadius: BorderRadius.circular(
                10,
              ),
              onTap: onTapFunction,
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
                child: Icon(
                  Icons.send,
                  color: isDark
                      ? CColors.fontColorBrightBackground
                      : CColors.whiteColor,
                  size: 50,
                ),
              ),
            ),
            needSpaceFromRight ? 20.pw : const SizedBox.shrink(),
          ],
        ),
      ],
    );
  }
}
