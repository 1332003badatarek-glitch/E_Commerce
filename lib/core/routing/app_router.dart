import 'package:e_commerce/core/di/service_locator.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/sign_up_view.dart';
import 'package:e_commerce/features/categories/presentation/cubits/categories/categories_cubit.dart';
import 'package:e_commerce/features/products/presentation/cubits/Navigation/navigation_cubit.dart';
import 'package:e_commerce/features/products/presentation/cubits/products/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/views/home_view_body.dart';
import 'package:e_commerce/features/products/presentation/views/main_view.dart';
import 'package:e_commerce/features/user/presentation/cubits/user_cubit/user_cubit_cubit.dart';
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
      case Routes.mainView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<NavigationCubit>(),
            child: const MainView(),
          ),
        );

      // case Routes.homeView:
      //   return MaterialPageRoute(
      //     builder: (_) => MultiBlocProvider(
      //       providers: [
      //         BlocProvider(
      //           create: (context) => getIt<UserCubit>()..getUserProfile(),
      //         ),
      //         BlocProvider(
      //           create: (context) => getIt<CategoriesCubit>()..getCategories(),
      //         ),
      //         BlocProvider(
      //           create: (context) => getIt<ProductsCubit>()..getProducts(),
      //         ),
      //       ],
      //       child: const HomeViewBody(),
      //     ),
      //   );
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

  static Widget buildHomeTab() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<UserCubit>()..getUserProfile()),
        BlocProvider(
          create: (context) => getIt<ProductsCubit>()..getProducts(),
        ),
        BlocProvider(
          create: (context) => getIt<CategoriesCubit>()..getCategories(),
        ),
      ],
      child: const HomeViewBody(),
    );
  }
}
