import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:tesis_1/app/ui/global_controllers/theme_controller.dart';
import 'package:tesis_1/app/ui/routes/app_routes.dart';
import 'package:tesis_1/app/ui/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final theme = ref.watch(themeProvider);
      return MaterialApp(
        title: "Tasa de interes",
        navigatorKey: router.navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.SPLASH,
        darkTheme: ThemeData.dark(),
        theme: ThemeData.light(),
        themeMode: theme.mode,
        navigatorObservers: [
          router.observer,
        ],
        routes: appRoutes,
      );
    });
  }
}
