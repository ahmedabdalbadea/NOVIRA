import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:novira_app/core/utils/app_router.dart';
import 'package:novira_app/core/providers/language_provider/language_provider.dart';
import 'package:novira_app/generated/l10n.dart';
import 'package:novira_app/simple_bloc_observer.dart';
import 'package:provider/provider.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: const NoviraApp(),
    ),
  );
}

class NoviraApp extends StatelessWidget {
  const NoviraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: Locale(Provider.of<LanguageProvider>(context).language),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Provider.of<LanguageProvider>(context).textTheme,
      ),
    );
  }
}
