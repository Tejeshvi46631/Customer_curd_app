import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/customer.dart';
import 'dart:convert';

class CustomerProvider extends ChangeNotifier {
  List<Customer> _customers = [];

  List<Customer> get customers => _customers;

  Future<void> loadFromLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final customerData = prefs.getString('customers');
    if (customerData != null) {
      _customers = (jsonDecode(customerData) as List)
          .map((item) => Customer.fromJson(item))
          .toList();
      notifyListeners();
    }
  }

  Future<void> saveToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('customers', jsonEncode(_customers));
  }

  void addCustomer(Customer customer) {
    _customers.add(customer);
    saveToLocalStorage();
    notifyListeners();
  }

  void editCustomer(Customer customer, int index) {
    _customers[index] = customer;
    saveToLocalStorage();
    notifyListeners();
  }

  void deleteCustomer(int index) {
    _customers.removeAt(index);
    saveToLocalStorage();
    notifyListeners();
  }
}
