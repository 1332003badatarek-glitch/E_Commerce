import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/core/routing/app_router.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(Stylish(appRouter: AppRouter()));
}

class Stylish extends StatelessWidget {
  final AppRouter appRouter;
  const Stylish({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',

      theme: AppTheme.lightTheme,
      initialRoute: Routes.loginView,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
