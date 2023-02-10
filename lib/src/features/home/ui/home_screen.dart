import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              GlobalVariables.auth.signOut();
              context.goNamed(AppPaths.login);
            },
            child: const Text('Log out'),
          ),
        ],
      )),
    );
  }
}
