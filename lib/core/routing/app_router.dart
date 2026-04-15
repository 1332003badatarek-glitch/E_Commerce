import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/sign_up_view.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/routing/routes.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginView(),
          ),
        );
      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.signUpView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpView(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
