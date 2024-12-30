import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  const ChoiceButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.choiceText,
  });
  final void Function() onPressed;
  final IconData icon;
  final String choiceText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              icon == Icons.circle ? const Color(0xFFB8B2FF) : Colors.white,
          minimumSize: const Size(double.infinity, 55),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          spacing: 10,
          children: [
            Icon(
              icon,
              size: 25,
              color: const Color(0xff2B0063),
            ),
            Text(
              choiceText,
              style: const TextStyle(
                color: Color(0xFF2B0062),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ));
  }
}
