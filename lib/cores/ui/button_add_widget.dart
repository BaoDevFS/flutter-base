import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_base/theme/ui_color.dart';

class ButtonAddWidget extends StatelessWidget {
  final Function()? onAddOrder;

  const ButtonAddWidget({Key? key, this.onAddOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAddOrder?.call(),
      child: Container(
        width: 25.w,
        height: 25.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: UIColor.primary,
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            color: UIColor.white,
          ),
        ),
      ),
    );
  }
}
