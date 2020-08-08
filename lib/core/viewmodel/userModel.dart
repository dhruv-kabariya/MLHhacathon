import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterhackathon/UI/shared/commonUtility.dart';
import 'package:flutterhackathon/core/services/firebaseUserService.dart';
import 'package:flutterhackathon/core/viewmodel/baseModel.dart';
import 'package:flutterhackathon/locator.dart';
import 'package:flutterhackathon/sharedPref.dart';

class UserModel extends BaseModel {
  //TODO : CRUD for User
  FirebaseUserService _firebaseLoginService = locator<FirebaseUserService>();
  static final Firestore _db = Firestore.instance;
  CollectionReference usersRef = _db.collection('User');
  FirebaseUser user;

  //user Location Form
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<String> login() async {
    user = await _firebaseLoginService.login();
    notifyChange();
    return user.displayName;
  }

  insertUserLocation(BuildContext context) async {
    if (formKey.currentState.validate()) {
      cirularAlertDialog(context);
      await _firebaseLoginService
          .insertUserLocation(
              buildingController.text,
              streetController.text,
              areaController.text,
              pinCodeController.text,
              cityController.text,
              stateController.text)
          .then((value) {
        Navigator.pop(context);
        if (value != null) {
          SPHelper.setString("userid", value);
          SPHelper.setString("building", buildingController.text);
          SPHelper.setString("street", streetController.text);
          SPHelper.setString("area", areaController.text);
          SPHelper.setString("pincode", pinCodeController.text);
          SPHelper.setString("city", cityController.text);
          SPHelper.setString("state", cityController.text);
          Navigator.pushReplacementNamed(context, "home");
          formKey.currentState.reset();
        } else {
          showFlutterToast("Something went wrong");
        }
      });
    }
  }

  //post a image of food
  addMedia(String id, dynamic urls) {
    usersRef.document(id).setData({"media": urls}, merge: true);
  }

  Future<FirebaseUser> getUser() async {
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    return _user;
  }

  signOut() async {
    // SPHelper.logout();
    await _firebaseLoginService.signOut();
  }

  // registration() async {
  //   await usersRef.document().setData({

  //   });
  // }
}
