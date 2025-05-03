import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/app_theme.dart';
import 'core/di/service_locator.dart';
import 'core/routes/app_routes.dart';

void main() {
    setupInjection();
    runApp(const ProviderScope(child: MyApp(),));
}

class MyApp extends ConsumerWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context, WidgetRef ref) {

        final themeMode = ref.watch(themeModeProvider);

        return MaterialApp.router(
            title: 'Mvvm Project',
            darkTheme: darkTheme,
            theme: lightTheme,
            themeMode: themeMode,
            routerConfig: pagesRoutes,
        );
    }
}

