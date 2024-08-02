import 'package:flutter/material.dart';

import '../../utills/validation.dart';
class EmailTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const EmailTextFormField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: 'Email'),
      validator: Validation.validateEmail,
    );
  }
}

