import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterhackathon/UI/router.dart';

import 'package:flutterhackathon/core/viewmodel/baseModel.dart';
import 'package:flutterhackathon/core/viewmodel/foodModel.dart';
import 'package:flutterhackathon/core/viewmodel/userModel.dart';
import 'package:flutterhackathon/locator.dart';
import 'package:flutterhackathon/sharedPref.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // // run app if and if only device in protrait mode not landscape mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) {
      // WidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.getInstance().then((SharedPreferences sp) {
        SPHelper.setPref(sp);
        // SPHelper.setBoolean("picked", false);
        setupLocator();
        runApp(MyApp());
      });
    },
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BaseModel()),
        ChangeNotifierProvider(create: (_) => UserModel()),
        ChangeNotifierProvider(create: (_) => FoodModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Sharing',
        // home: LogIn(),
        initialRoute: '/',
        theme: ThemeData(
          primaryColor: const Color(0xff52BB70),
          accentColor: const Color(0xFFffcc00),
          primaryColorBrightness: Brightness.dark,
        ),

        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
