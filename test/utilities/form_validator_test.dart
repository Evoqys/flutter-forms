import 'package:flutter_test/flutter_test.dart';
import 'package:forms/utilities/form_validators.dart';

void main() {
  group('Email Textfield Validation', () {
    test('Empty Email', () {
      String result = emailValidator('');
      expect(result, '*Required');
    });

    test('Invalid Email', () {
      String result = emailValidator('dcsdc');
      expect(result, 'Enter a valid email');
    });

    test('Valid Email', () {
      String result = emailValidator('a@b.com');
      expect(result, null);
    });
  });


  group('Password TextField Validation', () {
    test('Empty Password', () {
      String result = passwordValidator('');
      expect(result, '*Required');
    });

    test('Invalid Password Short of length', () {
      String result = passwordValidator('dcsdc');
      expect(result, 'Should be longer than six characters');
    });

    test('Invalid Password Missing characters', () {
      String result = passwordValidator('dcshdsdc');
      expect(result, 'Password must contain at least a letter, a 1number.');
    });

    test('Valid Password', () {
      String result = passwordValidator('Adhbds123');
      expect(result, null);
    });
  });
}