import 'package:e_commerce/features/products/presentation/cubits/Navigation/navigation_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, currentIndex) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                icon: Icons.home_outlined,
                label: 'Home',
                isSelected: currentIndex == 0,
                onTap: () => context.read<NavigationCubit>().changePage(0),
              ),
              NavItem(
                icon: Icons.favorite_border,
                label: 'Wishlist',
                isSelected: currentIndex == 1,
                onTap: () => context.read<NavigationCubit>().changePage(1),
              ),
              const SizedBox(width: 40),
              NavItem(
                icon: Icons.search,
                label: 'Search',
                isSelected: currentIndex == 2,
                onTap: () => context.read<NavigationCubit>().changePage(2),
              ),
              NavItem(
                icon: Icons.settings_outlined,
                label: 'Setting',
                isSelected: currentIndex == 3,
                onTap: () => context.read<NavigationCubit>().changePage(3),
              ),
            ],
          );
        },
      ),
    );
  }
}
