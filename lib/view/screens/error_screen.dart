import 'package:flutter/material.dart';
import 'package:my_training_app/app_manager/helper/navigation_helper.dart';
import 'package:my_training_app/view/screens/home_screen/home_screen.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  static const String name = "error";
  static const String path = "/$name";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const FlutterLogo(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("The page you are looking for does not exist", textAlign: TextAlign.center, style: theme.textTheme.titleMedium),
                ),
                SizedBox(
                  width: 180,
                  child: TextButton(
                    key: const Key("return_to_home"),
                    onPressed: () {
                      NavigationHelper.pushNamed(context, HomeScreen.name);
                    },
                    child: const Text("Return to home"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
