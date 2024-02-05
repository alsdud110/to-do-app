import 'package:to_do_list/common/data/preference/item/nullable_preference_item.dart';
import 'package:to_do_list/common/theme/custom_theme.dart';

class Prefs {
  static final appTheme = NullablePreferenceItem<CustomTheme>('appTheme');
}
