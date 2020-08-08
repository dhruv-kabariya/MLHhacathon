import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterhackathon/sharedPref.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseUserService {
  //TODO : call all services about users
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static final Firestore _db = Firestore.instance;
  static CollectionReference _userRef = _db.collection('UserLocation');

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<FirebaseUser> login() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    // print("signed in " + user.displayName);
    return user;
  }

  signOut() async {
    await _googleSignIn.signOut();
  }

  Future<String> insertUserLocation(String building, String street, String area,
      String pinCode, String city, String state) async {
    if (SPHelper.getString("area") == "") {
      FirebaseUser user = await _auth.currentUser();
      await _userRef.document().setData({
        "id": user.uid,
        // "userid": user.uid,
        "name": user.displayName,
        "buiding/apartment": building,
        "street": street,
        "area": area,
        "city": city,
        "state": state,
        "pincode": pinCode
      });
      if (_userRef.document().documentID != null) {
        return _userRef.document().documentID;
      } else {
        return _userRef.document().documentID;
      }
    } else {
      // FirebaseUser user = await _auth.currentUser();
      // QuerySnapshot qsnp =
      //     await _userRef.where("id", isEqualTo: user.uid).getDocuments();
      // if (qsnp.documents.length != 0) {
      _userRef.document(SPHelper.getString("userid")).updateData({
        "buiding/apartment": building,
        "street": street,
        "area": area,
        "city": city,
        "state": state,
        "pincode": pinCode
      });
      // if (_userRef.document().documentID != null) {
      //   return _userRef.document().documentID;
      // } else {
      //   return _userRef.document().documentID;
      // }
      return SPHelper.getString("userid");
    }
  }
}
