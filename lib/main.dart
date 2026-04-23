import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/core/helpers/app_constants.dart';
import 'package:e_commerce/core/routing/app_router.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(Eshop(appRouter: AppRouter()));
}

class Eshop extends StatelessWidget {
  final AppRouter appRouter;
  const Eshop({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,

      theme: AppTheme.lightTheme,
      initialRoute: Routes.homeView,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
