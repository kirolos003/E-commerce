import 'package:e_commerce/Network/cache_helper.dart';
import 'package:e_commerce/features/login_screen/presentation/pages/login_screen.dart';
import 'package:e_commerce/shared/shared_components.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 1000,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.amberAccent, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            CacheHelper.removeData(key: 'token').then((value) {
              if (value) {
                navigateTo(context, const LoginScreen());
              }
            });
          },
          child: const Text('Log Out'),
        ),
      ),
    );
  }
}
