

import 'package:flutter/material.dart';
import '../models/customer.dart';
import '../utills/validation.dart';


class AddressForm extends StatelessWidget {
  final Address address;
  final Function(String) onPostcodeChanged;

  AddressForm({required this.address, required this.onPostcodeChanged});

  @override
  Widget build(BuildContext context) {
    TextEditingController _addressLine1Controller = TextEditingController(text: address.addressLine1);
    TextEditingController _addressLine2Controller = TextEditingController(text: address.addressLine2);
    TextEditingController _postcodeController = TextEditingController(text: address.postcode);
    TextEditingController _stateController = TextEditingController(text: address.state);
    TextEditingController _cityController = TextEditingController(text: address.city);

    return Column(
      children: [
        TextFormField(
          controller: _addressLine1Controller,
          decoration: InputDecoration(labelText: 'Address Line 1'),
          validator: (value) {
            if (value == null || value.isEmpty) return 'Address Line 1 is required';
            return null;
          },
          onChanged: (value) { address.addressLine1 = value; },
        ),
        TextFormField(
          controller: _addressLine2Controller,
          decoration: InputDecoration(labelText: 'Address Line 2'),
          onChanged: (value) { address.addressLine2 = value; },
        ),
        TextFormField(
          controller: _postcodeController,
          decoration: InputDecoration(labelText: 'Postcode'),
          validator: Validation.validatePostcode,
          onChanged: (value) {
            address.postcode = value;
            onPostcodeChanged(value);
          },
        ),
        TextFormField(
          controller: _stateController,
          decoration: InputDecoration(labelText: 'State'),
          readOnly: true,
        ),
        TextFormField(
          controller: _cityController,
          decoration: InputDecoration(labelText: 'City'),
          readOnly: true,
        ),
      ],
    );
  }
}
