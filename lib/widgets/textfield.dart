import 'package:cookers_app/utils/extension.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final Color? textFieldColor;
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.textFieldColor = const Color(0xFFC9C9C9),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: textFieldColor!,
        ),
      ),
      child: TextField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: textEditingController,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: context.smallTextStyle.copyWith(
            color: const Color(0xFFBBBBBB),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 10,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
