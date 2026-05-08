import 'package:e_commerce/core/routing/app_router.dart';
import 'package:e_commerce/features/products/presentation/cubits/Navigation/navigation_cubit.dart';
import 'package:e_commerce/features/products/presentation/views/home_view_body.dart';
import 'package:e_commerce/features/products/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    // إحنا هنا بنستخدم Scaffold واحد بس للتطبيق كله في الشاشات الرئيسية
    return Scaffold(
      extendBody: true, // عشان الـ FAB يبان فوق البار بشكل جمالي
      bottomNavigationBar:
          const CustomBottomNavBar(), // البار اللي عملنا له ريفاكتور
      // floatingActionButton: const CustomCartFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // الـ body هو اللي بيتغير بناءً على الـ Cubit
      body: BlocBuilder<NavigationCubit, int>(
        builder: (context, index) {
          // استخدام IndexedStack بيخلي الصفحات متتشالش من الميموري
          // يعني لو اليوزر عمل سكرول في الهوم وراح للبحث ورجع، هيلاقي السكرول في مكانه
          return IndexedStack(
            index: index,
            children: [
              AppRouter.buildHomeTab(), // التابة 0
              // WishlistViewBody(),  // التابة 1
              // SearchViewBody(),    // التابة 2
              // SettingsViewBody(),  // التابة 3
            ],
          );
        },
      ),
    );
  }
}
