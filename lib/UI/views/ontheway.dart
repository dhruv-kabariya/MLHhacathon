import 'package:flutter/material.dart';
import 'package:flutterhackathon/UI/shared/commonUtility.dart';
import 'package:flutterhackathon/core/viewmodel/foodModel.dart';
import 'package:flutterhackathon/sharedPref.dart';
import 'package:provider/provider.dart';

Color kGreen = Color(0xff52BB70);
Color kBack = Colors.white;

class OnTheWay extends StatelessWidget {
  static final tag = "onTheWay";
  @override
  Widget build(BuildContext context) {
    FoodModel _foodModel = Provider.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBack,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.70,
                child: Image.asset("assets/images/on_the_way.gif"),
              ),
              Text(
                "Food is on the way",
                style: TextStyle(
                  // fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: kGreen,
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedButton(
                  size: size / 2.5,
                  textdata: Text(
                    "No",
                    style: TextStyle(
                      // fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  function: () {
                    SPHelper.setBoolean("picked", false);
                    Navigator.pushNamedAndRemoveUntil(
                        context, "home", (route) => false);
                    _foodModel.updateStatusNotPicked(
                      context,
                      SPHelper.getString("foodId"),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedButton(
                  size: size / 2.5,
                  textdata: Text(
                    "Yes",
                    style: TextStyle(
                      // fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  function: () async {
                    SPHelper.setBoolean("picked", false);
                    Navigator.pushReplacementNamed(context, "delivered");
                    await _foodModel.updateStatusDelivered(
                      context,
                      SPHelper.getString("foodId"),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
