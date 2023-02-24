import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/features/word_definition/ui/word_inkwell.dart';

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

  static RichText _paragraphToTextSpan(String pagraph) {
    List<InlineSpan> words = pagraph
        .split(' ')
        .map((e) => WidgetSpan(child: WordInkwell(text: e)))
        .toList();

    return RichText(text: TextSpan(children: words));
  }
}
