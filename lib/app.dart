import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smartfarm_mobile/gen_l10n/l10n.dart';
import 'package:smartfarm_mobile/ui/settings.dart';
import 'package:smartfarm_mobile/ui/route/contact_page.dart';
import 'package:smartfarm_mobile/ui/route/control_page.dart';
import 'package:smartfarm_mobile/ui/route/data_page.dart';
import 'package:smartfarm_mobile/ui/route/home_page.dart';
import 'package:smartfarm_mobile/ui/route/login_page.dart';
import 'package:smartfarm_mobile/util/navigation_service.dart';

class App extends HookWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentLocale = useValueListenable(Settings.appLocalization);
    final currentAppTheme = useValueListenable(Settings.appTheme);
    final currentAppTypography = useValueListenable(Settings.appTypography);

    return ShadcnApp(
      navigatorKey: NavigationService.navigatorKey,
      locale: currentLocale,
      title: 'Doitung Smart Farming',
      theme: ThemeData(
        colorScheme: currentAppTheme,
        typography: currentAppTypography,
        radius: 0.4,
      ),

      home: const LoginPage(), // Starter-Page
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/data': (context) => const DataPage(),
        '/control': (context) => const ControlPage(),
        '/contact': (context) => const ContactPage(),
      },

      supportedLocales: const [
        Locale('en', 'EN'), // English
        Locale('th', 'TH'), // Thai
        Locale('my', 'MY'), // Myanmar
      ],

      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
