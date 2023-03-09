class AppDefineConstants {
  static const empty = '#';
  static const wrong = 'x';

  static bool isSignatureEmpty(String value) =>
      value == empty || value == '$empty,';
}
