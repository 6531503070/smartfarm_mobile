import 'package:google_fonts/google_fonts.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class Settings {
  // App Localization
  static final appLocalization = ValueNotifier(Locale('en', 'EN'));

  // App Typography
  static final appTypography = ValueNotifier(Typography.geist(
    sans: GoogleFonts.nunitoSans(color: appTheme.value.foreground),
    mono: GoogleFonts.nunito(color: appTheme.value.foreground),
    xSmall: const TextStyle(fontSize: 12),
    small: const TextStyle(fontSize: 14),
    base: const TextStyle(fontSize: 16),
    large: const TextStyle(fontSize: 18),
    xLarge: const TextStyle(fontSize: 20),
    x2Large: const TextStyle(fontSize: 24),
    x3Large: const TextStyle(fontSize: 30),
    x4Large: const TextStyle(fontSize: 36),
    x5Large: const TextStyle(fontSize: 48),
    x6Large: const TextStyle(fontSize: 60),
    x7Large: const TextStyle(fontSize: 72),
    x8Large: const TextStyle(fontSize: 96),
    x9Large: const TextStyle(fontSize: 144),
    thin: const TextStyle(fontWeight: FontWeight.w100),
    light: const TextStyle(fontWeight: FontWeight.w300),
    extraLight: const TextStyle(fontWeight: FontWeight.w200),
    normal: const TextStyle(fontWeight: FontWeight.w400),
    medium: const TextStyle(fontWeight: FontWeight.w500),
    semiBold: const TextStyle(fontWeight: FontWeight.w600),
    bold: const TextStyle(fontWeight: FontWeight.w700),
    extraBold: const TextStyle(fontWeight: FontWeight.w800),
    black: const TextStyle(fontWeight: FontWeight.w900),
    italic: const TextStyle(fontStyle: FontStyle.italic),
    h1: const TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
    h2: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
    h3: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    h4: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    p: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    blockQuote: const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic),
    inlineCode: const TextStyle(
        fontFamily: 'GeistMono', fontSize: 14, fontWeight: FontWeight.w600),
    lead: const TextStyle(fontSize: 20),
    textLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    textSmall: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    textMuted: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
  ));

  // App Theme
  static final listOfAppTheme = [
    ColorSchemes.lightGreen().copyWith(
        // @Override
        // background: const Color(0xffF0F0D7),
        // secondary: const Color.fromARGB(255, 222, 236, 199),

        ), // Lightmode
    ColorSchemes.darkGreen().copyWith(
        // @Override

        ), // Darkmode
  ];
  static final appTheme = ValueNotifier(listOfAppTheme[0]); // shadcn

  // Zones Management
  static final selectedZoneIndex = ValueNotifier(0);
  static final listOfZones = ValueNotifier([
    'Zone 1',
    // 'Zone 2',
    // 'Zone 3',
    // 'Zone 4'
  ]);
}
