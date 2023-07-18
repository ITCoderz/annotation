import 'package:annotation/screens/successful_annotation/view/annotation_successful_screen.dart';
import 'package:annotation/screens/whats_happening/controller/whats_happening_controller.dart';
import 'package:annotation/utils/alignment/widget_alignment.dart';
import 'package:annotation/utils/constants/constant_lists.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../../models/app_code_models.dart';
import '../../../reusable_widgets/buttons/back_button.dart';
import '../../../reusable_widgets/buttons/send_button.dart';
import '../../../reusable_widgets/option_widget/option_grid_widget.dart';
import '../../../utils/text_styles/text_styles.dart';

class WhatsHappeningScreen extends StatelessWidget {
  final String cameraId, babyId, nurseId, babyIncubatorStateId;

  const WhatsHappeningScreen({
    super.key,
    required this.cameraId,
    required this.babyId,
    required this.nurseId,
    required this.babyIncubatorStateId,
  });

  @override
  Widget build(BuildContext context) {
    final whatsHappeningController = Get.find<WhatsHappeningController>();
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
                  whatsHappeningController.isNightTime.value
                      ? Assets.whatsHappeningImagesWhatsHappeningDarkBackground
                      : Assets
                          .whatsHappeningScreenWhatsHappeningLightBackground,
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
                  height: context.height * 0.82,
                  width: context.width * 0.73,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      80.ph,
                      Text(
                        "Mi tortenik",
                        style: whatsHappeningController.isNightTime.value
                            ? CustomTextStyles.fontBright970
                            : CustomTextStyles.fontDark970,
                        textAlign: TextAlign.center,
                      ),
                      50.ph,
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: GridOptionTile(
                                optionImage: ConstantLists
                                    .whatsHappeningList[0].whatsHappeningImage,
                                optionTitle: ConstantLists
                                    .whatsHappeningList[0].whatsHappeningTitle,
                                onTapFunction: () {
                                  whatsHappeningController
                                      .setWhatsHappeningStateIdAndNavigate(
                                    babyIncubatorStateId: babyIncubatorStateId,
                                    cameraId: cameraId,
                                    babyId: babyId,
                                    nurseId: nurseId,
                                    whatsHappeningId: ConstantLists
                                        .whatsHappeningList[0]
                                        .whatsHappeningCode,
                                  );
                                },
                                isWhatsHappeningScreen: true,
                                isDark:
                                    whatsHappeningController.isNightTime.value,
                              ),
                            ),
                            70.pw,
                            Expanded(
                              child: GridOptionTile(
                                optionImage: ConstantLists
                                    .whatsHappeningList[1].whatsHappeningImage,
                                optionTitle: ConstantLists
                                    .whatsHappeningList[1].whatsHappeningTitle,
                                onTapFunction: () {
                                  whatsHappeningController
                                      .setWhatsHappeningStateIdAndNavigate(
                                    babyIncubatorStateId: babyIncubatorStateId,
                                    cameraId: cameraId,
                                    babyId: babyId,
                                    nurseId: nurseId,
                                    whatsHappeningId: ConstantLists
                                        .whatsHappeningList[1]
                                        .whatsHappeningCode,
                                  );
                                },
                                isWhatsHappeningScreen: true,
                                isDark:
                                    whatsHappeningController.isNightTime.value,
                              ),
                            ),
                          ],
                        ),
                      ),
                      50.ph,
                      Expanded(
                        child: SizedBox(
                          width: 320,
                          child: GridOptionTile(
                            optionImage: ConstantLists
                                .whatsHappeningList[2].whatsHappeningImage,
                            optionTitle: ConstantLists
                                .whatsHappeningList[2].whatsHappeningTitle,
                            onTapFunction: () {
                              whatsHappeningController
                                  .setWhatsHappeningStateIdAndNavigate(
                                babyIncubatorStateId: babyIncubatorStateId,
                                cameraId: cameraId,
                                babyId: babyId,
                                nurseId: nurseId,
                                whatsHappeningId: ConstantLists
                                    .whatsHappeningList[2].whatsHappeningCode,
                              );
                            },
                            isWhatsHappeningScreen: true,
                            isDark: whatsHappeningController.isNightTime.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                ).alignWidget(
                  alignment: Alignment.topCenter,
                ),
                BackContainerButton(
                  isDark: whatsHappeningController.isNightTime.value,
                ).alignWidget(
                  alignment: Alignment.topLeft,
                ),
                SendButton(
                  isDark: whatsHappeningController.isNightTime.value,
                  onTapFunction: () {
                    Get.offAll(
                      () => AnnotationSuccessfulScreen(
                        isFiveOutput: true,
                        fifthOutputCodesModel: FifthOutputCodesModel(
                          cameraId: cameraId,
                          babyId: babyId,
                          nurseId: nurseId,
                          babyIncubatorStateId: babyIncubatorStateId,
                          whatsHappeningId: "5.0",
                        ),
                      ),
                      transition: Transition.fadeIn,
                    );
                  },
                ).alignWidget(
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
