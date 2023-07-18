import 'dart:async';
import 'dart:developer';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../models/app_code_models.dart';
import '../../utils/constants/constant_strings.dart';
import '../../utils/constants/time_class.dart';

class AppServices {
  AppServices._();

  static Future<bool> isNightTime() async {
    DateTime currentTime = DateTime.now();
    DateTime sunsetTime = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
      Setting.sunsetTime.hour,
      Setting.sunsetTime.minute,
    );
    DateTime sunriseTime = DateTime(
      currentTime.year,
      currentTime.month,
      currentTime.day,
      Setting.sunriseTime.hour,
      Setting.sunriseTime.minute,
    );

    if (currentTime.isAfter(sunsetTime) || currentTime.isBefore(sunriseTime)) {
      // It's night time
      return true;
    } else {
      // It's not night time
      return false;
    }
  }

  static Future<bool> fifthOutputService(
      {required FifthOutputCodesModel fifthOutputCodesModel}) async {
    DateTime now = DateTime.now();
    String formattedDateTime =
        '${now.year}.${(now.month)}.${(now.day)}.${(now.hour)}.${(now.minute)}.${(now.second)}';
    String output =
        "$formattedDateTime,${fifthOutputCodesModel.cameraId},${fifthOutputCodesModel.babyId},${fifthOutputCodesModel.nurseId},${fifthOutputCodesModel.babyIncubatorStateId},${fifthOutputCodesModel.whatsHappeningId}";
    try {
      final wsUrl = Uri.parse(ConstantStrings.socketChannelUrl);
      var channel = WebSocketChannel.connect(wsUrl);
      channel.stream.listen(
        (message) {
          log("<==============================================================>");
          log('Received message: $message');
          log("<==============================================================>");
        },
        onDone: () {
          log("<=========================>");
          log('WebSocket Channel Closed');
          log("<=========================>");
        },
        onError: (error) {
          log("<==========================>");
          log('WebSocket Server Not Found');
          log("<==========================>");
        },
      );
      channel.sink.add(output);
      channel.sink.close(status.goingAway);

      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<bool> sixthOutputService(
      {required SixthOutputCodesModel sixthOutputCodesModel}) async {
    DateTime now = DateTime.now();
    String formattedDateTime =
        '${now.year}.${(now.month)}.${(now.day)}.${(now.hour)}.${(now.minute)}.${(now.second)}';
    String output =
        "$formattedDateTime,${sixthOutputCodesModel.cameraId},${sixthOutputCodesModel.babyId},${sixthOutputCodesModel.nurseId},${sixthOutputCodesModel.babyIncubatorStateId},${sixthOutputCodesModel.whatsHappeningId},${sixthOutputCodesModel.behaviourCode},${sixthOutputCodesModel.babyVoiceCode},${sixthOutputCodesModel.babyMovementHandsCode},${sixthOutputCodesModel.babyMovementLegsCode},${sixthOutputCodesModel.babyBreathingCode},${sixthOutputCodesModel.eyeCode}";
    try {
      final wsUrl = Uri.parse(ConstantStrings.socketChannelUrl);
      var channel = WebSocketChannel.connect(wsUrl);
      channel.stream.listen(
        (message) {
          log("<==============================================================>");
          log('Received message: $message');
          log("<==============================================================>");
        },
        onDone: () {
          log("<=========================>");
          log('WebSocket Channel Closed');
          log("<=========================>");
        },
        onError: (error) {
          log("<==========================>");
          log('WebSocket Server Not Found');
          log("<==========================>");
        },
      );
      channel.sink.add(output);
      channel.sink.close(status.goingAway);

      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
