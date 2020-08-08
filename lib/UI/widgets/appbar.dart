import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterhackathon/UI/views/profilePage.dart';
import 'package:flutterhackathon/core/viewmodel/userModel.dart';
import 'package:flutterhackathon/sharedPref.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends SliverPersistentHeaderDelegate {
  // getUser() async {

  // }
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsConten) {
    double boxHeight = MediaQuery.of(context).size.height / 100;
    double boxWidth = MediaQuery.of(context).size.width / 100;
    Future<FirebaseUser> getUser() async {
      return await FirebaseAuth.instance.currentUser();
    }

    return Consumer<UserModel>(
      builder: (context, userModel, _) {
        return FutureBuilder<FirebaseUser>(
          future: getUser(),
          builder:
              (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            return Container(
              // height: boxHeight * 10,
              child: Stack(
                children: [
                  Positioned(
                    top: boxHeight * 3,
                    left: boxWidth * 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "userLocation");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(
                                width: boxWidth * 2,
                              ),
                              Text(
                                SPHelper.getString("area"),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: boxHeight * 2,
                    right: boxWidth * 5,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pushNamed("profile");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(
                              user: snapshot.data,
                            ),
                          ),
                        );
                      },
                      child: snapshot.data.photoUrl == null
                          ? Container(
                              // height:  20,
                              child: Card(
                                elevation: 10,
                                shape: CircleBorder(),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage("assets/logo.jpg"),
                                ),
                              ),
                            )
                          : Container(
                              child: Card(
                                elevation: 10,
                                shape: CircleBorder(),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 20,
                                  backgroundImage:
                                      NetworkImage(snapshot.data.photoUrl),
                                  // child: FadeInImage(
                                  //   placeholder: AssetImage("assets/logo.jpg"),
                                  //   image: ,
                                  // ),
                                ),
                              ),
                            ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
