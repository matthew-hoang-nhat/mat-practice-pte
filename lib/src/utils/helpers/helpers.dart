import 'package:flutter/material.dart';

class Helpers {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromStrHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
