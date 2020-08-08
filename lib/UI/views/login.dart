import 'package:flutter/material.dart';

import 'package:flutterhackathon/core/viewmodel/userModel.dart';
import 'package:flutterhackathon/sharedPref.dart';
import 'package:provider/provider.dart';

class LogIn extends StatelessWidget {
  static final tag = "login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<UserModel>(
        builder: (context, userModel, _) {
          return Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Photo
                // SvgPicture.asset(
                //   "assets/svg/undraw_Login_v483.svg",
                //   width: MediaQuery.of(context).size.width / 2,
                //   // color: Color(0xFF313457),
                //   allowDrawingOutsideViewBox: true,
                //   // fit: BoxFit.fill,
                //   height: 250,
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                Expanded(
                  child: Center(
                    child: Image.asset("assets/photo_2020-06-28_23-40-07.jpg"),
                  ),
                  flex: 3,
                ),
                //LoginWithGoogle
                // Expanded(
                //   flex: 1,
                //   child: RaisedButton(
                //     onPressed: () async {
                //       await userModel.login().then((value) {
                //         if (value != null) {
                //           Navigator.pushReplacementNamed(context, "userLocation");
                //         }
                //       });
                //     },
                //     child: Text("Login with Google"),
                //   ),
                // )
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () async {
                          await userModel.login().then((value) {
                            if (value != null) {
                              if (SPHelper.getString("area") == "") {
                                Navigator.pushReplacementNamed(
                                    context, "userLocation");
                              }
                            } else {
                              Navigator.pushReplacementNamed(context, "home");
                            }
                          });
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: 38.0, // 40dp - 2*1dp border
                                width: 38.0, // matches above
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Image(
                                    image: AssetImage(
                                      "assets/google-logo.png",
                                      // package: "flutter_auth_buttons",
                                    ),
                                    height: 18.0,
                                    width: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 14.0 /* 24.0 - 10dp padding */),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                              child: Text(
                                "Sign in with Google",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
