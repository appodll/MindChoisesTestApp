import 'dart:convert';
import 'package:mindchoises_test_app/core/base/stroge/stroge_contract.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StrogeRepository implements StrogeContract {
  @override
  Future get(key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  @override
  Future<void> remove(key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  @override
  Future<void> save(key, value) async {
    final prefs = await SharedPreferences.getInstance();

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else if (value is Map || value is List) {
      await prefs.setString(key, jsonEncode(value));
    } else {
      throw Exception("Unsupported cache type: ${value.runtimeType}");
    }
  }

  @override
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}