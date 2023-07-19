import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/app_services/app_services.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/constants/constant_strings.dart';
import '../../baby_incubator_state/view/baby_incubator_state_screen.dart';

class SelectionController extends GetxController {
  late SharedPreferences prefs;
  GlobalKey<FormState> cameraFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> babyFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> nurseFormKey = GlobalKey<FormState>();
  TextEditingController cameraIdTextController = TextEditingController();
  TextEditingController babyIdTextController = TextEditingController();
  TextEditingController nurseIdTextController = TextEditingController();

  ///
  RxList<String> cameraIdList = <String>[].obs;
  RxList<String> babyIdList = <String>[].obs;
  RxList<String> nurseIdList = <String>[].obs;

  ///
  final isNightTime = false.obs;
  String cameraId = "";
  String babyId = "";
  String nurseId = "";

  @override
  onInit() async {
    initializePref();
    getThemeValue();
    super.onInit();
  }

  initializePref() async {
    prefs = await SharedPreferences.getInstance();
    cameraIdList.value =
        (prefs.getStringList(ConstantStrings.cameraIdList) ?? []);
    babyIdList.value = (prefs.getStringList(ConstantStrings.babyIdList) ?? []);
    nurseIdList.value =
        (prefs.getStringList(ConstantStrings.nurseIdList) ?? []);
  }

  saveCameraIdInStorage() async {
    if (cameraFormKey.currentState!.validate()) {
      List<String> tempList =
          (prefs.getStringList(ConstantStrings.cameraIdList) ?? []);
      if (tempList.contains(cameraIdTextController.text)) {
        Get.snackbar(
          "nem sikerült",
          "Az azonosító már létezik, kérjük, adjon meg másik azonosítót",
          backgroundColor: CColors.whiteColor,
        );
      } else {
        tempList.add(cameraIdTextController.text);

        await prefs.setStringList(ConstantStrings.cameraIdList, tempList);
        cameraIdList.value =
            (prefs.getStringList(ConstantStrings.cameraIdList) ?? []);
        cameraIdTextController.clear();
        Get.back();
      }
    }
  }

  saveBabyIdInStorage() async {
    if (babyFormKey.currentState!.validate()) {
      List<String> tempList =
          (prefs.getStringList(ConstantStrings.babyIdList) ?? []);
      if (tempList.contains(babyIdTextController.text)) {
        Get.snackbar(
          "nem sikerült",
          "Az azonosító már létezik, kérjük, adjon meg másik azonosítót",
          backgroundColor: CColors.whiteColor,
        );
      } else {
        tempList.add(babyIdTextController.text);

        await prefs.setStringList(ConstantStrings.babyIdList, tempList);
        babyIdList.value =
            (prefs.getStringList(ConstantStrings.babyIdList) ?? []);
        babyIdTextController.clear();
        Get.back();
      }
    }
  }

  saveNurseIdInStorage() async {
    if (nurseFormKey.currentState!.validate()) {
      List<String> tempList =
          (prefs.getStringList(ConstantStrings.nurseIdList) ?? []);
      if (tempList.contains(nurseIdTextController.text)) {
        Get.snackbar(
          "nem sikerült",
          "Az azonosító már létezik, kérjük, adjon meg másik azonosítót",
          backgroundColor: CColors.whiteColor,
        );
      } else {
        tempList.add(nurseIdTextController.text);

        await prefs.setStringList(ConstantStrings.nurseIdList, tempList);
        nurseIdList.value =
            (prefs.getStringList(ConstantStrings.nurseIdList) ?? []);
        nurseIdTextController.clear();
        Get.back();
      }
    }
  }

  assignCameraId({required String id}) {
    cameraId = id;
  }

  assignBabyId({required String id}) {
    babyId = id;
  }

  assignNurseId({required String id}) {
    nurseId = id;
  }

  navigateValidator() {
    if (cameraId == "" || babyId == "" || nurseId == "") {
    } else {
      Get.to(
        () => BabyIncubatorStateScreen(
          cameraId: cameraId,
          babyId: babyId,
          nurseId: nurseId,
        ),
        transition: Transition.fadeIn,
      );
    }
  }

  getThemeValue() async {
    isNightTime.value = await AppServices.isNightTime();
  }
}
