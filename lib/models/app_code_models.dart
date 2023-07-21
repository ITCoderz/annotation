///
class CameraSelectionModel {
  String cameraImage, cameraCode;

  CameraSelectionModel({
    required this.cameraImage,
    required this.cameraCode,
  });
}

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
class OutputCodesModel {
  String cameraId,
      babyId,
      nurseId,
      babyIncubatorStateId,
      whatsHappeningId,
      behaviourCode,
      babyVoiceCode,
      babyMovementCode,
      babyBreathingCode,
      eyeCode;

  OutputCodesModel({
    required this.cameraId,
    required this.babyId,
    required this.nurseId,
    required this.babyIncubatorStateId,
    required this.whatsHappeningId,
    required this.behaviourCode,
    required this.babyVoiceCode,
    required this.babyMovementCode,
    required this.babyBreathingCode,
    required this.eyeCode,
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
