import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:split_bill/config/app_bootstrap.dart';
import 'package:split_bill/config/routes/app_router.dart';
import 'package:split_bill/config/theme/app_theme.dart';

void main() async {
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return AppBootstrap(
      child: MaterialApp.router(
        title: 'Slit bill',
        theme: AppTheme.themeData,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
