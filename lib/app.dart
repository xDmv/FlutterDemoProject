import 'package:example_app/generated/l10n.dart';
import 'package:example_app/pages/standard_functions/dialogs_page.dart';
import 'package:example_app/pages/standard_functions/standard_functions_page.dart';
import 'package:example_app/pages/third_party_services/auth/auth_email.dart';
import 'package:example_app/pages/main_page.dart';
import 'package:example_app/pages/sensors_example/sensors_example.dart';
import 'package:example_app/pages/splash_page.dart';
import 'package:example_app/pages/third_party_services/maps/maps_page.dart';
import 'package:example_app/pages/third_party_services/stripe/stripe_example_page.dart';
import 'package:example_app/pages/third_party_services/third_party_services_page.dart';
import 'package:example_app/pages/standard_functions/widgets_page.dart';
import 'package:example_app/pages/work_with_database/database_example_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.path,
      routes: <String, WidgetBuilder>{
        SplashPage.path: (context) => const SplashPage(),
        MainPage.path: (context) => const MainPage(),
        AuthEmailPage.path: (context) => const AuthEmailPage(),
        WidgetsPage.path: (context) => WidgetsPage(),
        MapsPage.path: (context) => MapsPage(),
        StandardFunctionsPage.path: (context) => StandardFunctionsPage(),
        StripeExamplePage.path: (context) => StripeExamplePage(),
        ThirdPartyServicesPage.path: (context) => ThirdPartyServicesPage(),
        DatabaseExamplePage.path: (context) => DatabaseExamplePage(),
        SensorsExamplePage.path: (context) => SensorsExamplePage(),
        DialogsPage.path: (context) => DialogsPage(),
      },
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
