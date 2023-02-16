import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';

class FBottomModalSheet {
  static void showMeModalBottomSheet(
    context, {
    required Widget title,
    required Widget widget,
    double? sizeHeight,
    Widget? action,
  }) {
    final heightFactor = sizeHeight ?? 0.4;
    var scrollButton = Container(
      height: 7,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.colorBorder),
    );
    showModalBottomSheet(
        useRootNavigator: false,
        isScrollControlled: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: FractionallySizedBox(
              heightFactor: heightFactor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  scrollButton,
                  const SizedBox(
                    height: 7,
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                          color: AppColors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(child: title),
                                if (action != null) action
                              ],
                            ),
                            Expanded(child: widget)
                          ],
                        )),
                  ),
                  // if (bottom != null) bottom,
                ],
              ),
            ),
          );
        });
  }
}
