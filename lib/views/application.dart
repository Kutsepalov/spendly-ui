import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spendly/views/screens/accounts_screen.dart';
import 'package:spendly/views/screens/home_screen.dart';
import 'package:spendly/views/utils/enums/route.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spendly',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/',
      routes: {
        RouteDirectory.root.directory: (context) => const HomeScreen(),
        RouteDirectory.accounts.directory: (context) => const AccountsScreen(),
      },
    );
  }
}
