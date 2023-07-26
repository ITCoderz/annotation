import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../services/app_services/app_services.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/constants/constant_strings.dart';
import '../../baby_incubator_state/view/baby_incubator_state_screen.dart';

class SelectionController extends GetxController {
  late SharedPreferences prefs;
  GlobalKey<FormState> babyFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> nurseFormKey = GlobalKey<FormState>();

  TextEditingController babyIdTextController = TextEditingController();
  TextEditingController nurseIdTextController = TextEditingController();

  ///
  final initialCameraIdValue = Rxn<String>();
  final initialBabyIdValue = Rxn<String>();
  final initialNurseIdValue = Rxn<String>();

  ///
  TextEditingController cameraIdTextController = TextEditingController();
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
    if (prefs.getString(ConstantStrings.initialCameraIdValue) != null) {
      initialCameraIdValue.value =
          prefs.getString(ConstantStrings.initialCameraIdValue);
      cameraIdTextController.text = initialCameraIdValue.value!;
      cameraId = cameraIdTextController.text;
    }
    if (prefs.getString(ConstantStrings.initialBabyIdValue) != null) {
      initialBabyIdValue.value =
          prefs.getString(ConstantStrings.initialBabyIdValue);
      babyId = initialBabyIdValue.value!;
    }
    if (prefs.getString(ConstantStrings.initialNurseIdValue) != null) {
      initialNurseIdValue.value =
          prefs.getString(ConstantStrings.initialNurseIdValue);
      nurseId = initialNurseIdValue.value!;
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

  assignCameraId({required String cameraId}) async {
    cameraIdTextController.text = cameraId;
    this.cameraId = cameraIdTextController.text;
  }

  assignBabyId({required String id}) {
    babyId = id;
  }

  assignNurseId({required String id}) {
    nurseId = id;
  }

  navigateValidator() async {
    if (cameraId == "" || babyId == "" || nurseId == "") {
    } else {
      bool networkStatus = await AppServices.internetConnectivity();
      if (networkStatus) {
        prefs.setString(ConstantStrings.initialCameraIdValue, cameraId);
        prefs.setString(ConstantStrings.initialBabyIdValue, babyId);
        prefs.setString(ConstantStrings.initialNurseIdValue, nurseId);

        Get.to(
          () => BabyIncubatorStateScreen(
            cameraId: cameraId,
            babyId: babyId,
            nurseId: nurseId,
          ),
          transition: Transition.fadeIn,
        );
      } else {
        Get.snackbar(
          "nem sikerült",
          "Nincs internetkapcsolat.",
          colorText: CColors.whiteColor,
          backgroundColor: Colors.red,
        );
      }
    }
  }

  getThemeValue() async {
    isNightTime.value = await AppServices.isNightTime();
  }
}
