import 'package:annotation/utils/alignment/widget_alignment.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../../reusable_widgets/buttons/border_button.dart';
import '../../../reusable_widgets/custom_dropdown.dart';
import '../../../utils/text_styles/text_styles.dart';
import '../controller/selection_controller.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectionController = Get.find<SelectionController>();
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Container(
            height: context.height * 1,
            width: context.width * 1,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  selectionController.isNightTime.value
                      ? Assets
                          .selectionScreenDarkImagesSelectionDarkBackgroundImage
                      : Assets.selectionScreenSelectionLightModeBackground,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 18,
                  ),
                  height: context.height * 0.71,
                  width: context.width * 0.73,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        30.ph,
                        Text(
                          "Kerem Valassza Ki",
                          style: selectionController.isNightTime.value
                              ? CustomTextStyles.fontBright860
                              : CustomTextStyles.fontDark860,
                          textAlign: TextAlign.center,
                        ),
                        30.ph,
                        Text(
                          "A Camera Azonositot",
                          style: selectionController.isNightTime.value
                              ? CustomTextStyles.fontBright640
                              : CustomTextStyles.fontDark640,
                          textAlign: TextAlign.center,
                        ),
                        20.ph,
                        CustomDropDown(
                          width: 180,
                          onChanged: (val) {
                            selectionController.assignCameraId(id: val!);
                          },
                          hintText: "...",
                          mappingList: const [
                            "3.11",
                            "3.12",
                            "3.13",
                            "3.14",
                            "3.15",
                            "3.16",
                          ],
                          isDark: selectionController.isNightTime.value,
                        ),
                        20.ph,
                        Text(
                          "A Csecsemo Azonositot",
                          style: selectionController.isNightTime.value
                              ? CustomTextStyles.fontBright640
                              : CustomTextStyles.fontDark640,
                          textAlign: TextAlign.center,
                        ),
                        20.ph,
                        CustomDropDown(
                          width: 180,
                          onChanged: (val) {
                            selectionController.assignBabyId(id: val!);
                          },
                          hintText: "...",
                          mappingList: const [
                            "3.21",
                            "3.22",
                            "3.23",
                            "3.24",
                            "3.25",
                            "3.26",
                          ],
                          isDark: selectionController.isNightTime.value,
                        ),
                        20.ph,
                        Text(
                          "Az Apolo Azonositot",
                          style: selectionController.isNightTime.value
                              ? CustomTextStyles.fontBright640
                              : CustomTextStyles.fontDark640,
                          textAlign: TextAlign.center,
                        ),
                        20.ph,
                        CustomDropDown(
                          width: 180,
                          onChanged: (val) {
                            selectionController.assignNurseId(id: val!);
                          },
                          hintText: "...",
                          mappingList: const [
                            "3.31",
                            "3.32",
                            "3.33",
                            "3.34",
                            "3.35",
                            "3.36",
                          ],
                          isDark: selectionController.isNightTime.value,
                        ),
                      ],
                    ),
                  ),
                ).alignWidget(
                  alignment: Alignment.topCenter,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomBorderedElevatedButton(
                      width: context.width * 0.6,
                      onPressedFunction: () {
                        selectionController.navigateValidator();
                      },
                      buttonText: "Tovabb",
                      height: 100,
                      isDark: selectionController.isNightTime.value,
                    ),
                    50.ph,
                  ],
                ).alignWidget(
                  alignment: Alignment.bottomCenter,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
