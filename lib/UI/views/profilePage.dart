import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterhackathon/core/viewmodel/userModel.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final FirebaseUser user;
  ProfilePage({this.user});
  @override
  Widget build(BuildContext context) {
    final UserModel userModel = Provider.of(context);
    double boxHeight = MediaQuery.of(context).size.height / 100;
    double boxWidth = MediaQuery.of(context).size.width / 100;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: boxHeight * 100,
          width: boxWidth * 100,
          child: Stack(
            children: [
              Positioned(
                child: ClipPath(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage("assets/fb.png"),
                      ),
                    ),
                  ),
                  clipper: RoundCardShape(),
                ),
              ),
              Positioned(
                top: boxHeight * 4,
                left: boxWidth * 2,
                child: Card(
                  shape: CircleBorder(),
                  elevation: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 22,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ),
                ),
              ),
              // Positioned(
              //   top: boxHeight * 4,
              //   right: boxWidth * 2,
              //   child: Card(
              //     shape: CircleBorder(),
              //     elevation: 10,
              //     child: CircleAvatar(
              //       backgroundColor: Colors.white,
              //       child: IconButton(
              //           icon: Icon(
              //             Icons.settings,
              //             size: 22,
              //             color: Colors.black,
              //           ),
              //           onPressed: null),
              //     ),
              //   ),
              // ),
              Positioned(
                top: boxHeight * 30,
                left: boxWidth * (50 - 15),
                child: Container(
                  height: boxWidth * 30,
                  width: boxWidth * 30,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(boxWidth * 30),
                    ),
                    elevation: 5,
                    child: user.photoUrl == null
                        ? CircleAvatar(
                            backgroundImage: AssetImage("assets/logo.jpg"),
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(user.photoUrl),
                          ),
                  ),
                ),
              ),
              Positioned(
                top: boxHeight * 50,
                left: 0,
                child: Column(
                  children: [
                    // Row(
                    //   children: [
                    //     CountFoodPeople(
                    //       count: 1000.toString(),
                    //       title: "People You Fed",
                    //       boxWidth: boxWidth,
                    //       boxHeight: boxHeight,
                    //     ),
                    //     CountFoodPeople(
                    //       count: 100.toString() + " Kg",
                    //       title: "Donated Food",
                    //       boxWidth: boxWidth,
                    //       boxHeight: boxHeight,
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: boxHeight * 2,
                    // ),
                    UserDetail(
                      title: "Name :",
                      detail: user.displayName,
                      boxHeight: boxHeight,
                      boxWidth: boxWidth,
                    ),
                    UserDetail(
                      boxHeight: boxHeight,
                      boxWidth: boxWidth,
                      title: "Email :",
                      detail: user.email,
                    ),
                    SizedBox(
                      height: boxHeight * 5,
                    ),
                    Container(
                      width: boxWidth * 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            color: Colors.red,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text("Do you want to Log Out"),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('No'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      RaisedButton(
                                        child: Text('Yes'),
                                        onPressed: () async {
                                          await userModel.signOut();
                                          Navigator.of(context).pop();
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              'login',
                                              (route) => false);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                Text("Log Out"),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(Icons.exit_to_app),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
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

class UserDetail extends StatelessWidget {
  const UserDetail({
    Key key,
    @required this.boxHeight,
    @required this.boxWidth,
    @required this.title,
    @required this.detail,
  }) : super(key: key);

  final double boxHeight;
  final double boxWidth;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: boxHeight * 10,
      child: Row(
        children: [
          Container(
            height: boxHeight * 10,
            width: boxWidth * 30,
            child: Center(
                child: Text(title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: boxHeight * 10,
            width: boxWidth * 70,
            child: Center(
                child: Text(detail,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
          ),
        ],
      ),
    );
  }
}

class CountFoodPeople extends StatelessWidget {
  const CountFoodPeople({
    Key key,
    @required this.title,
    @required this.count,
    @required this.boxWidth,
    @required this.boxHeight,
  }) : super(key: key);

  final double boxWidth;
  final double boxHeight;
  final String title;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxWidth * 50,
      height: boxHeight * 10,
      // color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: boxHeight * 2,
          ),
          Text(
            count,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class RoundCardShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, ((size.height) / 100) * 30);
    path.quadraticBezierTo(size.width / 2, ((size.height) / 100) * 50,
        size.width, ((size.height) / 100) * 30);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
