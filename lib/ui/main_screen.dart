import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../provider/app_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/images/Group 5.png'),
            ),
          ],
        ),
      ),
      body: provider.bottomScreens[provider.currentIndex],
      bottomNavigationBar: Container(
        height: 60.h,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          color: Color(0xff004182),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildIconButton(
              icon: 'assets/icons/home.png',
              selectedIcon: 'assets/icons/home_selected.png',
              onPressed: () => provider.changeBottomNav(0),
              isSelected: provider.currentIndex == 0,
            ),
            buildIconButton(
              icon: 'assets/icons/categories.png',
              selectedIcon: 'assets/icons/categories_selected.png',
              onPressed: () => provider.changeBottomNav(1),
              isSelected: provider.currentIndex == 1,
            ),
            buildIconButton(
              icon: 'assets/icons/wish.png',
              selectedIcon: 'assets/icons/wish_selected.png',
              onPressed: () => provider.changeBottomNav(2),
              isSelected: provider.currentIndex == 2,

            ),
            buildIconButton(
              icon: 'assets/icons/profile.png',
              selectedIcon: 'assets/icons/profile_selected.png',
              onPressed: () => provider.changeBottomNav(3),
              isSelected: provider.currentIndex == 3,
            ),

          ],
        ),
      ),
    );
  }

  Widget buildIconButton({
    required String icon,
    required String selectedIcon,
    required VoidCallback onPressed,
    required bool isSelected,
  }) {
    return IconButton(
      icon: Image.asset(
        isSelected ? selectedIcon : icon,
        width: 60.w,
        height: 60.h,
      ),
      onPressed: onPressed,
      color: isSelected ? Colors.orange : Colors.white,
    );
  }
}
