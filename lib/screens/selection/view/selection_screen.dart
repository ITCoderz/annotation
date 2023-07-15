import 'package:annotation/utils/alignment/widget_alignment.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../../reusable_widgets/buttons/border_button.dart';
import '../../../utils/text_styles/text_styles.dart';
import '../../baby_incubator_state/view/baby_incubator_state_screen.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height * 1,
          width: context.width * 1,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.selectionScreenDarkImagesSelectionDarkBackgroundImage,
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
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Kerem Valassza Ki",
                      style: CustomTextStyles.fontBright860,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "A Kamera Azonositot",
                      style: CustomTextStyles.fontBright640,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "A Csecsemo Azonositot",
                      style: CustomTextStyles.fontBright640,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Az Apolo Azonositot",
                      style: CustomTextStyles.fontBright640,
                      textAlign: TextAlign.center,
                    ),
                  ],
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
                      Get.to(
                        () => const BabyIncubatorStateScreen(),
                        transition: Transition.fadeIn,
                      );
                    },
                    buttonText: "Tovabb",
                    height: 100,
                  ),
                  50.ph,
                ],
              ).alignWidget(
                alignment: Alignment.bottomCenter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
