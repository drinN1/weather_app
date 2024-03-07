import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppTextField extends ConsumerWidget {
  const AppTextField({
    required this.textController,
    this.hintText = '',
  });

  final TextEditingController textController;
  final String hintText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      enableSuggestions: false,
      autocorrect: false,
      controller: textController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey[700]!,
          ),
        ),
      ),
    );
  }
}
