import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smartfarm_mobile/ui/route/contact_page.dart';
import 'package:smartfarm_mobile/ui/route/control_page.dart';
import 'package:smartfarm_mobile/ui/route/data_page.dart';
import 'package:smartfarm_mobile/ui/route/home_page.dart';
import 'package:smartfarm_mobile/ui/route/login_page.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState? get navigator => navigatorKey.currentState;

  // Navigate to a specific page and clear the stack
  static void navigateToPage(Widget page, {String? routeName}) {
    navigator?.pushAndRemoveUntil(
      PageTransition(
        type: PageTransitionType.fade,
        child: page,
      ),
      (route) => false, // Remove all previous routes
    );
  }

  // Navigate to home and clear stack
  static void navigateToHome() {
    navigateToPage(const HomePage(), routeName: '/home');
  }

  // Navigate to control page and clear stack
  static void navigateToControl() {
    navigateToPage(const ControlPage(), routeName: '/control');
  }

  // Navigate to data page and clear stack
  static void navigateToData() {
    navigateToPage(const DataPage(), routeName: '/data');
  }

  // Navigate to login and clear stack
  static void navigateToLogin() {
    navigateToPage(const LoginPage(), routeName: '/login');
  }

  // Navigate to contact page (keep in stack for back navigation)
  static void navigateToContact(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: const ContactPage(),
      ),
    );
  }

  // Go back
  static void goBack() {
    navigator?.pop();
  }

  // Check if can go back
  static bool canGoBack() {
    return navigator?.canPop() ?? false;
  }
}
