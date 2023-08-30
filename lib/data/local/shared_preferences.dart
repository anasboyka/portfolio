// import 'package:shared_preferences/shared_preferences.dart';

// class Spreferences {
//   static SharedPreferences? _preferences;
//   static const _justUpdated = 'justUpdated';
//   static const _versionNumber = 'versionNumber';

//   static Future init() async =>
//       _preferences = await SharedPreferences.getInstance();

//   static Future setVersionNumber(String version) async =>
//       await _preferences!.setString(_versionNumber, version);
//   static String? getVersionNumber() => _preferences!.getString(_versionNumber);

//   static Future setUpdated(bool updated) async =>
//       await _preferences!.setBool(_justUpdated, updated);
//   static bool? getUpdated() => _preferences!.getBool(_justUpdated);
// }
