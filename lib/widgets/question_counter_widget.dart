import 'package:flutter/material.dart';
import 'package:test3/widgets/segmented_circular_progress.dart';

class QuestionCounter extends StatelessWidget {
  const QuestionCounter({
    super.key,
    required this.questionNumber,
  });
  final int questionNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color(0xFF8D83FF)),
      child: Row(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        children: [
          SegmentedCircularProgress(
            progress: questionNumber / 8,
          ),
          Text(
            'Question $questionNumber',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
