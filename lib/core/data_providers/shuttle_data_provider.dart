import 'package:campus_mobile_experimental/core/constants/app_constants.dart';
import 'package:campus_mobile_experimental/core/data_providers/location_data_provider.dart';
import 'package:campus_mobile_experimental/core/data_providers/user_data_provider.dart';
import 'package:campus_mobile_experimental/core/models/shuttle_arrival_model.dart';
import 'package:campus_mobile_experimental/core/models/shuttle_model.dart';
import 'package:campus_mobile_experimental/core/models/shuttle_stop_model.dart';
import 'package:flutter/material.dart';
import 'package:campus_mobile_experimental/core/services/shuttle_service.dart';
import 'package:location/location.dart';
import 'dart:math' as Math;

class ShuttleDataProvider extends ChangeNotifier {
  ShuttleDataProvider() {
    /// DEFAULT STATES
    _isLoading = false;

    /// TODO: initialize services here
    _shuttleService = ShuttleService();
    init();
  }

  bool _isLoading;
  String _error;
  UserDataProvider userDataProvider;
  ShuttleService _shuttleService;
  Location location;
  ShuttleStopModel closestStop;
  double userLat;
  double userLong;
  double stopLat;
  double stopLong;
  double closestDistance = 10000000;
  List<ShuttleStopModel> stopsToRender;
  Set<int> userStops;
  List<List<ArrivingShuttle>> arrivalsToRender;
  LocationDataProvider _locationDataProvider;

  init() {
    _locationDataProvider = LocationDataProvider();
    userDataProvider = UserDataProvider();
    _shuttleService = ShuttleService();
    location = Location();
    _locationDataProvider.locationStream.listen((event) {
      userLat = event.lat;
      userLong = event.lon;
    });
    stopsToRender = List<ShuttleStopModel>();

    // hardcoded for debugging purposes
    userStops = {34893, 434353, 4348634};

    arrivalsToRender = List<List<ArrivingShuttle>>();
  }

  void fetchStops() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    stopsToRender.clear();

    await _shuttleService.fetchData();
    // create new map of shuttles/stops to display
    print("after fetch");

    getUserStops();

    // get closest stop to current user
    await calculateClosestStop();

    print("user latitude: " + userLat.toString());
    print("user longitude: " + userLat.toString());
    print("CLOSEST STOP: " + closestStop.id.toString());


    // for debug purposes, we will only have 3 cards
    // later on, this will be replaced
    for (int i = 0; i < stopsToRender.length; i++) {
      arrivalsToRender.add(await fetchArrivalInformation(stopsToRender[i]));
    }

    // get information about stops in list
    //await getStopInformation();

    _isLoading = false;
    notifyListeners();
  }

  void getUserStops() {
    // need to get stops from user in this method

    // need to add stops to the list of stops
  }

  Future<List<ArrivingShuttle>> fetchArrivalInformation(ShuttleStopModel stop) async {
    return await _shuttleService.getArrivingInformation(stop.id);
    //notifyListeners();
  }

  Future<void> calculateClosestStop() async {
    await checkLocationPermission();
    await location.getLocation().then((value) {
      userLat = value.latitude;
      userLong = value.longitude;
    });

    print("Data - ${_shuttleService.data}");

    for(ShuttleStopModel shuttleStop in _shuttleService.data) {
      stopLat = shuttleStop.lat;
      stopLong = shuttleStop.lon;

      if(getHaversineDistance(userLat, userLong, stopLat, stopLong) < closestDistance) {
          closestDistance = getHaversineDistance(userLat, userLong, stopLat, stopLong);
          closestStop = shuttleStop;
      } else if (userStops.contains(shuttleStop.id)){
        stopsToRender.add(shuttleStop);
      }
    }
    print(closestStop.id);
    stopsToRender.insert(0,closestStop);
  }

  List<ShuttleStopModel> getAllActiveStops() {
    return _shuttleService.data;
  }

  double getHaversineDistance(lat1,lon1,lat2,lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2-lat1);  // deg2rad below
    var dLon = deg2rad(lon2-lon1);
    var a =
        Math.sin(dLat/2) * Math.sin(dLat/2) +
            Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
                Math.sin(dLon/2) * Math.sin(dLon/2)
    ;
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    var d = R * c; // Distance in km
    return d;
  }

  double deg2rad(deg) {
    return deg * (Math.pi/180);
  }

  Future<void> checkLocationPermission() async {
    // Set up new location object to get current location
    location = Location();
    location.changeSettings(accuracy: LocationAccuracy.low);
    PermissionStatus hasPermission;
    bool _serviceEnabled;

    // check if gps service is enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    //check if permission is granted
    hasPermission = await location.hasPermission();
    if (hasPermission == PermissionStatus.denied) {
      hasPermission = await location.requestPermission();
      if (hasPermission != PermissionStatus.granted) {
        return;
      }
    }
  }


  bool get isLoading => _isLoading;

  String get error => _error;
}
