import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:example_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SensorsExamplePage extends StatefulWidget {
  const SensorsExamplePage({super.key});

  static const path = '/sensorsExample';

  @override
  _SensorsExamplePageState createState() => _SensorsExamplePageState();
}

class _SensorsExamplePageState extends State<SensorsExamplePage>
    with WidgetsBindingObserver {
  late final GoogleMapController _controller;

  static const CameraPosition _kyivCenter = CameraPosition(
    target: LatLng(50.444798, 30.521361),
    zoom: 13,
  );

  AppLifecycleState? prevState;
  bool geopisitionIsGranted = false;
  Position? currentUserPosition;

  @override
  void initState() {
    super.initState();
    Geolocator.getServiceStatusStream().listen((event) {
      if (event == ServiceStatus.disabled) {
        _enableGpsDialog();
      }
    });
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed &&
        state != prevState &&
        prevState != null) {
      _checkPermissions();
    }

    prevState = state;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).useOfSensors),
        centerTitle: true,
      ),
      body: GoogleMap(
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: _kyivCenter,
        minMaxZoomPreference: const MinMaxZoomPreference(5, 18),
        onMapCreated: (GoogleMapController controller) async {
          _controller = controller;
          checkLocationPermissions()
              .then((value) => _checkLocationPermissionsResultOnInit());
        },
      ),
    );
  }

  Future<void> _checkLocationPermissionsResultOnInit() async {
    if (geopisitionIsGranted) {
      await _moveToUserPosition();
    } else {
      await requestLocationPermissions();
      if (geopisitionIsGranted) {
        await _moveToUserPosition();
      } else {
        WidgetsBinding.instance.addObserver(this);
        _openDeniedLocationPermissionDialog();
      }
    }
  }

  Future<void> _checkPermissions() async {
    await checkLocationPermissions();
    if (geopisitionIsGranted) {
      await _moveToUserPosition();
    } else {
      _openDeniedLocationPermissionDialog();
    }
  }

  Future<void> checkLocationPermissions() async {
    final permission = await Geolocator.checkPermission();

    geopisitionIsGranted = permission != LocationPermission.denied &&
        permission != LocationPermission.deniedForever;
  }

  /// when need check location permissions - use this function first
  /// and only after then [checkLocationPermissions]
  Future<void> requestLocationPermissions() async {
    final permission = await Geolocator.requestPermission();

    geopisitionIsGranted = permission != LocationPermission.denied &&
        permission != LocationPermission.deniedForever;
  }

  Future<bool> isLocationServiceEnabled() async {
    return Geolocator.isLocationServiceEnabled();
  }

  Future<void> loadLastUserLocation() async {
    currentUserPosition = await Geolocator.getLastKnownPosition();
  }

  Future<void> _openDeniedLocationPermissionDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).attantion),
          content: Text(S.of(context).locationPermissions),
          actions: [
            TextButton(
              child: Text(S.of(context).cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(S.of(context).settings),
              onPressed: () {
                Navigator.of(context).pop();
                AppSettings.openLocationSettings();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _moveToUserPosition() async {
    if (await isLocationServiceEnabled()) {
      await loadLastUserLocation();
      if (currentUserPosition?.latitude != null &&
          currentUserPosition?.longitude != null) {
        _controller.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                currentUserPosition?.latitude ?? 0,
                currentUserPosition?.longitude ?? 0,
              ),
              zoom: 12,
            ),
          ),
        );
      }
    } else {
      await _enableGpsDialog();
    }
  }

  Future<void> _enableGpsDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).attantion),
          content: Text(S.of(context).enableGps),
          actions: [
            TextButton(
              child: Text(S.of(context).cancel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
