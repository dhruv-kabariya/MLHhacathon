import 'package:flutter/material.dart';

class ConnectionError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Image.asset(
              "assets/no_internet_conenction.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
