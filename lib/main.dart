import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:novira_app/core/utils/app_router.dart';
import 'package:novira_app/core/providers/language_provider/language_provider.dart';
import 'package:novira_app/generated/l10n.dart';
import 'package:novira_app/simple_bloc_observer.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: const StartupShell(),
    ),
  );
}

class StartupShell extends StatefulWidget {
  const StartupShell({super.key});

  @override
  State<StartupShell> createState() => _StartupShellState();
}

class _StartupShellState extends State<StartupShell> {
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future<void>.delayed(const Duration(milliseconds: 160));
      if (!mounted) return;
      setState(() => _ready = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(strokeWidth: 2.5),
            ),
          ),
        ),
      );
    }

    return const NoviraApp();
  }
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
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
    );
  }
}
