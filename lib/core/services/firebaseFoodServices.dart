import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFoodServices {
  static final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static CollectionReference _foodRef = _db.collection('Food');
  //TODO : call all services about food
  // Stream<List<DocumentSnapshot>> getFoodDetail() async {
  //   // QuerySnapshot _foodSnap = await _foodRef.getDocuments();
  //   // List<DocumentSnapshot> doc = _foodSnap.documents;
  //   // if (_foodSnap.documents.length != 0) {
  //   //   return doc;
  //   // }
  //   // return null;
  //   return _foodRef.getDocuments().snapshots;
  // }
  Future<String> getFoodId() async {
    DocumentReference docref = await _foodRef.add({});
    return docref.documentID;
  }

  Future<bool> insertFoodDetail(String id, String name, String served,
      String time, String good, String location, String storageURL) async {
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    await _foodRef.document(id).setData({
      "id": id,
      "name": name,
      "postedPerson": _user.uid,
      // "postedDateTime": DateTime.now().millisecondsSinceEpoch.toString(),
      // "quantity": quantity,
      // "good": good,
      "time": time,
      "goodForHowManyHours": good,
      "location": location,
      "served": served,
      "photo": storageURL,
      "status": "Not picked"
    });
    if (_foodRef.document(id).documentID != null) {
      return true;
    } else {
      return false;
    }

    // return false;
  }

  updateFoodDetail(String id, String name, String time, String served) async {
    // FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    await _foodRef.document(id).updateData({
      "id": id,
      "name": name,
      // "postedPerson": _user.uid,
      "postedDateTime": DateTime.now().millisecondsSinceEpoch.toString(),
      // "quantity": quantity,
      // "good": good,
      "time": time,

      "served": served,
    });
    if (_foodRef.document(id).documentID != null) {
      return true;
    } else {
      return false;
    }
  }

  updateStatus(String id, String data) async {
    await _foodRef.document(id).updateData({"status": data});
    if (_foodRef.document(id).documentID != null) {
      return true;
    } else {
      return false;
    }
  }

  deleteFoodDetail(String id) async {
    await _foodRef.document(id).delete();
  }
}
