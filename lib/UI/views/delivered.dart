import 'package:flutter/material.dart';
import 'package:flutterhackathon/UI/shared/commonUtility.dart';

Color kGreen = Color(0xff52BB70);

class Delivered extends StatefulWidget {
  static final tag = "delivered";

  @override
  _DeliveredState createState() => _DeliveredState();
}

class _DeliveredState extends State<Delivered> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addObserver(this);
  //   navigatToTheHome();
  // }

  // navigatToTheHome() {
  //   Timer(Duration(seconds: 2), () {
  //     Navigator.pushReplacementNamed(context, "home");
  //   });
  // }

  // @override
  // void dispose() {
  //   WidgetsBinding.instance.removeObserver(this);
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.06,
              ),
              Text(
                "Delivered",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: kGreen,
                ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.6,
                child: Image.asset("assets/images/delivered.gif"),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RoundedButton(
                        size: size,
                        textdata: Text(
                          "Return to Dashboard",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        function: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            'home',
                            (Route<dynamic> route) => false,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
