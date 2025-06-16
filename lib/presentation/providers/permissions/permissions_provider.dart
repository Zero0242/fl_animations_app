// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final permissionsProvider =
    StateNotifierProvider<PermissionNotifier, PermissionState>((ref) {
      return PermissionNotifier();
    });

class PermissionNotifier extends StateNotifier<PermissionState> {
  PermissionNotifier() : super(PermissionState()) {
    checkPermissions();
  }

  Future<void> checkPermissions() async {
    final permissionsArray = await Future.wait([
      Permission.camera.status,
      Permission.mediaLibrary.status,
      Permission.sensors.status,
      Permission.location.status,
      Permission.locationAlways.status,
      Permission.locationWhenInUse.status,
    ]);

    state = state.copyWith(
      camera: permissionsArray[0],
      photoLibrary: permissionsArray[1],
      sensors: permissionsArray[2],
      location: permissionsArray[3],
      locationAlways: permissionsArray[4],
      locationWhenInUse: permissionsArray[5],
    );
  }

  Future<bool> openSettingsScreen() => openAppSettings();

  void _checkPermissionState(PermissionStatus status) {
    if (status == PermissionStatus.permanentlyDenied) {
      openSettingsScreen();
    }
  }

  Future<void> requestCameraAccess() async {
    final status = await Permission.camera.request();
    state = state.copyWith(camera: status);
    _checkPermissionState(status);
  }

  Future<void> requestLocationAccess() async {
    final status = await Permission.location.request();
    state = state.copyWith(location: status);
    _checkPermissionState(status);
  }

  Future<void> requestSensorsAccess() async {
    final status = await Permission.sensors.request();
    state = state.copyWith(sensors: status);
    _checkPermissionState(status);
  }

  Future<void> requestGalleryAccess() async {
    final status = await Permission.mediaLibrary.request();
    state = state.copyWith(photoLibrary: status);
    _checkPermissionState(status);
  }
}

class PermissionState {
  final PermissionStatus camera;
  final PermissionStatus photoLibrary;
  final PermissionStatus sensors;
  final PermissionStatus location;
  final PermissionStatus locationAlways;
  final PermissionStatus locationWhenInUse;

  PermissionState({
    this.camera = PermissionStatus.denied,
    this.photoLibrary = PermissionStatus.denied,
    this.sensors = PermissionStatus.denied,
    this.location = PermissionStatus.denied,
    this.locationAlways = PermissionStatus.denied,
    this.locationWhenInUse = PermissionStatus.denied,
  });

  PermissionState copyWith({
    PermissionStatus? camera,
    PermissionStatus? photoLibrary,
    PermissionStatus? sensors,
    PermissionStatus? location,
    PermissionStatus? locationAlways,
    PermissionStatus? locationWhenInUse,
  }) => PermissionState(
    camera: camera ?? this.camera,
    photoLibrary: photoLibrary ?? this.photoLibrary,
    sensors: sensors ?? this.sensors,
    location: location ?? this.location,
    locationAlways: locationAlways ?? this.locationAlways,
    locationWhenInUse: locationWhenInUse ?? this.locationWhenInUse,
  );

  bool get cameraGranted {
    return camera == PermissionStatus.granted;
  }

  bool get photoLibraryGranted {
    return photoLibrary == PermissionStatus.granted;
  }

  bool get sensorsGranted {
    return sensors == PermissionStatus.granted;
  }

  bool get locationGranted {
    return location == PermissionStatus.granted;
  }

  bool get locationAlwaysGranted {
    return locationAlways == PermissionStatus.granted;
  }

  bool get locationWhenInUseGranted {
    return locationWhenInUse == PermissionStatus.granted;
  }
}
