import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  // ── Backgrounds ───────────────────────────────────────────────────────────
  static const scaffoldBg = Color(0xFFF5F7FA);
  static const cardBg = Colors.white;
  static const inputBg = Color(0xFFF0F4F8);

  // ── Text ──────────────────────────────────────────────────────────────────
  static const textPrimary = Color(0xFF1A2340);
  static const textSecondary = Color(0xFF6B7A99);
  static const textHint = Color(0xFFADB5C7);

  // ── Accent ────────────────────────────────────────────────────────────────
  static const accent = AppColors.primaryColor; // 0xFF5799cb
  static const accentLight = Color(0xFFE8F1FB);
  static const accentGlow = Color(0x225799cb);

  // ── Divider ───────────────────────────────────────────────────────────────
  static const divider = Color(0xFFE8EDF5);

  // ── Card decoration ───────────────────────────────────────────────────────
  static BoxDecoration get card => BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5799cb).withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      );

  // kept as alias so existing references don't break
  static BoxDecoration get glassCard => card;

  // ── Input decoration ──────────────────────────────────────────────────────
  static InputDecoration lightInputDecoration({
    required String hint,
    Widget? prefix,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: textHint, fontSize: 14),
      prefixIcon: prefix,
      filled: true,
      fillColor: inputBg,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFDDE3EE)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFDDE3EE)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: accent, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.errorColor, width: 1.5),
      ),
      errorStyle: const TextStyle(color: AppColors.errorColor),
    );
  }

  // kept as alias
  static InputDecoration darkInputDecoration({
    required String hint,
    Widget? prefix,
  }) =>
      lightInputDecoration(hint: hint, prefix: prefix);
}
