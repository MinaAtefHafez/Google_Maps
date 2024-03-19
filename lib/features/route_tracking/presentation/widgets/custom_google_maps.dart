import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_map/core/dependency_injection/dependency_injection.dart';
import 'package:google_map/features/route_tracking/logic/cubit/route_tracking_cubit.dart';
import 'package:google_map/features/route_tracking/logic/cubit/route_tracking_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class CustomGoogleMaps extends StatefulWidget {
  const CustomGoogleMaps({super.key});

  @override
  State<CustomGoogleMaps> createState() => _CustomGoogleMapsState();
}

class _CustomGoogleMapsState extends State<CustomGoogleMaps> {
  final routeTrackingCubit = di<RouteTrackingCubit>();
  late GoogleMapController googleMapController;
  late CameraPosition initialCameraPosition;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  @override
  void initState() {
    super.initState();

    initialCameraPosition =
        const CameraPosition(target: LatLng(29, 31), zoom: 7);
  }

  void mapAnimate(
      {required double lat, required double long, required String markerId}) {
    final LatLng newLatLng = LatLng(lat, long);
    final Marker newMarker = Marker(
      markerId: MarkerId(markerId),
    );
    markers.add(newMarker);
    setState(() {});
    googleMapController.animateCamera(CameraUpdate.newLatLng(newLatLng));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RouteTrackingCubit, RouteTrackingState>(
      bloc: routeTrackingCubit,
      listener: (context, state) {
        if (state is GetCurrnetLocationLoaded) {
          updateMyLocation(state.locationData);
        }

        if (state is GetRoutesLoaded) {
          log(state.routesModel.routes!.first.polyline!.encodedPolyline!);
          showRouteBetweenTowPoints(
              state.routesModel.routes!.first.polyline!.encodedPolyline!);
        }
      },
      child: GoogleMap(
          markers: markers,
          onMapCreated: (controller) {
            googleMapController = controller;
            routeTrackingCubit.getCurrentLocation();
          },
          initialCameraPosition: initialCameraPosition),
    );
  }

  void showRouteBetweenTowPoints(String polylineDecoded) {
    final List<PointLatLng> pointsLatLng =
        PolylinePoints().decodePolyline(polylineDecoded);
    final List<LatLng> routePoints =
        pointsLatLng.map((e) => LatLng(e.latitude, e.longitude)).toList();
    final Polyline route = Polyline(
        polylineId: const PolylineId('route'),
        points: routePoints,
        color: Colors.blue,
        width: 10);
    polylines.add(route);
    setState(() {});
  }

  void updateMyLocation(LocationData locationData) async {
    final myLatLng = LatLng(locationData.latitude!, locationData.longitude!);
    final marker =
        Marker(markerId: const MarkerId('currentLocation'), position: myLatLng);
    markers.add(marker);
    setState(() {});
    googleMapController.animateCamera(CameraUpdate.newLatLng(myLatLng));
  }
}
