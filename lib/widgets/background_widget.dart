import 'package:flutter/widgets.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/images/GRADINET.png',
            ),
            fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 32,
            left: 16,
            right: 16,
            top: 40,
          ),
          child: child,
        ),
      ),
    );
  }
}
