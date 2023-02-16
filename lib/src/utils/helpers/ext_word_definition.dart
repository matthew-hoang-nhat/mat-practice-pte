part of '../../features/word_definition/cubit/show_bottom_definition_cubit.dart';

extension ExtWordDefinition on String {
  String filterWord() {
    final newText = replaceAll(RegExp(r'[!@#$%^&*(),.?":{}|<>]'), "");
    return newText;
  }
}
