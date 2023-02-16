// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/features/home/widgets/f_home_bottom_app_bar.dart';

class ScaffoldWithBottomNavigationBar extends StatelessWidget {
  const ScaffoldWithBottomNavigationBar({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: child, bottomNavigationBar: const FHomeBottomAppBar());
  }
}
