import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_icons.dart';
import 'package:mat_practice_pte/src/configs/constants/app_status_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';

class DropDownDiveAnswerWidget extends StatelessWidget {
  const DropDownDiveAnswerWidget({
    Key? key,
    required this.value,
    required this.items,
    required this.isDone,
    required this.isAnswer,
    required this.onChanged,
  }) : super(key: key);
  final String? value;
  final List<String> items;
  final bool isDone;
  final bool isAnswer;
  final Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        AppStatusColors.toColor(isAnswer: isAnswer, isDone: isDone);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 13),
      child: Wrap(
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          DropdownButton(
            alignment: AlignmentDirectional.center,
            isDense: true,
            value: value,
            enableFeedback: isDone == false,
            items: items
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e,
                          style: AppTextStyles.wordInkwell
                              .copyWith(color: foregroundColor)),
                    ))
                .toList(),
            onChanged: isDone ? null : onChanged,
          ),
          if (isDone)
            Icon(
              isAnswer ? AppIcons.iconCheck : AppIcons.iconUncheck,
              color: foregroundColor,
            ),
        ],
      ),
    );
  }
}
