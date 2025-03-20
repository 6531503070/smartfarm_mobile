import 'package:google_fonts/google_fonts.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class Settings {
  static final locale = ValueNotifier(Locale('en', 'EN'));

  static final listOfAppTheme = [
    ColorSchemes.lightGreen().copyWith(
      // Modify
      background: const Color(0xffF0F0D7),
      secondary: const Color.fromARGB(255, 255, 255, 255),

    ), // Lightmode
    ColorSchemes.darkGreen().copyWith(
      // Modify

    ), // Darkmode
  ];

  // App Theme
  static final appTheme = ValueNotifier(listOfAppTheme[0]); // shadcn
  static final appFont = ValueNotifier(GoogleFonts.nunito(
    // fontSize: 16.0,
    // fontWeight: FontWeight.normal,
    color: appTheme.value.foreground,
  )); // shadcn

  // Zones Management
  static final selectedZoneIndex = ValueNotifier(0);
  static final listOfZones = ValueNotifier([
    'Zone 1',
    // 'Zone 2',
    // 'Zone 3',
    // 'Zone 4'
  ]);
}
