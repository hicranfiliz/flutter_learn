import 'package:flutter_learn/202/cache/shared_not_initialized.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter, users }

// burada key -> counter
class SharedManager {
  SharedPreferences? prefs;

  SharedManager();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (prefs == null) {
      throw SharedNotInitializedException();
    }
  }

  Future<void> saveStringValue(SharedKeys key, String value) async {
    _checkPreferences();
    // Save an integer value to 'counter' key.
    await prefs?.setString(key.name, value);
  }

// ornegin bu sekilde int value'leri kaydedebilirim.
  // Future<void> saveIntValue(SharedKeys key, String value) async {
  //   _checkPreferences();
  //   // Save an integer value to 'counter' key.
  //   await prefs?.setString(key.name, value);
  // }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkPreferences();
    // Save an integer value to 'counter' key.
    await prefs?.setStringList(key.name, value);
  }

// peki ben bu save'lemeyi model seviyesine nasil cikartirim??
// UserCache klasoru!!!
  List<String>? getStrings(SharedKeys key) {
    _checkPreferences();
    // Save an integer value to 'counter' key.
    return prefs?.getStringList(key.name);
  }

// getString bir future request degil. Yani ben datayi direkt key'den okuyabiliyorum.
  String? getString(SharedKeys key) {
    _checkPreferences();

    // Try reading data from the 'counter' key. If it doesn't exist, returns null.

    return prefs?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPreferences();

    // Save an integer value to 'counter' key.
    return (await prefs?.remove(key.name)) ?? false;
  }
}
