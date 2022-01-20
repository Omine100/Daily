RegExp _name = RegExp(r"^[a-zA-Z0-9]{3,10}$");
RegExp _email = RegExp(
    r"^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$");
//Minimum eight and maximum 16 characters, at least one uppercase letter, one lowercase letter, one number and one special character
RegExp _password =
    RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,16}$");

RegExp _alpha = RegExp(r'^[a-zA-Z]+$');
RegExp _alphanumeric = RegExp(r'^[a-zA-Z0-9]+$');
RegExp _numeric = RegExp(r'^-?[0-9]+$');

bool isEmail(String str) {
  return _email.hasMatch(str.toLowerCase());
}

bool isPassword(String str) {
  return _password.hasMatch(str);
}

bool isName(String str) {
  return _name.hasMatch(str);
}

bool isNumeric(String str) {
  return _numeric.hasMatch(str);
}

bool isAlphanumeric(String str) {
  return _alphanumeric.hasMatch(str);
}

bool isLowercase(String str) {
  return str == str.toLowerCase();
}

bool isUppercase(String str) {
  return str == str.toUpperCase();
}

bool isDate(String str) {
  try {
    DateTime.parse(str);
    return true;
  } catch (e) {
    return false;
  }
}

//If `date` is not passed, it defaults to now.
bool isDateAfter(String str, [date]) {
  if (date == null) {
    date = DateTime.now();
  } else if (isDate(date)) {
    date = DateTime.parse(date);
  } else {
    return false;
  }

  DateTime str_date;
  try {
    str_date = DateTime.parse(str);
  } catch (e) {
    return false;
  }

  return str_date.isAfter(date);
}

//If `date` is not passed, it defaults to now.
bool isDateBefore(String str, [date]) {
  if (date == null) {
    date = DateTime.now();
  } else if (isDate(date)) {
    date = DateTime.parse(date);
  } else {
    return false;
  }

  DateTime str_date;
  try {
    str_date = DateTime.parse(str);
  } catch (e) {
    return false;
  }

  return str_date.isBefore(date);
}
