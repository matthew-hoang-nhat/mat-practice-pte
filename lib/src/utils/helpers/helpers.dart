import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/utils/helpers/ultilities.dart';

class Helpers {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromStrHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  static String formatDateTime(DateTime dateTime) {
    return Ultilities.formatDate.format(dateTime);
  }

  static String parseTimeStampToStr(int timeStamp) {
    var dateTime = DateTime.fromMicrosecondsSinceEpoch(timeStamp);
    return Ultilities.formatDate.format(dateTime);
  }
}
