import 'package:flutter/material.dart';
import 'package:ichota_mobile_app/shared/styles/text_style.dart';
import 'package:ichota_mobile_app/utils/extension/context_extensions.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.title,
    this.hintText,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.onChanged,
    this.validator,
  });

  final String title;
  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextRegular(
          title,
          fontWeight: FontWeight.w500,
        ),
        10.verticalSpace,
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xff333333), fontSize: 14),
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 12,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xff333333),
              ),
            ),
          ),
        )
      ],
    );
  }
}
