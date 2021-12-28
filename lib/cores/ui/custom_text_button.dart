import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  final Widget? prefixIcon;
  final Color? color;
  final bool isFilled;
  final TextStyle? labelStyle;
  final double? radius;
  final EdgeInsets? padding;
  final double? width;
  final double? height;

  const CustomTextButton({
    Key? key,
    this.onTap,
    this.prefixIcon,
    this.isFilled = false,
    this.color,
    this.labelStyle,
    required this.label,
    this.radius,
    this.padding,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = color ?? const Color(0x99333333);
    final _text = Text(
      label,
      style: labelStyle ??
          const TextStyle(
            color: Color(0x99333333),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
    );

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 32.r),
          border: isFilled
              ? null
              : Border.all(
                  color: _color,
                ),
          color: isFilled ? _color : Colors.transparent,
        ),
        width: width ?? double.infinity,
        height: height,
        padding: isFilled ? padding ?? const EdgeInsets.all(16.0) : padding ?? const EdgeInsets.all(15.0),
        child: Center(
          child: prefixIcon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    prefixIcon!,
                    const SizedBox(width: 4),
                    _text,
                  ],
                )
              : _text,
        ),
      ),
    );
  }
}
