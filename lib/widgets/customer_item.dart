import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/customer_provider.dart';
import '../models/customer.dart';
import '../screens/customer_from_screen.dart';

class CustomerItem extends StatelessWidget {
  final Customer customer;
  final int index;
  final BoxConstraints constraints;

  const CustomerItem({
    required this.customer,
    required this.index,
    required this.constraints,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: constraints.maxHeight * 0.01,
        horizontal: constraints.maxWidth * 0.05,
      ),
      elevation: 4,
      child: ListTile(
        title: Text(
          customer.fullName,
          style: TextStyle(
            fontSize: constraints.maxWidth * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          customer.pan,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: constraints.maxWidth * 0.035,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerFormScreen(
                      customer: customer,
                      index: index,
                    ),
                  ),
                );
              },
              iconSize: constraints.maxWidth * 0.06,
            ),
            IconButton(
              icon: Icon(Icons.delete_rounded, color: Colors.red),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm Delete"),
                      content: Text(
                          "Are you sure you want to delete this customer?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<CustomerProvider>(context, listen: false)
                                .deleteCustomer(index);
                            Navigator.of(context).pop();
                          },
                          child: Text("Delete"),
                        ),
                      ],
                    );
                  },
                );
              },
              iconSize: constraints.maxWidth * 0.06,
            ),
          ],
        ),
      ),
    );
  }
}
