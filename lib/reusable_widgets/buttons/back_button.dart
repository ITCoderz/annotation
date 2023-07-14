import 'package:annotation/utils/colors/app_colors.dart';
import 'package:annotation/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackContainerButton extends StatelessWidget {
  const BackContainerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        30.ph,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            20.pw,
            InkWell(
              borderRadius: BorderRadius.circular(
                10,
              ),
              onTap: () {
                Get.back();
              },
              child: Container(
                alignment: Alignment.center,
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: CColors.buttonDarkBackground,
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: CColors.fontColorBrightBackground,
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
