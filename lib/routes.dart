import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_training_app/app_manager/constant/color_constant.dart';
import 'package:my_training_app/model/training_model.dart';
import 'package:my_training_app/view/screens/home_screen/home_screen.dart';
import 'package:my_training_app/view/screens/splash_screen.dart';
import 'package:my_training_app/view/screens/training_details_screen.dart';
import 'package:my_training_app/view_model/trainings_view_model.dart';
import 'package:provider/provider.dart';

// define for transition animation
CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: SelectionArea(
              child: Stack(
            children: [
              Container(
                color: ColorConstant.primary,
                child: SafeArea(
                    child: child),
              ),
            ],
          )),
        ),
  );
}

List<RouteBase> routes = [
  GoRoute(
    name: SplashScreen.name,
    path: SplashScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state, child: const SplashScreen()),
  ),
  GoRoute(
    name: HomeScreen.name,
    path: HomeScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state,
        child: ChangeNotifierProvider<TrainingsViewModel>(
            create: (_)=> TrainingsViewModel(),
            child: const HomeScreen())),
  ),
  GoRoute(
    name: TrainingDetailsScreen.name,
    path: TrainingDetailsScreen.path,
    pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context, state: state,
        child:  TrainingDetailsScreen(
          id: state.pathParameters['id']
        )),
  ),
];
