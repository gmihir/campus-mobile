import 'package:campus_mobile_experimental/app_constants.dart';
import 'package:campus_mobile_experimental/core/models/availability.dart';
import 'package:campus_mobile_experimental/core/providers/user.dart';
import 'package:campus_mobile_experimental/core/services/availability.dart';
import 'package:flutter/material.dart';

class OfficeEnvironmentDataProvider extends ChangeNotifier {
  OfficeEnvironmentDataProvider() {
    /// DEFAULT STATES
    _isLoading = false;

  }

  /// STATES
  bool _isLoading;
  DateTime _lastUpdated;
  String _error;
  Map<String, bool> _locationViewState = <String, bool>{};
  UserDataProvider _userDataProvider;


  void fetchData() async {
    _isLoading = false;
    notifyListeners();
  }


  /// SIMPLE GETTERS
  bool get isLoading => _isLoading;

  String get error => _error;

  DateTime get lastUpdated => _lastUpdated;

  Map<String, bool> get locationViewState => _locationViewState;


}
