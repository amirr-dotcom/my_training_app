import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:my_training_app/app_manager/service/app_service.dart';

class NavigationHelper {


  // use this pushNamed it can manage your routing according to your platform
  static Future<T?> pushNamed<T extends Object?>(
      BuildContext context,
      String name, {
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
        Object? extra,
      }) async{
    try {
      if(!AppService().getKIsWeb()) {
        return await context.pushNamed<T>(name,
          queryParameters: queryParameters,
          pathParameters: pathParameters,
          extra: extra,
        );
      } else{
        context.goNamed(name,
          queryParameters: queryParameters,
          pathParameters: pathParameters,
          extra: extra,
        );
        return Future.value();
      }
      // ignore: empty_catches
    } catch(e) {

    }
    return null;
  }


  static void pop<T extends Object?>(
      BuildContext context,
      {String? name}) {
    try {
      if(!AppService().getKIsWeb() || name == null) {
        return context.pop();
      } else{
        return context.goNamed(name);
      }
      // ignore: empty_catches
    } catch(e) {

    }
  }



  static void pushReplacementNamed(
      BuildContext context,
      String name, {
        Map<String, String> pathParameters = const <String, String>{},
        Map<String, dynamic> queryParameters = const <String, dynamic>{},
        Object? extra,
      }) async{
    try {
      if(!AppService().getKIsWeb()) {
        context.pushReplacementNamed(name,
          queryParameters: queryParameters,
          pathParameters: pathParameters,
          extra: extra,
        );
      } else{
        Router.neglect(context, () => context.goNamed(name,
          queryParameters: queryParameters,
          pathParameters: pathParameters,
          extra: extra,
        ));
      }
      // ignore: empty_catches
    } catch(e) {

    }
  }


}