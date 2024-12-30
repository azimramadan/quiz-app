import 'package:flutter/material.dart';
import 'package:test3/views/build_page_view.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({
    super.key,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  bool _isButtonChanged = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 55),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyPageView(),
            )).then((_) {
          setState(() {
            _isButtonChanged = true; // تغيير حالة الزر عند العودة
          });
        });
      },
      child: Text(
        !_isButtonChanged
            ? 'Start Quiz'
            : currentPage == -1
                ? 'Retest Quiz'
                : 'Complete the Quiz',
        style: const TextStyle(
          color: Color(0xFF2B0062),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
