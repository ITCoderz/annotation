import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';
import '../buttons/border_button.dart';

class CustomDeleteIdAlertDialog extends StatelessWidget {
  final bool isDark, isForBabyDeletion;
  final List<String> idList;

  const CustomDeleteIdAlertDialog({
    super.key,
    required this.isDark,
    required this.isForBabyDeletion,
    required this.idList,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: false,
      alignment: Alignment.center,
      backgroundColor: isDark
          ? CColors.buttonDarkBackground
          : CColors.topLefBrightButtonBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isForBabyDeletion
                  ? "Babaazonosító lista"
                  : "Nővér azonosító lista",
              style: isDark
                  ? CustomTextStyles.buttonLight950
                  : CustomTextStyles.buttonDark950,
              textAlign: TextAlign.center,
            ),
            30.ph,
            idList.isNotEmpty
                ? SizedBox(
                  height: 500,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shrinkWrap: true,
                    itemCount: idList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        10.ph,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          'item $index',
                          style: isDark
                              ? CustomTextStyles.fontBright630
                              : CustomTextStyles.fontDark630,
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: isDark
                                ? CColors.fontColorBrightBackground
                                : CColors.fontColorDarkBackground,
                            size: 40,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  CustomConfirmationDialog(
                                isDark: isDark,
                                positiveConfirmationFunction: () {},
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
                : Text(
                    "Nem található azonosító",
                    style: isDark
                        ? CustomTextStyles.fontBright860
                        : CustomTextStyles.fontDark860,
                    textAlign: TextAlign.center,
                  ),
            30.ph,
            CustomBorderedElevatedButton(
              onPressedFunction: () {
                Get.back();
              },
              buttonText: "Kész",
              width: context.width * 0.5,
              height: 100,
              isDark: isDark,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomConfirmationDialog extends StatelessWidget {
  final bool isDark;
  final Function()? positiveConfirmationFunction;

  const CustomConfirmationDialog({
    super.key,
    required this.isDark,
    required this.positiveConfirmationFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: false,
      alignment: Alignment.center,
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
          Text(
            "Biztos, hogy törölni szeretné ezt az azonosítót?",
            style: isDark
                ? CustomTextStyles.buttonLight950
                : CustomTextStyles.buttonDark950,
            textAlign: TextAlign.center,
          ),
          50.ph,
          Row(
            children: [
              Expanded(
                child: CustomBorderedElevatedButton(
                  onPressedFunction: () {
                    Get.back();
                  },
                  buttonText: "Nem",
                  width: context.width * 0.5,
                  height: 100,
                  isDark: isDark,
                ),
              ),
              30.pw,
              Expanded(
                child: CustomBorderedElevatedButton(
                  onPressedFunction: positiveConfirmationFunction,
                  buttonText: "Igen",
                  width: context.width * 0.5,
                  height: 100,
                  isDark: isDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
