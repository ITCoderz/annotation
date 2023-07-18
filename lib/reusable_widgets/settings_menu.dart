import 'package:annotation/utils/colors/app_colors.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:annotation/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class SettingsMenu extends StatelessWidget {
  final Offset offset;
  final Function()? addCameraIdFunction, addBabyIdFunction, addNurseIdFunction;
  final bool needSpaceFromRight, needSpaceFromTop, isDark;

  const SettingsMenu({
    Key? key,
    required this.addCameraIdFunction,
    required this.addBabyIdFunction,
    required this.addNurseIdFunction,
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
        needSpaceFromTop ? 30.ph : const SizedBox.shrink(),
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
                  onTap: addCameraIdFunction,
                  child: Text(
                    'kameraazonosító hozzáadása',
                    textAlign: TextAlign.center,
                    style: isDark
                        ? CustomTextStyles.bright530
                        : CustomTextStyles.fontDark530,
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 1,
                  onTap: addBabyIdFunction,
                  child: Text(
                    'add hozzá babaazonosítót',
                    textAlign: TextAlign.center,
                    style: isDark
                        ? CustomTextStyles.bright530
                        : CustomTextStyles.fontDark530,
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 3,
                  onTap: addNurseIdFunction,
                  child: Text(
                    'add hozzá a nővér azonosítóját',
                    textAlign: TextAlign.center,
                    style: isDark
                        ? CustomTextStyles.bright530
                        : CustomTextStyles.fontDark530,
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
