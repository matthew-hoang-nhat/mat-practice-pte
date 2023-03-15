import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/search/cubit/search_cubit.dart';
import 'package:mat_practice_pte/src/features/search/widgets/brief_lesson_widget.dart';

import '../cubit/search_state.dart';

class LessonSearchComponent extends StatelessWidget {
  const LessonSearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) => previous.lessons != current.lessons,
      builder: (context, state) {
        return Column(
            children: List.generate(
                state.lessons.length,
                (index) => BriefLessonWidget(
                    index: index, lesson: state.lessons.elementAt(index))));
      },
    );
  }
}
