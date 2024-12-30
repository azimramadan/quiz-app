import 'package:flutter/material.dart';

class QuestionTextContainer extends StatelessWidget {
  const QuestionTextContainer({
    super.key,
    required this.questionText,
  });
  final String questionText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, top: 12, bottom: 32),
      child: Text(
        questionText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
