import 'package:annotation/utils/alignment/widget_alignment.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../../reusable_widgets/buttons/back_button.dart';
import '../../../reusable_widgets/option_widget/option_grid_widget.dart';
import '../../../utils/text_styles/text_styles.dart';

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
                height: context.height * 1,
                width: context.width * 0.73,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    50.ph,
                    const Text(
                      "Mi tortenik",
                      style: CustomTextStyles.fontBright970,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 320,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: GridOptionTile(
                              optionImage:
                                  Assets.whatsHappeingImagesPainlessWhite,
                              optionTitle: "Noninvaziv Apolas",
                              onTapFunction: () {},
                              isWhatsHappeningScreen: true,
                            ),
                          ),
                          70.pw,
                          Expanded(
                            child: GridOptionTile(
                              optionImage:
                                  Assets.whatsHappeingImagesPainfullWhite,
                              optionTitle: "Invaziv Apolas",
                              onTapFunction: () {},
                              isWhatsHappeningScreen: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    40.ph,
                    SizedBox(
                      height: 320,
                      width: 320,
                      child: GridOptionTile(
                        optionImage: Assets.whatsHappeingImagesNoneOfThemWhite,
                        optionTitle: "Egyik SEM",
                        onTapFunction: () {},
                        isWhatsHappeningScreen: true,
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
