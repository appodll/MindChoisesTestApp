import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

class AppDropdown extends StatelessWidget {
  final List items;
  final String hintText;
  final initialItem;

  const AppDropdown({
    super.key,
    required this.items,
    required this.hintText,
    required this.initialItem,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      decoration: CustomDropdownDecoration(closedFillColor: Color(0xFFF0F0F0)),
      items: items,
      onChanged: (value) {},
      initialItem: initialItem,
      hintText: hintText,
    );
  }
}
