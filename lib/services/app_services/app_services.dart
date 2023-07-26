import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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

  static Future<bool> internetConnectivity() async {
    try {
      ConnectivityResult connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        debugPrint("Connected to Mobile Network.");
        return true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        debugPrint("Connected to Wifi Network.");
        return true;
      } else if (connectivityResult == ConnectivityResult.none) {
        debugPrint("No Internet Connection");
        return false;
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<bool> outputService(
      {required OutputCodesModel outputCodesModel}) async {
    DateTime now = DateTime.now();
    String formattedDateTime =
        '${now.year}.${(now.month)}.${(now.day)}.${(now.hour)}.${(now.minute)}.${(now.second)}';
    String output =
        "$formattedDateTime,${outputCodesModel.cameraId},${outputCodesModel.babyId},${outputCodesModel.nurseId},${outputCodesModel.babyIncubatorStateId},${outputCodesModel.whatsHappeningId},${outputCodesModel.behaviourCode},${outputCodesModel.babyVoiceCode},${outputCodesModel.babyMovementCode},${outputCodesModel.babyBreathingCode},${outputCodesModel.eyeCode}";
    try {
      final wsUrl = Uri.parse(ConstantStrings.socketChannelUrl);
      var channel = WebSocketChannel.connect(wsUrl);
      channel.stream.listen(
        (message) {
          debugPrint(
              "<==============================================================>");
          debugPrint('Received message: $message');
          debugPrint(
              "<==============================================================>");
        },
        onDone: () {
          debugPrint("<=========================>");
          debugPrint('WebSocket Channel Closed');
          debugPrint("<=========================>");
        },
        onError: (error) {
          debugPrint("<==========================>");
          debugPrint('WebSocket Server Not Found');
          debugPrint("<==========================>");
        },
      );
      channel.sink.add(output);
      channel.sink.close(status.goingAway);

      return true;
    } catch (e) {
      debugPrint("<===============Inside Catch===============>");
      debugPrint(e.toString());
      debugPrint("<==========================================>");
      return false;
    }
  }
}
