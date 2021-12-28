import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_base/theme/ui_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String? text)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isLastField;
  final Iterable<String>? autofillHints;
  final void Function()? onDone;
  final bool isRequired;
  final void Function()? onTap;
  final void Function(String? value)? onChanged;
  final bool? enabled;
  final TextStyle? textStyle;

  const CustomTextFormField({
    Key? key,
    required this.label,
    this.hint,
    this.suffixIcon,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.isLastField = false,
    this.autofillHints,
    this.onDone,
    this.isRequired = false,
    this.onTap,
    this.onChanged,
    this.enabled,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: UITextStyle.black18W500,
              ),
              if (isRequired)
                Transform.translate(
                  offset: const Offset(4, -4),
                  child: Text(
                    '(*)',
                    style: UITextStyle.red11W400,
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          TextFormField(
            enabled: enabled,
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF026894),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF026894),
                ),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF026894),
                ),
              ),
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color(0x99333333),
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: suffixIcon,
              helperText: ' ',
            ),
            style: textStyle ??
                const TextStyle(
                  color: Color(0x99333333),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
            obscureText: obscureText,
            validator: validator,
            keyboardType: keyboardType,
            textInputAction: isLastField ? TextInputAction.done : TextInputAction.next,
            autofillHints: enabled != null && enabled! ? autofillHints : null,
            onEditingComplete: isLastField ? onDone : null,
            onTap: onTap,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
