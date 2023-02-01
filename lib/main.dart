import 'package:flutter/material.dart';
import 'package:mat_practice_pte/locator.dart';
import 'app.dart';

void main() async {
  await locator();
  runApp(const App());
}
