import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppTextField extends ConsumerWidget {
  const AppTextField({
    required this.textController,
    this.hintText = '',
    this.suffixIcon = null,
  });

  final TextEditingController textController;
  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      cursorColor: Colors.white,
      enableSuggestions: false,
      autocorrect: false,
      controller: textController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        suffixIconConstraints: BoxConstraints(minWidth: 24, minHeight: 24),
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            width: 1,
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
