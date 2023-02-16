class Validates {
  static bool validUserName(String value) {
    String pattern = r"^[A-Za-z][A-Za-z0-9_]{5,11}$";
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool validPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static bool invalidateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return true;
    } else {
      return false;
    }
  }
}
