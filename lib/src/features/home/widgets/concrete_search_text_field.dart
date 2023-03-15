import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';
import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

class ConcreteSearchTextField extends StatelessWidget {
  const ConcreteSearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const outlineBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 0.0));
    return InkWell(
      onTap: FCoordinator.showSearch,
      child: TextField(
        decoration: InputDecoration(
            fillColor: AppColors.red,
            hintText:
                GlobalVariables.getIt<FLocate>().str(FLocalKey.hintSearch),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            enabledBorder: outlineBorder,
            focusedBorder: outlineBorder,
            border: outlineBorder),
        enabled: false,
      ),
    );
  }
}
