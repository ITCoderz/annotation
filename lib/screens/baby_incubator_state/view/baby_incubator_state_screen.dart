import 'package:annotation/screens/whats_happeing/view/whats_happeining_screen.dart';
import 'package:annotation/utils/alignment/widget_alignment.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../../reusable_widgets/buttons/back_button.dart';
import '../../../reusable_widgets/option_widget/option_grid_widget.dart';
import '../../../utils/text_styles/text_styles.dart';

class BabyIncubatorStateScreen extends StatelessWidget {
  const BabyIncubatorStateScreen({super.key});

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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      40.ph,
                      const Text(
                        "Bent van a csecsemo az inkubatorban?",
                        style: CustomTextStyles.fontBright970,
                        textAlign: TextAlign.center,
                      ),
                      40.ph,
                      SizedBox(
                        height: 320,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: GridOptionTile(
                                optionImage: Assets
                                    .incubatorImagesBabyInsideIncubatorWhite,
                                optionTitle: "Igen",
                                onTapFunction: () {
                                  Get.to(
                                    () => const WhatsHappeningScreen(),
                                    transition: Transition.fadeIn,
                                  );
                                },
                              ),
                            ),
                            70.pw,
                            Expanded(
                              child: GridOptionTile(
                                optionImage: Assets
                                    .incubatorImagesBabyOutsideIncubarWhite,
                                optionTitle: "Nem",
                                onTapFunction: () {
                                  Get.to(
                                    () => const WhatsHappeningScreen(),
                                    transition: Transition.fadeIn,
                                  );
                                },
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
              const BackContainerButton()
                  .alignWidget(alignment: Alignment.topLeft),
            ],
          ),
        ),
      ),
    );
  }
}
