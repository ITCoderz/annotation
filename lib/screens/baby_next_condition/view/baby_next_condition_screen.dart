import 'package:annotation/screens/baby_next_condition/controller/baby_next_condition_controller.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../../reusable_widgets/buttons/back_button.dart';
import '../../../../reusable_widgets/option_widget/option_grid_widget.dart';
import '../../../../utils/text_styles/text_styles.dart';
import '../../../reusable_widgets/buttons/border_button.dart';
import '../../../utils/constants/constant_lists.dart';
import '../../successful_annotation/view/annotation_successful_screen.dart';

class BabyNextConditionScreen extends StatelessWidget {
  final String cameraId,
      babyId,
      nurseId,
      babyIncubatorStateId,
      whatsHappeningId;

  const BabyNextConditionScreen({
    super.key,
    required this.cameraId,
    required this.babyId,
    required this.nurseId,
    required this.babyIncubatorStateId,
    required this.whatsHappeningId,
  });

  @override
  Widget build(BuildContext context) {
    final babyNextConditionController = Get.find<BabyNextConditionController>();
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Container(
            height: context.height * 1,
            width: context.width * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  babyNextConditionController.isNightTime.value
                      ? Assets.babyNextConditionBabyNextConditionDarkBackground
                      : Assets.incubatorStateBabyNextConditionLightBackgound,
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackContainerButton(
                      needSpaceFromLeft: false,
                      needSpaceFromTop: false,
                      isDark: babyNextConditionController.isNightTime.value,
                    ),
                    Expanded(
                      child: Text(
                        "Az utobbi percben a csecsemo",
                        style: babyNextConditionController.isNightTime.value
                            ? CustomTextStyles.fontBright970
                            : CustomTextStyles.fontDark970,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(
                      30,
                      30,
                      30,
                      40,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Milyen Viselkedesi Allapotban Volt?",
                            style: babyNextConditionController.isNightTime.value
                                ? CustomTextStyles.fontBright640
                                : CustomTextStyles.fontDark640,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 190,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (int index = 0;
                                    index <
                                        ConstantLists.babyBehaviourList.length;
                                    index++) ...[
                                  Expanded(
                                    child: GridOptionBabyConditionTile(
                                      optionImage: ConstantLists
                                          .babyBehaviourList[index]
                                          .behaviourImage,
                                      optionTitle: ConstantLists
                                          .babyBehaviourList[index]
                                          .behaviourTitle,
                                      onTapFunction: () {},
                                      height: 150,
                                      isDark: babyNextConditionController
                                          .isNightTime.value,
                                    ),
                                  ),
                                  index ==
                                          ConstantLists.babyBehaviourList.length
                                      ? const SizedBox.shrink()
                                      : 8.pw,
                                ],
                              ],
                            ),
                          ),
                          20.ph,
                          Text(
                            "Hangja?",
                            style: babyNextConditionController.isNightTime.value
                                ? CustomTextStyles.fontBright640
                                : CustomTextStyles.fontDark640,
                            textAlign: TextAlign.center,
                          ),
                          20.ph,
                          SizedBox(
                            height: 180,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (int index = 0;
                                    index < ConstantLists.babyVoiceList.length;
                                    index++) ...[
                                  Expanded(
                                    child: GridOptionBabyConditionTile(
                                      optionImage: ConstantLists
                                          .babyVoiceList[index].voiceImage,
                                      optionTitle: ConstantLists
                                          .babyVoiceList[index].voiceTitle,
                                      onTapFunction: () {},
                                      height: 150,
                                      width: 160,
                                      isDark: babyNextConditionController
                                          .isNightTime.value,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          20.ph,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Mije Mozgott?",
                                    style: babyNextConditionController
                                            .isNightTime.value
                                        ? CustomTextStyles.fontBright640
                                        : CustomTextStyles.fontDark640,
                                    textAlign: TextAlign.center,
                                  ),
                                  20.ph,
                                  SizedBox(
                                    height: 180,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        for (int index = 0;
                                            index <
                                                ConstantLists
                                                    .movementInList.length;
                                            index++) ...[
                                          GridOptionBabyConditionTile(
                                            optionImage: ConstantLists
                                                .movementInList[index]
                                                .movementInImage,
                                            optionTitle: ConstantLists
                                                .movementInList[index]
                                                .movementInTitle,
                                            onTapFunction: () {},
                                            height: 150,
                                            isDark: babyNextConditionController
                                                .isNightTime.value,
                                          ),
                                          index ==
                                                  ConstantLists
                                                      .movementInList.length
                                              ? const SizedBox.shrink()
                                              : 20.pw,
                                        ],
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Legzese?",
                                    style: babyNextConditionController
                                            .isNightTime.value
                                        ? CustomTextStyles.fontBright640
                                        : CustomTextStyles.fontDark640,
                                    textAlign: TextAlign.center,
                                  ),
                                  20.ph,
                                  SizedBox(
                                    height: 180,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        for (int index = 0;
                                            index <
                                                ConstantLists
                                                    .breathingList.length;
                                            index++) ...[
                                          GridOptionBabyConditionTile(
                                            optionImage: ConstantLists
                                                .breathingList[index]
                                                .breathingImage,
                                            optionTitle: ConstantLists
                                                .breathingList[index]
                                                .breathingTitle,
                                            onTapFunction: () {},
                                            height: 150,
                                            isDark: babyNextConditionController
                                                .isNightTime.value,
                                          ),
                                          index ==
                                                  ConstantLists
                                                      .breathingList.length
                                              ? const SizedBox.shrink()
                                              : 20.pw,
                                        ],
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          20.ph,
                          SizedBox(
                            height: 230,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Szeme?",
                                        style: babyNextConditionController
                                                .isNightTime.value
                                            ? CustomTextStyles.fontBright640
                                            : CustomTextStyles.fontDark640,
                                        textAlign: TextAlign.center,
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            for (int index = 0;
                                                index <
                                                    ConstantLists
                                                        .eyeList.length;
                                                index++) ...[
                                              Expanded(
                                                child:
                                                    GridOptionBabyConditionTile(
                                                  optionImage: ConstantLists
                                                      .eyeList[index].eyeImage,
                                                  optionTitle: ConstantLists
                                                      .eyeList[index].eyeTitle,
                                                  onTapFunction: () {},
                                                  height: 150,
                                                  isDark:
                                                      babyNextConditionController
                                                          .isNightTime.value,
                                                ),
                                              ),
                                              index ==
                                                      ConstantLists
                                                          .eyeList.length
                                                  ? const SizedBox.shrink()
                                                  : 5.pw,
                                            ],
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                30.pw,
                                Expanded(
                                  child: CustomBorderedElevatedButton(
                                    onPressedFunction: () {
                                      Get.offAll(
                                        () => const AnnotationSuccessfulScreen(),
                                        transition: Transition.fadeIn,
                                      );
                                    },
                                    buttonText: "Mentis",
                                    width: 350,
                                    height: 150,
                                    isDark: babyNextConditionController
                                        .isNightTime.value,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
