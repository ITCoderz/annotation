import 'package:annotation/utils/alignment/widget_alignment.dart';
import 'package:annotation/utils/constants/constant_lists.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../../reusable_widgets/buttons/back_button.dart';
import '../../../reusable_widgets/option_widget/option_grid_widget.dart';
import '../../../utils/text_styles/text_styles.dart';
import '../controller/baby_incubator_controller.dart';

class BabyIncubatorStateScreen extends StatelessWidget {
  final String cameraId, babyId, nurseId;

  const BabyIncubatorStateScreen({
    super.key,
    required this.cameraId,
    required this.babyId,
    required this.nurseId,
  });

  @override
  Widget build(BuildContext context) {
    final babyIncubatorController = Get.find<BabyIncubatorStateController>();
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
                  babyIncubatorController.isNightTime.value
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
                  height: context.height * 0.71,
                  width: context.width * 0.73,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        40.ph,
                        Text(
                          "Bent van a csecsemo az inkubatorban?",
                          style: babyIncubatorController.isNightTime.value
                              ? CustomTextStyles.fontBright970
                              : CustomTextStyles.fontDark970,
                          textAlign: TextAlign.center,
                        ),
                        60.ph,
                        SizedBox(
                          height: 320,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: GridOptionTile(
                                  optionImage: ConstantLists
                                      .babyIncubatorStateList[0]
                                      .incubatorStateImage,
                                  optionTitle: ConstantLists
                                      .babyIncubatorStateList[0]
                                      .incubatorStateTitle,
                                  onTapFunction: () {
                                    babyIncubatorController
                                        .setBabyIncubatorStateId(
                                      babyIncubatorStateId: ConstantLists
                                          .babyIncubatorStateList[0]
                                          .incubatorStateCode,
                                      babyId: babyId,
                                      cameraId: cameraId,
                                      nurseId: nurseId,
                                    );
                                  },
                                  isDark:
                                      babyIncubatorController.isNightTime.value,
                                ),
                              ),
                              70.pw,
                              Expanded(
                                child: GridOptionTile(
                                  optionImage: ConstantLists
                                      .babyIncubatorStateList[1]
                                      .incubatorStateImage,
                                  optionTitle: ConstantLists
                                      .babyIncubatorStateList[1]
                                      .incubatorStateTitle,
                                  onTapFunction: () {
                                    babyIncubatorController
                                        .setBabyIncubatorStateId(
                                      babyIncubatorStateId: ConstantLists
                                          .babyIncubatorStateList[1]
                                          .incubatorStateCode,
                                      babyId: babyId,
                                      cameraId: cameraId,
                                      nurseId: nurseId,
                                    );
                                  },
                                  isDark:
                                      babyIncubatorController.isNightTime.value,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ).alignWidget(
                  alignment: Alignment.topCenter,
                ),
                BackContainerButton(
                  isDark: babyIncubatorController.isNightTime.value,
                ).alignWidget(alignment: Alignment.topLeft),
              ],
            ),
          );
        }),
      ),
    );
  }
}
