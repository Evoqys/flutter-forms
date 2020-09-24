String emailValidator(String value) {
  Pattern pattern = r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
  RegExp emailRegex = new RegExp(pattern);

  if(value.trim().isEmpty) return '*Required';
  if(!emailRegex.hasMatch(value)) {
    return 'Enter a valid email';
  }
  return null;
}

String passwordValidator(String value) {
  Pattern passPattern = r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
  RegExp passwordRegex = new RegExp(passPattern);
  if(value.isEmpty) return '*Required';
  if(value.length < 6) {
    return  'Should be longer than six characters';
  }
  if(!passwordRegex.hasMatch(value)) {
    return 'Password must contain at least a letter, a 1number.';
  }
  return null;
}