import 'package:flutter/material.dart';
import 'package:test3/widgets/custom_elevated_button.dart';
import 'package:test3/widgets/custom_text_widget.dart';

class StartQuizViewBody extends StatelessWidget {
  const StartQuizViewBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomTextWidget(
          mainAxisAlignment: MainAxisAlignment.start,
          text: 'Good morning,',
          fontSize: 16,
        ),
        const SizedBox(height: 8),
        const CustomTextWidget(
          mainAxisAlignment: MainAxisAlignment.start,
          text: 'New topic is waiting',
          fontSize: 24,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image2-removebg-preview.png'),
              ),
            ),
          ),
        ),
        const CustomElevatedButton(),
      ],
    );
  }
}
