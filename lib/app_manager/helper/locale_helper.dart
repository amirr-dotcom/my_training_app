import 'package:easy_localization/easy_localization.dart';

class LocaleHelper {
  static app (key) => 'app'.tr(gender: key);
  static common (key) => 'common'.tr(gender: key);
  static homeScreen (key) => 'home_screen'.tr(gender: key);
  static sortAndFilters (key) => 'sort_and_filters'.tr(gender: key);
}