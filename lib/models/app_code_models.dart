///
class FifthOutputCodesModel {
  String cameraId, babyId, nurseId, babyIncubatorStateId, whatsHappeningId;

  FifthOutputCodesModel({
    required this.cameraId,
    required this.babyId,
    required this.nurseId,
    required this.babyIncubatorStateId,
    required this.whatsHappeningId,
  });
}

///
class SixthOutputCodesModel {
  String cameraId,
      babyId,
      nurseId,
      babyIncubatorStateId,
      whatsHappeningId,
      behaviourCode,
      babyVoiceCode,
      babyMovementHandsCode,
      babyMovementLegsCode,
      babyBreathingCode,
      eyeCode;

  SixthOutputCodesModel({
    required this.cameraId,
    required this.babyId,
    required this.nurseId,
    required this.babyIncubatorStateId,
    required this.whatsHappeningId,
    required this.behaviourCode,
    required this.babyVoiceCode,
    required this.babyMovementHandsCode,
    required this.babyMovementLegsCode,
    required this.babyBreathingCode,
    required this.eyeCode,
  });
}

///
class SelectionModel {
  String selectionTitle, selectionCode;

  SelectionModel({
    required this.selectionTitle,
    required this.selectionCode,
  });
}

///
class BabyIncubatorStateModelModel {
  String incubatorStateImage, incubatorStateTitle, incubatorStateCode;

  BabyIncubatorStateModelModel({
    required this.incubatorStateImage,
    required this.incubatorStateTitle,
    required this.incubatorStateCode,
  });
}

///
class WhatsHappeningModel {
  String whatsHappeningImage, whatsHappeningTitle, whatsHappeningCode;

  WhatsHappeningModel({
    required this.whatsHappeningImage,
    required this.whatsHappeningTitle,
    required this.whatsHappeningCode,
  });
}

///
class BabyBehaviourModel {
  String behaviourImage, behaviourTitle, behaviourCode;

  BabyBehaviourModel({
    required this.behaviourImage,
    required this.behaviourTitle,
    required this.behaviourCode,
  });
}

///
class BabyVoiceModel {
  String voiceImage, voiceTitle, voiceCode;

  BabyVoiceModel({
    required this.voiceImage,
    required this.voiceTitle,
    required this.voiceCode,
  });
}

///
class MovementInModel {
  String movementInImage, movementInTitle, movementInCode;

  MovementInModel({
    required this.movementInImage,
    required this.movementInTitle,
    required this.movementInCode,
  });
}

///
class BreathingModelModel {
  String breathingImage, breathingTitle, breathingCode;

  BreathingModelModel({
    required this.breathingImage,
    required this.breathingTitle,
    required this.breathingCode,
  });
}

///

class EyeModel {
  String eyeImage, eyeTitle, eyeCode;

  EyeModel({
    required this.eyeImage,
    required this.eyeTitle,
    required this.eyeCode,
  });
}
