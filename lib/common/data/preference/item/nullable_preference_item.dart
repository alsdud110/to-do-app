import 'package:to_do_list/common/data/preference/item/preference_item.dart';

class NullablePreferenceItem<T> extends PreferenceItem<T?> {
  NullablePreferenceItem(String key, [T? defaultValue])
      : super(key, defaultValue);
}
