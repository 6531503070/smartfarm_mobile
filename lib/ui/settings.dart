import 'package:shadcn_flutter/shadcn_flutter.dart';

class Settings {
  static final locale = ValueNotifier(Locale('en', 'EN'));

  // App Theme
  static final appTheme = ValueNotifier(ColorSchemes.lightGreen()); // shadcn

  // Zones Mangement
  static final selectedZoneIndex = ValueNotifier(0);
  static final listOfZones = ValueNotifier([
    'Zone 1',
    'Zone 2',
    'Zone 3',
    'Zone 4'
  ]);
}