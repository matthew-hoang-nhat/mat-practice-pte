import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/paragraph_dive_answer/many_options/ui/paragraph_dive_answer_many_options_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/single_choice_answer/ui/single_choice_answer_widget.dart';

import 'multiple_choice_answer/ui/multiple_choice_answer_widget.dart';
import 'paragraph_dive_answer/one_option/ui/paragraph_dive_answer_one_option_widget.dart';
import 'paragraph_dive_answer/text_options/ui/paragraph_dive_answer_text_options_widget.dart';

class TypeComponentExercises {
  static const diveAnswerManyOptions = ParagraphDiveAnswerManyOptionsWidget();
  static const diveAnswerOneOption = ParagraphDiveAnswerOneOptionWidget();
  static const diveAnswerTextFields = ParagraphDiveAnswerTextOptionsWidget();
  static const singleChoiceAnswer = SingleChoiceAnswerWidget();
  static const multipleChoiceAnswer = MultipleChoiceAnswerWidget();
}
