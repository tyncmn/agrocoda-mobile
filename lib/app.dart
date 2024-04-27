import 'package:cookers_app/router/auto_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Echron',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF29B674),
            primary: const Color(0xFF29B674),
          ),
          useMaterial3: true,
          fontFamily: 'Tommy',
          primaryColor: const Color(0xFF29B674)),
      routerConfig: ref.read(appRouterProvider).config(),
    );
  }
}
