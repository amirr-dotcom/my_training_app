import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/helper/locale_helper.dart';
import 'package:my_training_app/app_manager/helper/navigation_helper.dart';
import 'package:my_training_app/view/screens/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = "splash";
  static const String path = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // // Simulate initialization or data loading
    await Future.delayed(const Duration(seconds: 1));
    // Check if the widget is still mounted
    if (!mounted) return;
    // Navigate to Home Screen
    NavigationHelper.pushReplacementNamed(context, HomeScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child:  FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: FlutterLogo(
                          size: 150,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Text(LocaleHelper.app('name'),
                      style: textTheme.titleLarge,)
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
