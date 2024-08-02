import 'package:flutter/material.dart';

import '../screens/customer_from_screen.dart';

class CustomerEmptyState extends StatelessWidget {
  final BoxConstraints constraints;

  const CustomerEmptyState({required this.constraints, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: constraints.maxWidth * 0.1,
          vertical: constraints.maxHeight * 0.1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/data_not_found.png',
              width: constraints.maxWidth * 0.5,
              height: constraints.maxHeight * 0.3,
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Text(
              'No customers added yet!',
              style: TextStyle(
                fontSize: constraints.maxWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CustomerFormScreen()),
                );
              },
              child: Text(
                'Add Your First Customer',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.04,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
