import 'dart:convert';

import 'package:azteron_case/core/cache/cache_keys.dart';
import 'package:azteron_case/core/cache/cacheable_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ICacheManager {
  Future<void> init();
  bool get isInitialized;

  // String
  Future<void> setString(CacheKeys key, String? value);
  String? getString(CacheKeys key);

  // Bool
  Future<void> setBool(CacheKeys key, {required bool value});
  bool? getBool(CacheKeys key);

  // Int
  Future<void> setInt(CacheKeys key, int value);
  int? getInt(CacheKeys key);

  // Double
  Future<void> setDouble(CacheKeys key, double value);
  double? getDouble(CacheKeys key);

  // Object
  Future<void> setObject<T extends CacheableModel>(CacheKeys key, T value);
  T? getObject<T extends CacheableModel>(
    CacheKeys key,
    T Function(Map<String, dynamic>) fromJson,
  );

  // List
  Future<void> setList<T extends CacheableModel>(
    CacheKeys key,
    List<T> value,
  );
  List<T>? getList<T extends CacheableModel>(
    CacheKeys key,
    T Function(Map<String, dynamic>) fromJson,
  );

  // Remove
  Future<void> remove(CacheKeys key);
  Future<void> clear();
}

/// Singleton cache manager using SharedPreferences
class CacheManager implements ICacheManager {
  /// Factory constructor - Singleton pattern
  factory CacheManager() => _instance ??= CacheManager._internal();

  CacheManager._internal();

  static CacheManager? _instance;

  SharedPreferences? _prefs;

  @override
  bool get isInitialized => _prefs != null;

  @override
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  void _checkInit() {
    if (!isInitialized) {
      throw StateError('CacheManager not initialized. Call init() first.');
    }
  }

  @override
  Future<void> setString(CacheKeys key, String? value) async {
    _checkInit();
    if (value == null) {
      await _prefs!.remove(key.key);
    } else {
      await _prefs!.setString(key.key, value);
    }
  }

  @override
  String? getString(CacheKeys key) {
    _checkInit();
    return _prefs!.getString(key.key);
  }

  @override
  Future<void> setBool(CacheKeys key, {required bool value}) async {
    _checkInit();
    await _prefs!.setBool(key.key, value);
  }

  @override
  bool? getBool(CacheKeys key) {
    _checkInit();
    return _prefs!.getBool(key.key);
  }

  @override
  Future<void> setInt(CacheKeys key, int value) async {
    _checkInit();
    await _prefs!.setInt(key.key, value);
  }

  @override
  int? getInt(CacheKeys key) {
    _checkInit();
    return _prefs!.getInt(key.key);
  }

  @override
  Future<void> setDouble(CacheKeys key, double value) async {
    _checkInit();
    await _prefs!.setDouble(key.key, value);
  }

  @override
  double? getDouble(CacheKeys key) {
    _checkInit();
    return _prefs!.getDouble(key.key);
  }

  @override
  Future<void> setObject<T extends CacheableModel>(
    CacheKeys key,
    T value,
  ) async {
    _checkInit();
    final jsonString = jsonEncode(value.toJson());
    await _prefs!.setString(key.key, jsonString);
  }

  @override
  T? getObject<T extends CacheableModel>(
    CacheKeys key,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    _checkInit();
    final jsonString = _prefs!.getString(key.key);
    if (jsonString == null) return null;
    try {
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      return fromJson(jsonMap);
    } on Exception {
      return null;
    }
  }

  @override
  Future<void> setList<T extends CacheableModel>(
    CacheKeys key,
    List<T> value,
  ) async {
    _checkInit();
    final jsonList = value.map((e) => e.toJson()).toList();
    await _prefs!.setString(key.key, jsonEncode(jsonList));
  }

  @override
  List<T>? getList<T extends CacheableModel>(
    CacheKeys key,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    _checkInit();
    final jsonString = _prefs!.getString(key.key);
    if (jsonString == null) return null;
    try {
      final jsonList = jsonDecode(jsonString) as List;
      return jsonList
          .map((e) => fromJson(e as Map<String, dynamic>))
          .toList();
    } on Exception {
      return null;
    }
  }

  @override
  Future<void> remove(CacheKeys key) async {
    _checkInit();
    await _prefs!.remove(key.key);
  }

  @override
  Future<void> clear() async {
    _checkInit();
    await _prefs!.clear();
  }

  /// Check if key exists
  bool containsKey(CacheKeys key) {
    _checkInit();
    return _prefs!.containsKey(key.key);
  }
}
