import 'package:customer_crud_app/widgets/adress_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/customer_provider.dart';
import '../models/customer.dart';
import '../utills/validation.dart';
import '../services/api_service.dart';
import '../widgets/cutomer_form/EmailTextFormField.dart';
import '../widgets/cutomer_form/FullNameTextFormField.dart';
import '../widgets/cutomer_form/MobileTextFormField.dart';
import '../widgets/cutomer_form/PanTextFormField.dart';
import '../widgets/cutomer_form/SaveButton.dart';

class CustomerFormScreen extends StatefulWidget {
  final Customer? customer;
  final int? index;

  CustomerFormScreen({this.customer, this.index});

  @override
  _CustomerFormScreenState createState() => _CustomerFormScreenState();
}

class _CustomerFormScreenState extends State<CustomerFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _panController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  List<Address> _addresses = [
    Address(
        addressLine1: '', addressLine2: '', postcode: '', state: '', city: '')
  ];
  bool _isLoading = false;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    if (widget.customer != null) {
      _panController.text = widget.customer!.pan;
      _fullNameController.text = widget.customer!.fullName;
      _emailController.text = widget.customer!.email;
      _mobileController.text = widget.customer!.mobileNumber;
      _addresses = widget.customer!.addresses;
    }
  }

  Future<void> _verifyPan(String pan) async {
    setState(() {
      _isLoading = true;
    });
    final data = await _apiService.verifyPan(pan);

    setState(() {
      _isLoading = false;
    });
    if (data != null && data['isValid']) {
      setState(() {
        _fullNameController.text = data['fullName'];
      });
    }
  }

  Future<void> _getPostcodeDetails(String postcode, int index) async {
    setState(() {
      _isLoading = true;
    });
    final data = await _apiService.getPostcodeDetails(postcode);

    setState(() {
      _isLoading = false;
    });
    if (data != null && data['status'] == 'Success') {
      setState(() {
        _addresses[index].city = data['city'][0]['name'];
        _addresses[index].state = data['state'][0]['name'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.customer == null ? 'Add Customer' : 'Edit Customer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              PanTextFormField(
                controller: _panController,
                isLoading: _isLoading,
                onChanged: (value) {
                  if (Validation.validatePan(value) == null) {
                    _verifyPan(value);
                  }
                },
              ),
              FullNameTextFormField(controller: _fullNameController),
              EmailTextFormField(controller: _emailController),
              MobileTextFormField(controller: _mobileController),
              ..._addresses.map((address) {
                int index = _addresses.indexOf(address);
                return AddressForm(
                  address: address,
                  onPostcodeChanged: (postcode) {
                    if (Validation.validatePostcode(postcode) == null) {
                      _getPostcodeDetails(postcode, index);
                    }
                  },
                );
              }).toList(),
              if (_addresses.length < 10)
                TextButton(
                  onPressed: () {
                    setState(() {
                      _addresses.add(Address(
                        addressLine1: '',
                        addressLine2: '',
                        postcode: '',
                        state: '',
                        city: '',
                      ));
                    });
                  },
                  child: Text('Add Address'),
                ),
              SizedBox(height: 20),
              SaveButton(
                formKey: _formKey,
                customer: Customer(
                  pan: _panController.text,
                  fullName: _fullNameController.text,
                  email: _emailController.text,
                  mobileNumber: _mobileController.text,
                  addresses: _addresses,
                ),
                customerProvider:
                    Provider.of<CustomerProvider>(context, listen: false),
                index: widget.index,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
