import 'package:mat_practice_pte/src/configs/locate/ma_local_key.dart';
part 'en_us.dart';
part 'vi_vn.dart';

enum MaLanguage { en, vi }

class MaLocate {
  var _str = _enUS;

  String str(String key) {
    return _str[key] ?? 'Error NOT FOUND';
  }

  changeLanguage(MaLanguage language) {
    switch (language) {
      case MaLanguage.en:
        _str = _enUS;
        break;
      case MaLanguage.vi:
        // _str = _viVN;
        break;
      default:
    }
  }
}
