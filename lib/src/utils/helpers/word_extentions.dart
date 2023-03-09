import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/configs/constants/app_define_constants.dart';
import 'package:mat_practice_pte/src/features/word_definition/ui/word_inkwell.dart';

import 'ultilities.dart';

class WordExtension {
  static String filterWord(String value) {
    final newText = value.replaceAll(RegExp(r'[0-9!@#$%^&*(),.?":{}|<>]'), "");
    return newText;
  }

  static Column parseToInkwellParagraph(String content) {
    final pagraphs = content.split('\n');
    return Column(
      children: pagraphs
          .map((e) => Column(
                children: [
                  _paragraphToTextSpan(e),
                  Row(),
                ],
              ))
          .toList(),
    );
  }

  static Column parseToInkwellParagraphDiveAnswer(
      String content, List<InlineSpan> box) {
    final pagraphs = content.split('\n');
    return Column(
      children: pagraphs
          .map((e) => Column(
                children: [
                  _paragraphToTextSpanWithBox(e, box),
                  Row(),
                ],
              ))
          .toList(),
    );
  }

  static RichText _paragraphToTextSpanWithBox(
      String paragraph, List<InlineSpan> box) {
    final words = paragraph.split(' ');
    int indexBox = -1;

    final List<InlineSpan> widgets = words.map((text) {
      if (text.contains(Ultilities.answerDiveIntoParagraphRegExp)) {
        indexBox++;
        return box.elementAt(indexBox);
      } else {
        return WidgetSpan(child: WordInkwell(text: text));
      }
    }).toList();

    return RichText(text: TextSpan(children: widgets));
  }

  static RichText _paragraphToTextSpan(String pagraph) {
    List<InlineSpan> words = pagraph
        .split(' ')
        .map((e) => WidgetSpan(child: WordInkwell(text: e)))
        .toList();

    return RichText(text: TextSpan(children: words));
  }

  static RichText answersToTextSpan(List<String> answers) {
    String paragraph = answers.join(' - ');
    paragraph = paragraph.replaceAll(AppDefineConstants.empty, '   ');

    return _paragraphToTextSpan(paragraph);
  }
}
