import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mindchoises_test_app/core/constant/app_colors.dart';


class AppInput extends StatelessWidget {
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final Color? borderColor;
  final Color labelColor;
  final Color? hintColor;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final double borderRadius;
  final Color? filledColor;
  final bool filled;
  final double labelFontSize;
  final double hintFontSize;
  final Color? cursorColor;
  final int? minLines;
  final double? fieldFontSize;
  final Color? fieldFontColor;
  final TextInputType? keyboardType;
  final String borderType;
  final String inputType;
  final bool readOnly;
  final String? hintText;
  final String? prefixText;
  final dynamic keyy;
  final double? width;
  final bool isDense;
  final bool isCollapsed;
  final EdgeInsets? contentPadding;
  final TextAlign? textAlign;
  final prefixStyle;
  final bool obscureText;
  final FocusNode? focusNode;
  final bool autofocus;

  const AppInput({
    super.key,
    this.label,
    this.suffixIcon,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.keyy,
    this.inputFormatters,
    this.onChanged,
    this.borderColor,
    this.labelColor = const Color.fromRGBO(151, 154, 160, 1),
    this.borderRadius = 8,
    this.filledColor,
    this.filled = false,
    this.labelFontSize = 13,
    this.cursorColor,
    this.minLines,
    this.isCollapsed = false,
    this.fieldFontSize,
    this.keyboardType,
    this.borderType = "outlined",
    this.inputType = "elevated",
    this.readOnly = false,
    this.hintColor,
    this.hintFontSize = 14,
    this.isDense = false,
    this.width,
    this.contentPadding,
    this.fieldFontColor,
    this.textAlign,
    this.prefixText,
    this.prefixStyle,
    this.obscureText = false,
    this.onTap,
    this.focusNode,
    this.autofocus = false,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: TextField(
        focusNode: focusNode,
        autofocus: autofocus,
        obscureText: obscureText,
        readOnly: readOnly,
        keyboardType: keyboardType,
        style: TextStyle(
          fontSize: fieldFontSize,
          color: fieldFontColor ?? AppColors.textColor,
        ),
        maxLines: 1,
        minLines: minLines,
        cursorColor: cursorColor,
        inputFormatters: inputFormatters,
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        obscuringCharacter: '•',
        textAlign: textAlign ?? TextAlign.start,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          isCollapsed: isCollapsed,
          contentPadding: contentPadding,
          isDense: isDense,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            fontSize: hintFontSize,
            color: hintColor ?? Color.fromARGB(255, 133, 133, 133),
            fontWeight: FontWeight.w500,
            letterSpacing: 0,
          ),
          prefixText: prefixText,
          prefixStyle: prefixStyle,
          prefixIcon: prefixIcon,
          filled: filled,
          fillColor: filledColor,
          suffixIcon: suffixIcon,
          labelText: label,
          alignLabelWithHint: true,
          labelStyle: GoogleFonts.poppins(
            fontSize: labelFontSize,
            color: labelColor,
            fontWeight: FontWeight.w500,
            letterSpacing: 0,
          ),
          floatingLabelStyle: GoogleFonts.poppins(
            fontSize: 18,
            color: Color.fromRGBO(209, 209, 209, 1),
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: _getBorder(
            borderType,
            borderColor ?? Color.fromRGBO(209, 209, 209, 1),
          ),
          enabledBorder: _getBorder(
            borderType,
            borderColor ?? Color.fromRGBO(209, 209, 209, 1),
          ),
        ),
      ),
    );
  }

  InputBorder _getBorder(String type, Color color) {
    if (type == "outlined") {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: color),
      );
    } else {
      return UnderlineInputBorder(borderSide: BorderSide(color: color));
    }
  }
}