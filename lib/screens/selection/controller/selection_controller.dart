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
  String? initialCameraIdValue;
  String? initialBabyIdValue;

  String? initialNurseIdValue;

  ///
  TextEditingController cameraIdTextController = TextEditingController();
  List<String> babyIdList = <String>[];
  List<String> nurseIdList = <String>[];

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

//Initialize Shared Preference
  initializePref() async {
    prefs = await SharedPreferences.getInstance();
    babyIdList = (prefs.getStringList(ConstantStrings.babyIdList) ?? []);
    nurseIdList = (prefs.getStringList(ConstantStrings.nurseIdList) ?? []);
    if (prefs.getString(ConstantStrings.initialCameraIdValue) != null) {
      initialCameraIdValue =
          prefs.getString(ConstantStrings.initialCameraIdValue);
      cameraIdTextController.text = initialCameraIdValue!;
      cameraId = cameraIdTextController.text;
    }
    if (prefs.getString(ConstantStrings.initialBabyIdValue) != null) {
      initialBabyIdValue = prefs.getString(ConstantStrings.initialBabyIdValue);
      babyId = initialBabyIdValue!;
    }
    if (prefs.getString(ConstantStrings.initialNurseIdValue) != null) {
      initialNurseIdValue =
          prefs.getString(ConstantStrings.initialNurseIdValue);
      nurseId = initialNurseIdValue!;
    }
    update();
  }

  // Save Baby Id in Local Storage.
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
        babyIdList = (prefs.getStringList(ConstantStrings.babyIdList) ?? []);
        babyIdTextController.clear();
        Get.back();
      }
    }
    update();
  }

// Save Nurse Id in Local Storage.
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
        nurseIdList = (prefs.getStringList(ConstantStrings.nurseIdList) ?? []);
        nurseIdTextController.clear();
        Get.back();
      }
    }
    update();
  }

  // Deleting Baby Id from Storage
  deleteBabyId({required int index}) async {
    String tempId = babyIdList.elementAt(index);
    if (tempId == prefs.getString(ConstantStrings.initialBabyIdValue)) {
      prefs.remove(ConstantStrings.initialBabyIdValue);
      initialBabyIdValue = null;
      babyId = '';
    }
    babyIdList.removeAt(index);
    await prefs.setStringList(ConstantStrings.babyIdList, babyIdList);
    update();
    Get.back();
    Get.snackbar(
      "Siker!",
      "Az azonosító sikeresen törölve.",
      colorText: CColors.blackColor,
      backgroundColor: Colors.green,
    );
  }

  // Deleting Nurse Id from Storage
  deleteNurseId({required int index}) async {
    String tempId = nurseIdList.elementAt(index);
    if (tempId == prefs.getString(ConstantStrings.initialNurseIdValue)) {
      prefs.remove(ConstantStrings.initialNurseIdValue);
      initialNurseIdValue = null;
      nurseId = '';
    }
    nurseIdList.removeAt(index);
    await prefs.setStringList(ConstantStrings.nurseIdList, nurseIdList);
    update();
    Get.back();
    Get.snackbar(
      "Siker!",
      "Az azonosító sikeresen törölve.",
      colorText: CColors.blackColor,
      backgroundColor: Colors.green,
    );
  }

  // Choosing Values
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

//Validate the Entries, Connection and Navigate
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

  // Check Theme
  getThemeValue() async {
    isNightTime.value = await AppServices.isNightTime();
  }
}
