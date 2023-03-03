import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_icons.dart';
import 'package:mat_practice_pte/src/configs/constants/app_status_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';

class TextFieldDiveAnswerWidget extends StatelessWidget {
  const TextFieldDiveAnswerWidget({
    Key? key,
    required this.isDone,
    required this.isAnswer,
    required this.onChanged,
    required this.textEditingController,
  }) : super(key: key);

  final bool isDone;
  final bool isAnswer;
  final Function(String? value) onChanged;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        AppStatusColors.toColor(isAnswer: isAnswer, isDone: isDone);

    return Wrap(
      children: [
        SizedBox(
          width: 100,
          child: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              isDense: true,
            ),
            textAlign: TextAlign.center,
            style: AppTextStyles.body1
                .copyWith(fontSize: 18, color: isDone ? foregroundColor : null),
            onChanged: onChanged,
            enabled: isDone == false,
          ),
        ),
        // DropdownButton(
        //   isDense: true,
        //   value: value,
        //   enableFeedback: isDone == false,
        //   items: items
        //       .map((e) => DropdownMenuItem(
        //             value: e,
        //             child: Text(e,
        //                 style: AppTextStyles.body1
        //                     .copyWith(color: foregroundColor)),
        //           ))
        //       .toList(),
        //   onChanged: isDone ? null : onChanged,
        // ),

        if (isDone)
          Icon(
            isAnswer ? AppIcons.iconCheck : AppIcons.iconUncheck,
            color: foregroundColor,
          ),
      ],
    );
  }
}
