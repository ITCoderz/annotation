import 'package:annotation/utils/alignment/widget_alignment.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../../reusable_widgets/buttons/back_button.dart';
import '../../../reusable_widgets/option_widget/option_grid_widget.dart';
import '../../../utils/text_styles/text_styles.dart';
import '../../baby_next_condition/baby_next_condition_screen.dart';

class WhatsHappeningScreen extends StatelessWidget {
  const WhatsHappeningScreen({super.key});

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
                Assets.whatsHappeningImagesWhatsHappeningDarkBackground,
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
                    const Text(
                      "Mi tortenik",
                      style: CustomTextStyles.fontBright970,
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
                              optionImage:
                                  Assets.whatsHappeningImagesPainlessWhite,
                              optionTitle: "Noninvaziv Apolas",
                              onTapFunction: () {
                                Get.to(
                                  () => const BabyNextConditionScreen(),
                                  transition: Transition.fadeIn,
                                );
                              },
                              isWhatsHappeningScreen: true,
                            ),
                          ),
                          70.pw,
                          Expanded(
                            child: GridOptionTile(
                              optionImage:
                                  Assets.whatsHappeningImagesPainfullWhite,
                              optionTitle: "Invaziv Apolas",
                              onTapFunction: () {
                                Get.to(
                                  () => const BabyNextConditionScreen(),
                                  transition: Transition.fadeIn,
                                );
                              },
                              isWhatsHappeningScreen: true,
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
                          optionImage:
                              Assets.whatsHappeningImagesNoneOfThemWhite,
                          optionTitle: "Egyik SEM",
                          onTapFunction: () {},
                          isWhatsHappeningScreen: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ).alignWidget(
                alignment: Alignment.topCenter,
              ),
              const BackContainerButton()
                  .alignWidget(alignment: Alignment.topLeft),
            ],
          ),
        ),
      ),
    );
  }
}
