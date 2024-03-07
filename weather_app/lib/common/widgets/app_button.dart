import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppButton extends ConsumerWidget {
  const AppButton({
    required this.onPressed,
    required this.buttonText,
    this.buttonColor = const Color(0xff526DFD),
    this.textColor = Colors.white,
  });
  final VoidCallback onPressed;
  final String buttonText;
  final Color buttonColor;
  final Color textColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.06,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
