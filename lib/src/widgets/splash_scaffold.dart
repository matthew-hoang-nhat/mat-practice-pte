import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/widgets/loading_widget.dart';

class SplashScaffold extends StatelessWidget {
  const SplashScaffold({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: Text(title)),
          body: SafeArea(child: Column()),
        ),
        const LoadingWidget()
      ],
    );
  }
}
