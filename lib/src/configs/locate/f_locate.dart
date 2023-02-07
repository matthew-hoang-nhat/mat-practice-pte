import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
part 'en_us.dart';
part 'vi_vn.dart';

enum FLanguage { en, vi }

class FLocate {
  var _str = _enUS;

  String str(String key) {
    return _str[key] ?? 'Error NOT FOUND';
  }

  changeLanguage(FLanguage language) {
    switch (language) {
      case FLanguage.en:
        _str = _enUS;
        break;
      case FLanguage.vi:
        // _str = _viVN;
        break;
      default:
    }
  }
}
