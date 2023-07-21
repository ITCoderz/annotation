import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../utils/colors/app_colors.dart';
import '../utils/text_styles/text_styles.dart';

class CustomDropDown extends StatelessWidget {
  final Function(String?)? onChanged;
  final List mappingList;
  final String hintText;
  final double? height, width;
  final bool isDark;

  const CustomDropDown(
      {super.key,
      this.height,
      this.width,
      required this.isDark,
      required this.onChanged,
      required this.hintText,
      required this.mappingList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: DropdownButtonFormField2(
        alignment: Alignment.center,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 45,
            horizontal: 15,
          ),
          filled: true,
          fillColor: isDark
              ? CColors.fontColorBrightBackground
              : CColors.buttonBrightBackground,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
        ),
        isExpanded: true,
        hint: Text(
          hintText,
          style: isDark
              ? CustomTextStyles.buttonDark950
              : CustomTextStyles.white950,
          textAlign: TextAlign.center,
        ),
        items: mappingList
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  alignment: Alignment.center,
                  child: Text(
                    item,
                    style: isDark
                        ? CustomTextStyles.buttonDark950
                        : CustomTextStyles.white950,
                    textAlign: TextAlign.center,
                  ),
                ))
            .toList(),
        isDense: true,
        menuItemStyleData: const MenuItemStyleData(),
        validator: (value) {
          return null;
        },
        onChanged: onChanged,
        buttonStyleData: const ButtonStyleData(
          height: 60,
        ),
        iconStyleData: const IconStyleData(iconSize: 0),
        dropdownStyleData: DropdownStyleData(
          offset: const Offset(0, -10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isDark
                  ? CColors.fontColorBrightBackground
                  : CColors.topLefBrightButtonBackground),
        ),
      ),
    );
  }
}
