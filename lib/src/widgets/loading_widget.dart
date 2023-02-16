import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';

enum LoadingTypeEnum { fast }

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.loadingType,
    this.isBlurScreen = false,
  }) : super(key: key);
  final bool isBlurScreen;
  final LoadingTypeEnum? loadingType;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: isBlurScreen ? AppColors.white : Colors.white.withOpacity(0.5),
        constraints: const BoxConstraints.expand(),
        child: const Center(
            child: CircularProgressIndicator(
          color: AppColors.colorPrimary,
        )));
  }
}
