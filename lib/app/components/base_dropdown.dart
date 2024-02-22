import 'package:dailyateam/app/components/base_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseDropdown extends StatelessWidget {
  const BaseDropdown({
    Key? key,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.border,
    this.value,
    this.validator,
  }) : super(key: key);

  final String hint;
  final List<DropdownMenuItem<Object>>? items;
  final void Function(Object?)? onChanged;
  final InputBorder? border;
  final Object? value;
  final String? Function(Object?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      isExpanded: true,
      hint: BaseText(
        text: hint,
        color: Colors.grey.shade500,
      ),
      value: value,
      items: items,
      validator: validator,
      onChanged: onChanged,
      dropdownMaxHeight: 200,
      dropdownDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      dropdownElevation: 1,
      buttonWidth: Get.width,
      itemPadding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: InputDecoration(
        errorMaxLines: 2,
        contentPadding: border == null
            ? null
            : const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        border: border,
      ),
    );
  }
}
