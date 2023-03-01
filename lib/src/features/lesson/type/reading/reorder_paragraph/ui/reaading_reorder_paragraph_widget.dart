import 'package:flutter/material.dart';
import '../../../../widgets/exercise/reorder_paragraph/ui/reorder_pagraph_widget.dart';

class ReadingReorderParagraphWidget extends StatelessWidget {
  const ReadingReorderParagraphWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ReOrderParagraphWidget(),
      ],
    );
  }
}
