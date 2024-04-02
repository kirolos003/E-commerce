import 'dart:async';
import 'package:e_commerce/bloc_observer.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/features/login_screen/presentation/pages/login_screen.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:e_commerce/ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Network/cache_helper.dart';
import 'Network/dio_helper.dart';
import 'provider/app_provider.dart';
import 'shared/shared_components.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  Widget? widget;
  token = await CacheHelper.getData(
      key: 'token'
  );
  print(token);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DioHelper.init();
  configureDependencies();
  if (token != null) {
    widget = const MainScreen();
  } else {
    widget = const LoginScreen();
  }
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => AppProvider(),
    child: MyApp(startWidget: widget),
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({Key? key, this.startWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(startWidget: startWidget),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  final Widget? startWidget;
  const SplashScreen({Key? key, this.startWidget}) : super(key: key);
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      navigateAndFinish(context, widget.startWidget);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/Splash Screen.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
