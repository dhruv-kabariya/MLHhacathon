import 'package:flutter/material.dart';
import 'package:flutterhackathon/UI/shared/commonUtility.dart';
import 'package:flutterhackathon/UI/views/conformAdd.dart';
import 'package:flutterhackathon/core/viewmodel/foodModel.dart';

import 'package:provider/provider.dart';

class TextArea1 extends StatelessWidget {
  static final tag = "insertFood";

  // Future getImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.camera);

  //   // setState(() {
  //   //   _image = File(pickedFile.path);
  //   // });
  // }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        title: Text(
          "Add details",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Consumer<FoodModel>(
        builder: (context, foodModel, _) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    child: foodModel.image == null
                        ? InkWell(
                            onTap: () {
                              foodModel.getImage();
                            },
                            child: Container(
                              height: size.height / 3,
                              width: size.width,
                              child: Center(
                                child: Text(
                                  "Tap to add images",
                                ),
                              ),
                            ),
                          )
                        : Column(
                            children: [
                              Container(
                                height: size.height / 3,
                                width: size.width,
                                child: Image.file(foodModel.image),
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () {
                                  foodModel.getImage();
                                },
                                child: Text("Add a new photo"),
                                color: kprimaryColor,
                                textColor: Colors.white,
                              )
                            ],
                          ),
                  ),
                  Form(
                    key: foodModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            controller: foodModel.nameController,
                            style: TextStyle(),
                            decoration: InputDecoration(
                              labelText: 'Name of dish',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Name of dish';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            controller: foodModel.servedController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'No. of pepole can served (Appox.)',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter value';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            // keyboardType: TextInputType.datetime,
                            controller: foodModel.timeController,
                            decoration: InputDecoration(
                              labelText: 'Prepared Time (24 Hours)',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Prepared Time';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: foodModel.goodTimeController,
                            decoration: InputDecoration(
                              labelText:
                                  'How much time it will be good ? ( in hours )',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter time';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: kprimaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              // if (v) {
                              //   foor.currentState.save();
                              //   // print(_noofpeople);
                              //   // print(_nameofdish);
                              //   // print(_preparedTime);
                              //   // print(_goodtill);
                              //   // print(_image);
                              //   // Navigator.pop(context);
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (BuildContext context) =>
                              //           ConfirmAddress(),
                              //     ),
                              //   );
                              // }
                              if (foodModel.formKey.currentState.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ConfirmAddress(),
                                  ),
                                );
                              }
                            },
                            child: Text('Confirm Your Location'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
