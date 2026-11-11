
import 'package:flutter/foundation.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {

  // Cruise Destination Data
  final CruiseDestination destination = const CruiseDestination(
    name: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description:
    'Experience the beauty of the Rajang River, '
        'Malaysia\'s longest river. Explore historic temples, '
        'traditional waterfront settlements, and enjoy '
        'the beautiful scenery of Sibu, Sarawak.',
    imagePath: 'assets/images/rajang_river.jpg',
    packages: [
      'Private River Cruise',
      'Sunset Cruise',
      'Sunrise Cruise',
      'Rural Cruise',
      'SMI Park Cruise',
    ],
  );

  // Variables
  DateTime? _visitDate;
  String _selectedPackage = 'Private River Cruise';
  bool _isDarkMode = false;
  int _starCount = 43;
  bool _hasRated = false;

  // Getters
  DateTime? get visitDate => _visitDate;

  String get selectedPackage => _selectedPackage;

  bool get isDarkMode => _isDarkMode;

  int get starCount => _starCount;

  bool get hasRated => _hasRated;

  // Select Visit Date
  void setVisitDate(DateTime date) {
    _visitDate = date;
    notifyListeners();
  }

  // Select Cruise Package
  void setPackage(String package) {
    _selectedPackage = package;
    notifyListeners();
  }

  // Toggle Dark Mode
  void setDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  // Dynamic Star Rating
  void toggleRating() {
    if (_hasRated) {
      _starCount--;
      _hasRated = false;
    } else {
      _starCount++;
      _hasRated = true;
    }

    notifyListeners();
  }
}
