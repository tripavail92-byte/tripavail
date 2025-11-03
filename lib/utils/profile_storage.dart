import 'package:shared_preferences/shared_preferences.dart';

class ProfileStorage {
  static const _keyLat = 'user_latitude';
  static const _keyLng = 'user_longitude';
  static const _keyCity = 'user_city';
  static const _keyLocationLabel = 'user_location_label';

  static Future<void> saveLocation({
    required double latitude,
    required double longitude,
    String? city,
    String? label,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_keyLat, latitude);
    await prefs.setDouble(_keyLng, longitude);
    if (city != null) await prefs.setString(_keyCity, city);
    if (label != null) {
      await prefs.setString(_keyLocationLabel, label);
    }
  }

  static Future<
    ({
      double? lat,
      double? lng,
      String? city,
      String? label,
    })
  >
  readLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final lat = prefs.getDouble(_keyLat);
    final lng = prefs.getDouble(_keyLng);
    final city = prefs.getString(_keyCity);
    final label = prefs.getString(_keyLocationLabel);
    return (lat: lat, lng: lng, city: city, label: label);
  }
}
