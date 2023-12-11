import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeBox {
  // crerate singelton instance
  static final ThemeBox instance = ThemeBox._();
  ThemeBox._();

  late final Box<bool> _box;

  static const String hiveBoxName = 'theme_box';
  final String key = 'theme-colour';
  Future<void> init() async {
    _box = await Hive.openBox<bool>(hiveBoxName);
  }

  // lstenable
  ValueListenable<Box<bool>> listenable() => _box.listenable();

  // update
  Future<void> put(bool value) async => await _box.put(key, value);

  // get value from key
  bool? get() => _box.get(key);
}
