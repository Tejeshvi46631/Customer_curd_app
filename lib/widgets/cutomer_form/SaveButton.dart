import 'package:flutter/material.dart';

import '../../models/customer.dart';
import '../../providers/customer_provider.dart';

class SaveButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Customer customer;
  final CustomerProvider customerProvider;
  final int? index;

  const SaveButton({
    required this.formKey,
    required this.customer,
    required this.customerProvider,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          if (index == null) {
            customerProvider.addCustomer(customer);
          } else {
            customerProvider.editCustomer(customer, index!);
          }
          Navigator.pop(context);
        }
      },
      child: Text(index == null ? 'Add Customer' : 'Update Customer'),
    );
  }
}