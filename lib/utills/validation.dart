class Validation {
  static String? validatePan(String? value) {
    final panRegExp = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');
    if (value == null || value.isEmpty) {
      return 'PAN is required';
    } else if (!panRegExp.hasMatch(value)) {
      return 'Invalid PAN format';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final emailRegExp = RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$');
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  static String? validateMobile(String? value) {
    final mobileRegExp = RegExp(r'^[0-9]{10}$');
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    } else if (!mobileRegExp.hasMatch(value)) {
      return 'Invalid mobile number';
    }
    return null;
  }

  static String? validatePostcode(String? value) {
    final postcodeRegExp = RegExp(r'^[0-9]{6}$');
    if (value == null || value.isEmpty) {
      return 'Postcode is required';
    } else if (!postcodeRegExp.hasMatch(value)) {
      return 'Invalid postcode';
    }
    return null;
  }
}
