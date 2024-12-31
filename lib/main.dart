import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_training_app/app_manager/constant/app_constant.dart';
import 'package:my_training_app/app_manager/constant/locale_constant.dart';
import 'package:my_training_app/app_manager/theme/app_theme.dart';
import 'package:my_training_app/routes.dart';
import 'package:my_training_app/view/screens/error_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: LocaleConstant.supportedLocales,
      path: LocaleConstant.path,
      child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: AppConstant.name,
      theme: MyThemeData.primary,
      routerConfig: router,
    );
  }
}


GoRouter router = GoRouter(
  routes: routes,
  errorBuilder: (context, state) => const ErrorScreen(),
);