import 'package:flutter/material.dart';
import 'package:tp1/presentation/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:tp1/presentation/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return MyLoginPage();
          },
          routes: <RouteBase>[
      ],
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Page',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 8, 197),
        ),
        useMaterial3: true,
      ),
      routerConfig: _router, // Ajout de la configuration du router
    );
  }
}
