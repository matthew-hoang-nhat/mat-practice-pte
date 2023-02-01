import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  static bool isMobile(context) => MediaQuery.of(context).size.width < 650;
  static bool isTablet(context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(context) => MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1100) return desktop;
      if (constraints.maxWidth >= 650) return tablet;
      return mobile;
    });
  }
}
