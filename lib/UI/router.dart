import 'package:flutter/material.dart';
import 'package:flutterhackathon/UI/views/conformAdd.dart';
import 'package:flutterhackathon/UI/views/delivered.dart';
import 'package:flutterhackathon/UI/views/insertFoodDarshan.dart';
import 'package:flutterhackathon/UI/views/ontheway.dart';
import 'package:flutterhackathon/UI/splashScreen.dart';

import 'package:flutterhackathon/UI/views/foodDetail.dart';
import 'package:flutterhackathon/UI/views/homeScreen.dart';

import 'package:flutterhackathon/UI/views/login.dart';

import 'package:flutterhackathon/UI/views/profilePage.dart';
import 'package:flutterhackathon/UI/views/userLocation.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());
        break;
      case "home":
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case "login":
        return MaterialPageRoute(builder: (_) => LogIn());
        break;
      case "profile":
        return MaterialPageRoute(builder: (_) => ProfilePage());
        break;
      // case "insertFood":
      //   return MaterialPageRoute(builder: (_) => InsertFood());
      //   break;
      case "userLocation":
        return MaterialPageRoute(builder: (_) => UserLocation());
        break;
      case "foodDetail":
        return MaterialPageRoute(builder: (_) => FoodDetail());
        break;
      case "onTheWay":
        return MaterialPageRoute(builder: (_) => OnTheWay());
        break;
      case "delivered":
        return MaterialPageRoute(builder: (_) => Delivered());
        break;
      case "insertFood":
        return MaterialPageRoute(builder: (_) => TextArea1());
        break;
      case "confirmAdd":
        return MaterialPageRoute(builder: (_) => ConfirmAddress());
        break;

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
        break;
    }
  }
}
