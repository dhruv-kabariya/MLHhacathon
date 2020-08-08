import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterhackathon/sharedPref.dart';

class SplashScreen extends StatefulWidget {
  static final tag = "/";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    navigatScreen();
  }

  navigatScreen() async {
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();

    Timer(Duration(seconds: 3), () {
      if (SPHelper.getBoolean("picked") == false) {
        if (_user != null) {
          // print(SPHelper.getString("area") + "fsda");
          // print(SPHelper.getString("area"));
          if (SPHelper.getString("area") != "") {
            Navigator.pushReplacementNamed(context, 'home');
          } else {
            Navigator.pushReplacementNamed(context, 'userLocation');
          }
        } else {
          Navigator.pushReplacementNamed(context, 'login');
        }
      } else {
        Navigator.pushReplacementNamed(context, 'onTheWay');
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Image.asset(
                "assets/logo.jpg",
                // fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
