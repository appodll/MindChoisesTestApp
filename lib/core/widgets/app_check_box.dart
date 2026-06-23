import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:mindchoises_test_app/core/constant/app_colors.dart';


class AppCheckBox extends StatelessWidget {
  final value;
  final void Function(bool)? onChange;
  final double radius;
  final double thickness;
  final double size;

  const AppCheckBox({
    super.key,
    required this.value,
    this.onChange,
    this.radius = 7,
    this.thickness = 2.5,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCheckBox(
      value: value,
      shouldShowBorder: true,
      borderColor: onChange != null ? AppColors.primaryColor : Colors.grey,
      checkedFillColor: onChange != null ? AppColors.primaryColor : Colors.grey,
      borderRadius: radius,
      borderWidth: thickness,
      checkBoxSize: size,
      checkedIconColor: Colors.white,
      uncheckedFillColor: Colors.transparent,
      uncheckedIconColor: Colors.transparent,
      onChanged: onChange ?? (_) {},
    );
  }
}