import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.topBar,
    required this.background,
    required this.bottomBar,
    required this.accent,
    required this.disabled,
    required this.error,
    required this.divider,
    required this.signIn,
    required this.signOut,
  });

  factory AppColors.light() {
    return const AppColors(
      topBar: Color(0xffFFFFFF),
      background: Color(0xffF9F9F9),
      bottomBar: Color(0xffEFEFEF),
      accent: Color(0xffBBBBBB),
      disabled: Colors.black12,
      error: Color(0xffff7466),
      divider: Colors.black54,
      signIn: Color(0xff727D73),
      signOut: Color(0xffc53829),
    );
  }

  // factory AppColors.dark() {
  //   return const AppColors(
  //   );
  // }

  final Color topBar;
  final Color background;
  final Color bottomBar;

  final Color accent;
  final Color disabled;
  final Color error;
  final Color divider;
  final Color signIn;
  final Color signOut;
}
