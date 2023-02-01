import 'package:mat_practice_pte/src/configs/locate/ma_local_key.dart';
part 'en_us.dart';
part 'vi_vn.dart';

enum MaLanguage { en, vi }

class MaLocate {
  late var getStr = _enUS;
  changeLanguage(MaLanguage language) {
    switch (language) {
      case MaLanguage.en:
        getStr = _enUS;
        break;
      case MaLanguage.vi:
        getStr = _viVN;
        break;
      default:
    }
  }
}
