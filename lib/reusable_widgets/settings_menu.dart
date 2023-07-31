import 'package:annotation/utils/colors/app_colors.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:annotation/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class SettingsMenu extends StatelessWidget {
  final Offset offset;
  final Function()? addIdsFunction, removeFromExistingIdsFunction;
  final bool needSpaceFromRight, needSpaceFromTop, isDark;

  const SettingsMenu({
    Key? key,
    required this.addIdsFunction,
    required this.removeFromExistingIdsFunction,
    required this.isDark,
    this.needSpaceFromRight = true,
    this.needSpaceFromTop = true,
    this.offset = const Offset(-45, 45),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        needSpaceFromTop ? 25.ph : const SizedBox.shrink(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PopupMenuButton<int>(
              constraints: BoxConstraints(
                minWidth: 2.0 * 56.0,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              offset: offset,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              color: isDark
                  ? CColors.buttonBrightBackground
                  : CColors.topLefBrightButtonBackground,
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  onTap: addIdsFunction,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'adjon hozzá azonosítókat',
                        textAlign: TextAlign.center,
                        style: isDark
                            ? CustomTextStyles.bright530
                            : CustomTextStyles.fontDark530,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.add,
                        size: 30,
                        color: isDark
                            ? CColors.fontColorBrightBackground
                            : CColors.fontColorDarkBackground,
                      ),
                    ],
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 1,
                  onTap: removeFromExistingIdsFunction,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'töröljön azonosítókat',
                        textAlign: TextAlign.left,
                        style: isDark
                            ? CustomTextStyles.bright530
                            : CustomTextStyles.fontDark530,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.remove,
                        size: 30,
                        color: isDark
                            ? CColors.fontColorBrightBackground
                            : CColors.fontColorDarkBackground,
                      ),
                    ],
                  ),
                ),
              ],
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  color: isDark
                      ? CColors.buttonDarkBackground
                      : CColors.buttonBrightBackground,
                ),
                child: const Icon(
                  Icons.settings_rounded,
                  color: CColors.whiteColor,
                  size: 60,
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
