import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:split_bill/config/app_bootstrap.dart';
import 'package:split_bill/config/routes/app_router.dart';
import 'package:split_bill/config/theme/app_theme.dart';
import 'package:split_bill/config/theme/theme_hive_box.dart';

void main() async {
  await Hive.initFlutter().then((_) async {
    await ThemeBox.instance.init();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return AppBootstrap(
      child: ValueListenableBuilder<Box<bool>>(
          valueListenable: ThemeBox.instance.listenable(),
          builder: (context, value, child) {
            return MaterialApp.router(
              title: 'Slit bill',
              theme: AppTheme.themeData,
              darkTheme: AppTheme.darkThemeData,
              themeMode: (value.get(ThemeBox.instance.key) ?? false)
                  ? ThemeMode.dark
                  : ThemeMode.light,
              routerConfig: appRouter.config(),
            );
          }),
    );
  }
}
