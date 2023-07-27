import 'package:annotation/reusable_widgets/custom_alert_dialog/custom_delete_id_alert_dialog.dart';
import 'package:annotation/reusable_widgets/custom_alert_dialog/custom_selection_dialog.dart';
import 'package:annotation/reusable_widgets/custom_text_field.dart';
import 'package:annotation/utils/alignment/widget_alignment.dart';
import 'package:annotation/utils/constants/constant_lists.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../../reusable_widgets/buttons/border_button.dart';
import '../../../reusable_widgets/custom_alert_dialog/custom_enter_id_alert_dialog.dart';
import '../../../reusable_widgets/custom_dropdown.dart';
import '../../../reusable_widgets/settings_menu.dart';
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
                  height: context.height * 0.73,
                  width: context.width * 0.73,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        30.ph,
                        Text(
                          "Kérem válassza ki",
                          style: selectionController.isNightTime.value
                              ? CustomTextStyles.fontBright860
                              : CustomTextStyles.fontDark860,
                          textAlign: TextAlign.center,
                        ),
                        30.ph,
                        Text(
                          "A kamera azonosítót",
                          style: selectionController.isNightTime.value
                              ? CustomTextStyles.fontBright640
                              : CustomTextStyles.fontDark640,
                          textAlign: TextAlign.center,
                        ),
                        15.ph,
                        IntrinsicWidth(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: 180,
                            ),
                            child: GetBuilder(
                                init: SelectionController(),
                                builder: (controller) {
                                  return SelectionTextField(
                                    isDark:
                                        selectionController.isNightTime.value,
                                    textEditingController:
                                        controller.cameraIdTextController,
                                    hintText: "...",
                                  );
                                }),
                          ),
                        ),
                        15.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int index = 0;
                                index < ConstantLists.cameraIdList.length;
                                index++) ...[
                              InkWell(
                                onTap: () {
                                  selectionController.assignCameraId(
                                    cameraId: ConstantLists
                                        .cameraIdList[index].cameraCode,
                                  );
                                },
                                child: Image.asset(
                                  ConstantLists.cameraIdList[index].cameraImage,
                                  height: 90,
                                ),
                              ),
                            ]
                          ],
                        ),
                        15.ph,
                        Text(
                          "A Csecsemo azonosítót",
                          style: selectionController.isNightTime.value
                              ? CustomTextStyles.fontBright640
                              : CustomTextStyles.fontDark640,
                          textAlign: TextAlign.center,
                        ),
                        15.ph,
                        IntrinsicWidth(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: 180,
                            ),
                            child: GetBuilder(
                              init: SelectionController(),
                              builder: (controller) {
                                return CustomDropDown(
                                  onChanged: (val) {
                                    controller.assignBabyId(id: val!);
                                  },
                                  hintText: "...",
                                  initialValue: controller.initialBabyIdValue,
                                  mappingList: controller.babyIdList,
                                  isDark: selectionController.isNightTime.value,
                                );
                              },
                            ),
                          ),
                        ),
                        15.ph,
                        Text(
                          "Az ápoló azonosítót",
                          style: selectionController.isNightTime.value
                              ? CustomTextStyles.fontBright640
                              : CustomTextStyles.fontDark640,
                          textAlign: TextAlign.center,
                        ),
                        15.ph,
                        IntrinsicWidth(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              minWidth: 180,
                            ),
                            child: GetBuilder(
                                init: SelectionController(),
                                builder: (controller) {
                                  return CustomDropDown(
                                    onChanged: (val) {
                                      controller.assignNurseId(id: val!);
                                    },
                                    hintText: "...",
                                    initialValue:
                                        controller.initialNurseIdValue,
                                    mappingList: controller.nurseIdList,
                                    isDark:
                                        selectionController.isNightTime.value,
                                  );
                                }),
                          ),
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
                      buttonText: "Tovább",
                      height: 100,
                      isDark: selectionController.isNightTime.value,
                    ),
                    50.ph,
                  ],
                ).alignWidget(
                  alignment: Alignment.bottomCenter,
                ),
                Obx(() {
                  return SettingsMenu(
                    isDark: selectionController.isNightTime.value,
                    addIdsFunction: () {
                      Future.delayed(
                        const Duration(
                          seconds: 0,
                        ),
                        () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomSelectionDialog(
                              isDark: selectionController.isNightTime.value,
                              selectionOneString: "add hozzá babaazonosítót",
                              selectionSecondString:
                                  "add hozzá a nővér azonosítóját",
                              babyFunction: () {
                                Get.back();
                                Future.delayed(
                                  const Duration(
                                    seconds: 0,
                                  ),
                                  () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          CustomEnterIdAlertDialog(
                                        formKey:
                                            selectionController.babyFormKey,
                                        isDark: selectionController
                                            .isNightTime.value,
                                        textEditingController:
                                            selectionController
                                                .babyIdTextController,
                                        saveFunction: () {
                                          selectionController
                                              .saveBabyIdInStorage();
                                        },
                                        validatorFunction: (val) {
                                          if (val!.isNotEmpty) {
                                            return null;
                                          } else {
                                            return "Kérjük, írjon be egy szöveget";
                                          }
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              nurseFunction: () {
                                Get.back();
                                Future.delayed(
                                  const Duration(
                                    seconds: 0,
                                  ),
                                  () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          CustomEnterIdAlertDialog(
                                        formKey:
                                            selectionController.nurseFormKey,
                                        isDark: selectionController
                                            .isNightTime.value,
                                        textEditingController:
                                            selectionController
                                                .nurseIdTextController,
                                        saveFunction: () {
                                          selectionController
                                              .saveNurseIdInStorage();
                                        },
                                        validatorFunction: (val) {
                                          if (val!.isNotEmpty) {
                                            return null;
                                          } else {
                                            return "Kérjük, írjon be egy szöveget";
                                          }
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    removeFromExistingIdsFunction: () {
                      Future.delayed(
                        const Duration(
                          seconds: 0,
                        ),
                        () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomSelectionDialog(
                              isDark: selectionController.isNightTime.value,
                              selectionOneString: "örölje a baba azonosítóját",
                              selectionSecondString:
                                  "törölje a nővér azonosítóját",
                              babyFunction: () {
                                Get.back();
                                Future.delayed(
                                  const Duration(
                                    seconds: 0,
                                  ),
                                  () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          CustomDeleteIdAlertDialog(
                                        isDark: selectionController
                                            .isNightTime.value,
                                        isForBabyDeletion: true,
                                        idList: selectionController.babyIdList,
                                      ),
                                    );
                                  },
                                );
                              },
                              nurseFunction: () {
                                Get.back();
                                Future.delayed(
                                  const Duration(
                                    seconds: 0,
                                  ),
                                  () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          CustomDeleteIdAlertDialog(
                                        isDark: selectionController
                                            .isNightTime.value,
                                        isForBabyDeletion: false,
                                        idList: selectionController.nurseIdList,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                }).alignWidget(
                  alignment: Alignment.topRight,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
