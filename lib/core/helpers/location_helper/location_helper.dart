import 'package:location/location.dart';

 class LocationHelper {
  final Location _location = Location();

  Future<bool> locationServicePermission() async {
    bool isServiceEnabled = await _location.serviceEnabled();
    if (isServiceEnabled) return isServiceEnabled;
    isServiceEnabled = await _location.requestService();
    if (isServiceEnabled) {
      return isServiceEnabled;
    } else {
      throw LocationServiceException();
    }
  }

  Future<bool> locationPermission() async {
    PermissionStatus permissionStatus = await _location.hasPermission();
    if (permissionStatus == PermissionStatus.granted) return true;
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await _location.requestPermission();
      return permissionStatus == PermissionStatus.granted;
    } else {
      throw LocationPermissionException();
    }
  }

  void onLocationChanged(void Function(LocationData)? onData) async {
    await locationServicePermission();
    await locationServicePermission();
    _location.onLocationChanged.listen(onData);
  }

  Future<LocationData> getCurrentLocation() async {
    await locationServicePermission();
    await locationPermission();
    return _location.getLocation();
  }
}

class LocationServiceException implements Exception {}

class LocationPermissionException implements Exception {}
