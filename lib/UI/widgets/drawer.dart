import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterhackathon/core/viewmodel/userModel.dart';
import 'package:provider/provider.dart';

class Menu extends StatelessWidget {
  Future<FirebaseUser> getUser() async {
    return await FirebaseAuth.instance.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, userModel, _) {
        return Drawer(
          child: ListView(
            children: [
              FutureBuilder<FirebaseUser>(
                future: getUser(),
                // initialData: InitialData,
                builder: (BuildContext context,
                    AsyncSnapshot<FirebaseUser> snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  return UserAccountsDrawerHeader(
                    accountName: Text(snapshot.data.displayName),
                    accountEmail: Text(snapshot.data.email),
                    currentAccountPicture: snapshot.data.photoUrl != null
                        ? CircleAvatar(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: FadeInImage(
                                image: NetworkImage(snapshot.data.photoUrl),
                                placeholder: AssetImage("assets/logo.jpg"),
                              ),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset("assets/logo.jpg"),
                          ),
                    onDetailsPressed: () {
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed("profile");
                    },
                  );
                },
              ),
              // ListTile(
              //   title: Text("On Way"),
              //   onTap: () {
              //     Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => OnTheWay()));
              //   },
              // ),
              // ListTile(
              //   title: Text("Delivered"),
              //   onTap: () {
              //     Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => Delivered()));
              //   },
              // ),
              ListTile(
                title: Text("Post a Food"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed("insertFood");
                },
              ),
              // ListTile(
              //   title: Text("My Posted Food"),
              //   onTap: () {

              //   },
              // ),
              ListTile(
                title: Text("Log Out"),
                leading: Icon(Icons.exit_to_app),
                onTap: () {
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
                                  context, 'login', (route) => false);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
