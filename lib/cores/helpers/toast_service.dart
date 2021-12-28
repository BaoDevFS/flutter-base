import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_base/cores/ui/toast.dart';
import 'package:flutter_base/theme/ui_color.dart';

enum ToastType { info, warning, success, error }

@lazySingleton
class ToastService {
  static const Duration toastDuration = Duration(seconds: 1);

  void warning({
    required String message,
    required BuildContext context,
    GlobalKey<ScaffoldState>? scaffoldKey,
    VoidCallback? onDismissed,
    Duration? duration,
  }) {
    toast(message: message, type: ToastType.warning, context: context, duration: duration, onDismissed: onDismissed, scaffoldKey: scaffoldKey);
  }

  void success({
    Widget? child,
    required String message,
    BuildContext? context,
    GlobalKey<ScaffoldState>? scaffoldKey,
    VoidCallback? onDismissed,
    Duration? duration,
  }) {
    toast(
      message: message,
      type: ToastType.success,
      context: context ?? Get.context!,
      child: child,
      duration: duration,
      onDismissed: onDismissed,
      scaffoldKey: scaffoldKey,
    );
  }

  void error({
    required String message,
    BuildContext? context,
    GlobalKey<ScaffoldState>? scaffoldKey,
    VoidCallback? onDismissed,
    Duration? duration,
  }) {
    toast(
      message: message,
      type: ToastType.error,
      context: context ?? Get.context!,
      onDismissed: onDismissed,
      duration: duration,
      scaffoldKey: scaffoldKey,
    );
  }

  void info({
    Widget? child,
    required String message,
    BuildContext? context,
    GlobalKey<ScaffoldState>? scaffoldKey,
    VoidCallback? onDismissed,
    Duration? duration,
  }) {
    toast(
      child: child,
      message: message,
      type: ToastType.info,
      context: context ?? Get.context!,
      duration: duration,
      scaffoldKey: scaffoldKey,
      onDismissed: onDismissed,
    );
  }

  void toast({
    Widget? child,
    required String message,
    required ToastType type,
    required BuildContext context,
    GlobalKey<ScaffoldState>? scaffoldKey,
    VoidCallback? onDismissed,
    Duration? duration,
  }) {
    REEToast.of(context).showToast(child: child, color: _getToastColor(type), message: message, duration: duration, onDismissed: onDismissed);
  }

  Color _getToastColor(ToastType type) {
    var color = UIColor.primary;

    switch (type) {
      case ToastType.error:
        color = UIColor.red;
        break;
      case ToastType.info:
        color = UIColor.primary.withOpacity(.5);
        break;
      case ToastType.success:
        color = UIColor.green;
        break;
      case ToastType.warning:
        color = UIColor.yellow;
        break;
    }
    return color;
  }
}
