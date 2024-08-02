import 'package:flutter/material.dart';

import '../../utills/validation.dart';
class MobileTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const MobileTextFormField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Mobile Number',
        prefixText: '+91',
      ),
      validator: Validation.validateMobile,
    );
  }
}
