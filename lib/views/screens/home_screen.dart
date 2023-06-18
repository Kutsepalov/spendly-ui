import 'package:flutter/material.dart';
import 'package:spendly/views/utils/enums/route.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () =>
                Navigator.pushNamed(context, RouteDirectory.accounts.directory),
            child: const Text('Accounts')),
      ),
    );
  }
}
