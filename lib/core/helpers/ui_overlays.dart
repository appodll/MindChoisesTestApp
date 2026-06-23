import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:mindchoises_test_app/core/constant/app_colors.dart';
import 'package:mindchoises_test_app/core/enums/toast_status.dart';
import 'package:mindchoises_test_app/core/widgets/app_text.dart';

void showToast(BuildContext context, String message, ToastStatus status) {
  if (!context.mounted) return;

  final color = status == ToastStatus.success
      ? AppColors.successColor
      : AppColors.errorColor;

  DelightToastBar(
    position: DelightSnackbarPosition.bottom,
    autoDismiss: true,
    snackbarDuration: const Duration(seconds: 3),
    builder: (_) => ToastCard(
      color: Colors.white,
      leading: Icon(
        status == ToastStatus.success ? Icons.check_circle : Icons.error,
        color: color,
      ),
      title: AppText(
        status == ToastStatus.success ? 'Success' : 'Error',
        color: color,
        fontWeight: FontWeight.w600,
      ),
      subtitle: AppText(message, size: 12),
    ),
  ).show(context);
}