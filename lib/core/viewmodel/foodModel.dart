import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterhackathon/UI/shared/commonUtility.dart';
import 'package:flutterhackathon/core/models/food.dart';
import 'package:flutterhackathon/core/services/firebaseFoodServices.dart';
import 'package:flutterhackathon/core/viewmodel/baseModel.dart';
import 'package:flutterhackathon/locator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

class FoodModel extends BaseModel {
  Stream<List<Food>> get food => _foodSubject.stream;
  final _foodSubject = BehaviorSubject<List<Food>>();
  final FirebaseFoodServices _firebaseFoodServices =
      locator<FirebaseFoodServices>();
  static final Firestore _db = Firestore.instance;
  CollectionReference foodRef = _db.collection('Food');
  File image;
  String _id;
  final formKey = GlobalKey<FormState>();
  final updateFormKey = GlobalKey<FormState>();
  final confirmLocationForm = GlobalKey<FormState>();
  StorageUploadTask uploadTask;
  final FirebaseStorage storage = FirebaseStorage(
      storageBucket: 'gs://flutter-hackathon-d5529.appspot.com');
  final picker = ImagePicker();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController servedController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController goodTimeController = TextEditingController();
  final TextEditingController confirmLocationController =
      TextEditingController();
  final TextEditingController updateNameController = TextEditingController();
  final TextEditingController updateTimeController = TextEditingController();
  final TextEditingController updateServedController = TextEditingController();

  // getFoodDetail() {
  //   _firebaseFoodServices.getFoodDetail().asStream().map((event) {
  //     return event;
  //   }).listen((event) {
  //     if (event != null) {
  //       List<Food> food = event.map((e) => Food.fromJson(e.data)) as List;
  //       _foodSubject.sink.add(food);
  //     }
  //   });
  // }

  FoodModel() {
    // getFoodDetail();
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    image = File(pickedFile.path);
    notifyListeners();
  }

  Future<String> getId() async {
    return await _firebaseFoodServices.getFoodId();
  }

  startUpload(File img) async {
    String filstring = img.path;

    List<String> extnList = filstring.split('.');

    String extn = extnList[extnList.length - 1];
    // userRef.getDocuments();
    String storageUrl;
    _id = await getId();
    // print(_id);
    String filePath = 'images/$_id.$extn';
    StorageReference imgref = storage.ref().child(filePath);

    // setState(() {
    // print(imgref);
    uploadTask = imgref.putFile(img);

    var snapshot = await uploadTask.onComplete;

    if (snapshot.bytesTransferred == snapshot.totalByteCount) {
      storageUrl = await imgref.getDownloadURL();
      print(storageUrl);
      return storageUrl;
    }
    return null;
  }

  insertFoodDetail(BuildContext context) async {
    if (confirmLocationForm.currentState.validate()) {
      cirularAlertDialog(context);
      String storageUrl = await startUpload(image);

      bool success = await _firebaseFoodServices.insertFoodDetail(
        _id,
        nameController.text,
        servedController.text,
        timeController.text,
        goodTimeController.text,
        confirmLocationController.text,
        storageUrl,
      );
      Navigator.pop(context);
      if (success) {
        showFlutterToast("Post a food successfully");
        Navigator.pushNamedAndRemoveUntil(
          context,
          'home',
          (Route<dynamic> route) => false,
        );
        formKey.currentState.reset();
      } else {
        showFlutterToast("Something went wrong");
      }
    }
  }

  //TODO : id object pass karege navigation se tab aayegi
  updateFoodDetail(BuildContext context) async {
    if (updateFormKey.currentState.validate()) {
      cirularAlertDialog(context);
      // String storageUrl = await startUpload(_image);

      bool success = await _firebaseFoodServices.updateFoodDetail(
          _id,
          updateNameController.text,
          updateTimeController.text,
          updateServedController.text);
      Navigator.pop(context);
      if (success) {
        showFlutterToast("Update a food successfully");
        Navigator.pushNamedAndRemoveUntil(
          context,
          'home',
          (Route<dynamic> route) => false,
        );
        updateFormKey.currentState.reset();
      } else {
        showFlutterToast("Something went wrong");
      }
    }
  }

  updateStatus(BuildContext context, String id) async {
    bool success = await _firebaseFoodServices.updateStatus(id, "On The Way");
    // Navigator.pop(context);
    if (success) {
    } else {
      showFlutterToast("something went wrong");
    }
  }

  updateStatusNotPicked(BuildContext context, String id) async {
    bool success = await _firebaseFoodServices.updateStatus(id, "Not picked");
    // Navigator.pop(context);
    if (success) {
    } else {
      showFlutterToast("something went wrong");
    }
  }

  updateStatusDelivered(BuildContext context, String id) async {
    bool success = await _firebaseFoodServices.updateStatus(id, "Delivered");
    // Navigator.pop(context);
    if (success) {
    } else {
      showFlutterToast("something went wrong");
    }
  }

  @override
  void dispose() {
    _foodSubject?.close();
    super.dispose();
  }
}
