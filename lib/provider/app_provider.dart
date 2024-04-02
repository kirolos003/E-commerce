import 'package:e_commerce/features/categories_screen/presentation/pages/categories_screen.dart';
import 'package:e_commerce/features/home_screen/presentation/pages/home_screen.dart';
import 'package:e_commerce/features/profile_screen/presentation/pages/profile_screen.dart';
import 'package:e_commerce/features/wish_list_screen/presentation/pages/favorites_screen.dart';
import 'package:flutter/material.dart';
import '../Network/cache_helper.dart';


class AppProvider extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    const HomeScreen(),
    const CategoriesScreen(),
    FavoritesScreen(),
    const ProfileScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    notifyListeners();
  }

  String isEnglish = 'ar';

  void changeAppLanguage({String? fromShared}) {
    if (fromShared != null) {
      isEnglish = fromShared;
    } else {
      isEnglish = (isEnglish == 'en') ? 'ar' : 'en';
      CacheHelper.saveData(key: 'isEnglish', value: isEnglish);
    }
    notifyListeners();
  }

  bool isDark = false;

  void changeAppTheme({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      notifyListeners();
    } else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark)
          .then((value) => notifyListeners());
    }
  }

  int current = 0;
  void refresh(int index){
    current = index;
    notifyListeners();
  }
}


