import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/di/service_locator.dart';
import 'core/routes/app_routes.dart';
import 'views/post_list/post_list_screen.dart';

void main() {
  setupInjection();
  runApp(const ProviderScope(child: MyApp(),));
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp.router(
            title: 'Mvvm Project',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            routerConfig: pagesRoutes,
        );
    }
}

