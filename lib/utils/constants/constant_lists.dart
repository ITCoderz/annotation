import '../../generated/assets.dart';
import '../../models/app_code_models.dart';

class ConstantLists {
  ConstantLists._();

  ///
  static List<BabyIncubatorStateModelModel> babyIncubatorStateList = [
    BabyIncubatorStateModelModel(
      incubatorStateImage: Assets.incubatorImagesBabyInsideIncubatorWhite,
      incubatorStateTitle: "Igen",
      incubatorStateCode: "4.1",
    ),
    BabyIncubatorStateModelModel(
      incubatorStateImage: Assets.incubatorImagesBabyOutsideIncubarWhite,
      incubatorStateTitle: "Nem",
      incubatorStateCode: "4.2",
    ),
  ];

  ///
  static List<WhatsHappeningModel> whatsHappeningList = [
    WhatsHappeningModel(
      whatsHappeningImage: Assets.whatsHappeningImagesPainlessWhite,
      whatsHappeningTitle: "Noninvazív ápolás",
      whatsHappeningCode: "5.1",
    ),
    WhatsHappeningModel(
      whatsHappeningImage: Assets.whatsHappeningImagesPainfullWhite,
      whatsHappeningTitle: "invazív ápolás",
      whatsHappeningCode: "5.2",
    ),
    WhatsHappeningModel(
      whatsHappeningImage: Assets.whatsHappeningImagesNoneOfThemWhite,
      whatsHappeningTitle: "egyik sem",
      whatsHappeningCode: "5.3",
    ),
  ];

  ///
  static List<BabyBehaviourModel> babyBehaviourList = [
    BabyBehaviourModel(
      behaviourImage: Assets.babyBehaviourQuietSleeperWhite,
      behaviourTitle: "csendes alvás",
      behaviourCode: "6.11",
    ),
    BabyBehaviourModel(
      behaviourImage: Assets.babyBehaviourActiveSleeperWhite,
      behaviourTitle: "aktív alvás",
      behaviourCode: "6.12",
    ),
    BabyBehaviourModel(
      behaviourImage: Assets.babyBehaviourTemporaryWhite,
      behaviourTitle: "átmeneti",
      behaviourCode: "6.13",
    ),
    BabyBehaviourModel(
      behaviourImage: Assets.babyBehaviourSilentRashWhite,
      behaviourTitle: "csendes ébrenlét",
      behaviourCode: "6.14",
    ),
    BabyBehaviourModel(
      behaviourImage: Assets.babyBehaviourActiveBruiseWhite,
      behaviourTitle: "aktív ébrenlét",
      behaviourCode: "6.15",
    ),
    BabyBehaviourModel(
      behaviourImage: Assets.babyBehaviourCryingWhite,
      behaviourTitle: "sírás",
      behaviourCode: "6.16",
    ),
  ];

  ///
  static List<BabyVoiceModel> babyVoiceList = [
    BabyVoiceModel(
      voiceImage: Assets.babyVoiceNoEyesWhite,
      voiceTitle: "nincs",
      voiceCode: "6.21",
    ),
    BabyVoiceModel(
      voiceImage: Assets.babyVoiceAllWhite,
      voiceTitle: "valamennyi",
      voiceCode: "6.22",
    ),
    BabyVoiceModel(
      voiceImage: Assets.babyVoiceCryingWhite,
      voiceTitle: "sír",
      voiceCode: "6.23",
    ),
  ];

  ///
  static List<MovementInModel> movementInList = [
    MovementInModel(
      movementInImage: Assets.movementInHandsWhite,
      movementInTitle: "karok",
      movementInCode: "6.31",
    ),
    MovementInModel(
      movementInImage: Assets.movementInLegsWhite,
      movementInTitle: "lábak",
      movementInCode: "6.32",
    ),
  ];

  ///
  static List<BreathingModelModel> breathingList = [
    BreathingModelModel(
      breathingImage: Assets.breathingRegularBreathingWhiteImage,
      breathingTitle: "szabályos",
      breathingCode: "6.41",
    ),
    BreathingModelModel(
      breathingImage: Assets.breathingIrregularBreathingImageWhite,
      breathingTitle: "szabálytalan",
      breathingCode: "6.42",
    ),
  ];

  ///
  static List<EyeModel> eyeList = [
    EyeModel(
      eyeImage: Assets.eyesEyesOpenWhite,
      eyeTitle: "nyitva",
      eyeCode: "6.51",
    ),
    EyeModel(
      eyeImage: Assets.eyesEyesClosedWhite,
      eyeTitle: "csukva",
      eyeCode: "6.52",
    ),
    EyeModel(
      eyeImage: Assets.eyesEyesCannotSeeWhite,
      eyeTitle: "nem látszik",
      eyeCode: "6.53",
    ),
  ];
}
