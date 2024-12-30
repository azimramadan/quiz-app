import 'package:flutter/material.dart';

class BackActionButton extends StatelessWidget {
  const BackActionButton({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            minimumSize: const Size(140, 55),
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xFF8D83FF), width: 3),
                borderRadius: BorderRadius.circular(12))),
        onPressed: onPressed,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.navigate_before,
              color: Colors.white,
              size: 30,
            ),
            Text(
              'Back',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ));
  }
}
