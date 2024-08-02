import 'package:flutter/material.dart';

import '../../utills/validation.dart';


class FullNameTextFormField extends StatelessWidget {
  final TextEditingController controller;

  const FullNameTextFormField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: 'Full Name'),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Full Name is required';
        if (value.length > 140) return 'Full Name cannot exceed 140 characters';
        return null;
      },
    );
  }
}



