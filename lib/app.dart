import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smartfarm_mobile/gen_l10n/l10n.dart';
import 'package:smartfarm_mobile/ui/route/contact_page.dart';
import 'package:smartfarm_mobile/ui/route/control_page.dart';
import 'package:smartfarm_mobile/ui/route/data_page.dart';
import 'package:smartfarm_mobile/ui/route/home_page.dart';
import 'package:smartfarm_mobile/ui/route/login_page.dart';

class App extends StatefulHookWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // Example: Using a hook to manage a counter state (if needed)
    // final counter = useState<int>(0);

    return MaterialApp(
      title: 'Doitung Smart Farming',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(), // Starter-Page
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/data': (context) => const DataPage(),
        '/control': (context) => const ControlPage(),
        '/contact': (context) => const ContactPage(),
      },
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('th', ''), // Thai
      ],
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}