import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future set(String key, dynamic value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    if (value is String || value is int || value is double || value is bool) {
      // Jika nilai adalah tipe data primitif, langsung simpan
      return pref.setString(key, value.toString());
    } else {
      // Jika nilai adalah map, encode menjadi JSON dan simpan
      return pref.setString(key, jsonEncode(value));
    }
  }

  Future<String?> get(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getString(key);
  }

  Future setUserID(int value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setInt("userID", value);
  }

  Future<int?> getUserID() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt("userID");
  }

  Future logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  Future<void> deleteKey(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
