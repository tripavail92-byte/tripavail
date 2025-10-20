import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart' as geo;

class LocationResult {
  final double latitude;
  final double longitude;
  final String? city;
  final String? country;
  final String? formatted;

  const LocationResult({
    required this.latitude,
    required this.longitude,
    this.city,
    this.country,
    this.formatted,
  });
}

class LocationService {
  static Future<bool> _ensurePermission() async {
    bool serviceEnabled =
        await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    LocationPermission permission =
        await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  static Future<LocationResult?>
  getCurrentLocation() async {
    final ok = await _ensurePermission();
    if (!ok) return null;
    final Position pos =
        await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );
    String? city;
    String? country;
    String? formatted;
    try {
      final placemarks = await geo.placemarkFromCoordinates(
        pos.latitude,
        pos.longitude,
      );
      if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        city = p.locality?.isNotEmpty == true
            ? p.locality
            : p.administrativeArea;
        country = p.country;
        formatted = [p.street, p.subLocality, city, country]
            .where(
              (e) => (e != null && e.trim().isNotEmpty),
            )
            .join(', ');
      }
    } catch (_) {}
    return LocationResult(
      latitude: pos.latitude,
      longitude: pos.longitude,
      city: city,
      country: country,
      formatted: formatted,
    );
  }
}
