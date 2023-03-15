import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/features/category/widgets/triangle_painter.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_padding_sizes.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';

import '../cubit/search_cubit.dart';

class BriefLessonWidget extends StatelessWidget {
  const BriefLessonWidget({
    Key? key,
    required this.lesson,
    required this.index,
  }) : super(key: key);
  final DetailLesson lesson;
  final int index;
  @override
  Widget build(BuildContext context) {
    final markStr = lesson.mark;
    Color? markColor;
    FilterMarkEnum? mark;

    if (markStr != null) {
      mark = FilterMarkEnum.tryParse(markStr);
      switch (mark) {
        case FilterMarkEnum.red:
          markColor = AppColors.red;
          break;
        case FilterMarkEnum.grey:
          markColor = AppColors.grey;
          break;
        default:
      }
    }

    return InkWell(
      onTap: () => context.read<SearchCubit>().lessonOnClick(lesson),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: FPaddingSizes.s20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: FPaddingSizes.s20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${index + 1}. ${lesson.title}',
                            style: AppTextStyles.body1.copyWith(
                              color: AppColors.colorTextColor,
                              fontSize: 18,
                            )),
                        Text(lesson.content,
                            style: AppTextStyles.body1
                                .copyWith(color: AppColors.grey),
                            maxLines: 2),
                        FSizeBoxs.h20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Text(
                            //   'Practice * ${lesson.countPracticed ?? 0}',
                            //   style: AppTextStyles.labelMedium,
                            // ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.grey),
                              child: Text(
                                '#${lesson.codeLesson}',
                                style: AppTextStyles.body2
                                    .copyWith(color: AppColors.white),
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
                const Divider(),
              ],
            ),
          ),
          if (markColor != null)
            CustomPaint(
              painter: TrianglePainter(backgroundColor: markColor),
              size: const Size(30, 30),
            ),
        ],
      ),
    );
  }
}
