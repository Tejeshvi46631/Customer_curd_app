class Address {
  String addressLine1;
  String addressLine2;
  String postcode;
  String state;
  String city;

  Address({
    required this.addressLine1,
    required this.addressLine2,
    required this.postcode,
    required this.state,
    required this.city,
  });

  Map<String, dynamic> toJson() => {
        'addressLine1': addressLine1,
        'addressLine2': addressLine2,
        'postcode': postcode,
        'state': state,
        'city': city,
      };

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressLine1: json['addressLine1'],
        addressLine2: json['addressLine2'],
        postcode: json['postcode'],
        state: json['state'],
        city: json['city'],
      );
}

class Customer {
  String pan;
  String fullName;
  String email;
  String mobileNumber;
  List<Address> addresses;

  Customer({
    required this.pan,
    required this.fullName,
    required this.email,
    required this.mobileNumber,
    required this.addresses,
  });

  Map<String, dynamic> toJson() => {
        'pan': pan,
        'fullName': fullName,
        'email': email,
        'mobileNumber': mobileNumber,
        'addresses': addresses.map((address) => address.toJson()).toList(),
      };

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        pan: json['pan'],
        fullName: json['fullName'],
        email: json['email'],
        mobileNumber: json['mobileNumber'],
        addresses: (json['addresses'] as List)
            .map((item) => Address.fromJson(item))
            .toList(),
      );
}