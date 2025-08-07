import 'dart:developer';

import 'package:intl_phone_field/countries.dart';

class PhoneService {
  static PhoneLength? phoneLength({required String dialCode}) {
    PhoneLength length = PhoneLength(minLength: 4, maxLength: 15);

    try {
      final country = countries
          .firstWhere((el) => el.dialCode == dialCode.replaceAll('+', ''));

      length.minLength = country.minLength;
      length.maxLength = country.maxLength;

      return length;
    } catch (e) {
      log('$PhoneService:: @phoneLength => $e');
      return length;
    }
  }
}

class PhoneLength {
  int minLength;
  int maxLength;

  PhoneLength({required this.minLength, required this.maxLength});

  @override
  String toString() {
    return 'MinLength: $minLength  - MaxLength: $maxLength';
  }
}
