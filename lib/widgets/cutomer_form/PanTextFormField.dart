import 'package:flutter/material.dart';

import '../../utills/validation.dart';

class PanTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool isLoading;
  final ValueChanged<String> onChanged;

  const PanTextFormField({
    required this.controller,
    required this.isLoading,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'PAN',
        suffixIcon: isLoading ? CircularProgressIndicator() : null,
      ),
      validator: Validation.validatePan,
      onChanged: onChanged,
    );
  }
}

