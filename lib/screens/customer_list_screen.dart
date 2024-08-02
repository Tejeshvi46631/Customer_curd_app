import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/customer_provider.dart';
import '../widgets/CustomerEmptyState.dart';
import '../widgets/customer_item.dart';
import 'customer_from_screen.dart';

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer List'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Consumer<CustomerProvider>(
            builder: (context, customerProvider, child) {
              if (customerProvider.customers.isEmpty) {
                return CustomerEmptyState(constraints: constraints);
              } else {
                return ListView.builder(
                  itemCount: customerProvider.customers.length,
                  itemBuilder: (context, index) {
                    final customer = customerProvider.customers[index];
                    return CustomerItem(
                      customer: customer,
                      index: index,
                      constraints: constraints,
                    );
                  },
                );
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CustomerFormScreen()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
