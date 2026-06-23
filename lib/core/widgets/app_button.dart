import 'package:flutter/material.dart';
import 'package:mindchoises_test_app/core/constant/app_colors.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Color? backgroundColor;
  final double width;
  final double height;
  final String type;
  final BorderSide? side;
  final Color textColor;
  final double fontSize;
  final double padding;
  final FontWeight fontWeight;
  final Widget? child;
  final String? childPosition;
  final double radius;
  final String shape;
  final dynamic keyy;
  final Color? borderColor;
  final Gradient? gradient;
  final bool isEnabled;

  const AppButton({
    super.key,
    required this.onPressed,
    this.title,
    this.backgroundColor,
    this.width = 0.0,
    this.height = 55.0,
    this.type = 'elevated',
    this.side,
    this.textColor = Colors.black,
    this.fontSize = 12.0,
    this.padding = 16.0,
    this.fontWeight = FontWeight.w500,
    this.child,
    this.radius = 8,
    this.shape = 'rectangle',
    this.keyy,
    this.borderColor,
    this.gradient,
    this.childPosition = "right",
    this.isEnabled = true,
  });


  @override
  Widget build(BuildContext context) {
    final bool enabled = isEnabled && onPressed != null;

    final Color resolvedBgColor = enabled
        ? (backgroundColor ?? AppColors.primaryColor)
        : (backgroundColor ?? AppColors.primaryColor).withOpacity(0.4);

    final Color resolvedTextColor = enabled
        ? textColor
        : textColor.withOpacity(0.5);

    final resolvedWidth = width == 0.0
        ? MediaQuery.of(context).size.width
        : width;

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: childPosition == "right"
          ? [
              if (title != null)
                Flexible(
                  child: AppText(
                    title.toString(),
                    keyy: keyy,
                    size: fontSize,
                    color: resolvedTextColor,
                    fontWeight: fontWeight,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              if (child != null) ...[child!],
            ]
          : [
              if (child != null) ...[child!],
              if (title != null)
                Flexible(
                  child: AppText(
                    title.toString(),
                    keyy: keyy,
                    size: fontSize,
                    color: resolvedTextColor,
                    fontWeight: fontWeight,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
    );

    final shapeWidget = shape == 'rectangle'
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(color: borderColor ?? Colors.transparent),
          )
        : const CircleBorder();

    switch (type) {
      case 'outlined':
        return OutlinedButton(
          onPressed: enabled ? onPressed : null,
          style: OutlinedButton.styleFrom(
            minimumSize: Size(resolvedWidth, height),
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10),
            side: side ?? BorderSide(color: borderColor ?? Colors.transparent),
            shape: shapeWidget,
            backgroundColor: resolvedBgColor,
          ),
          child: content,
        );

      case 'textbutton':
        return TextButton(
          onPressed: enabled ? onPressed : null,
          child: content,
        );

      case 'elevated':
      default:
        final button = ElevatedButton(
          onPressed: enabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: Colors.transparent,
            backgroundColor: resolvedBgColor,
            shape: shapeWidget,
            minimumSize: Size(resolvedWidth, height),
          ),
          child: content,
        );

        if (gradient != null) {
          return Container(
            width: resolvedWidth,
            height: height,
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: shape == "rectangle"
                  ? BorderRadius.circular(radius)
                  : null,
              shape: shape == "rectangle"
                  ? BoxShape.rectangle
                  : BoxShape.circle,
            ),
            child: button,
          );
        } else {
          return button;
        }
    }
  }
} //
