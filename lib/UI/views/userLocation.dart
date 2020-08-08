import 'package:flutter/material.dart';
import 'package:flutterhackathon/UI/shared/commonUtility.dart';
import 'package:flutterhackathon/core/viewmodel/userModel.dart';
import 'package:flutterhackathon/sharedPref.dart';
import 'package:provider/provider.dart';

class UserLocation extends StatelessWidget {
  static final tag = "userLocation";
  int count = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final UserModel _userModel = Provider.of(context);

    if (count == 0) {
      if (SPHelper.getString("area") != null) {
        _userModel.buildingController.text = SPHelper.getString("building");
        _userModel.streetController.text = SPHelper.getString("street");
        _userModel.areaController.text = SPHelper.getString("area");
        _userModel.pinCodeController.text = SPHelper.getString("pincode");
        _userModel.cityController.text = SPHelper.getString("city");
        _userModel.stateController.text = SPHelper.getString("state");
      }
      count = 1;
    }

    double boxHeight = MediaQuery.of(context).size.height / 100;
    double boxWidth = MediaQuery.of(context).size.width / 100;

    return Scaffold(
      body: SafeArea(
        child: Consumer<UserModel>(
          builder: (context, userModel, _) {
            return Form(
              key: userModel.formKey,
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      top: boxHeight * 2,
                      child: Container(
                        height: boxHeight * 5,
                        width: boxWidth * 100,
                        child: Center(
                            child: Text(
                          "Select Your Loaction",
                          style: Theme.of(context).textTheme.headline4,
                        )),
                      ),
                    ),
                    Positioned(
                      top: boxHeight * 10,
                      child: Container(
                        // alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: boxWidth * 4),
                        height: boxHeight * 30,
                        width: boxWidth * 92,
                        // color: Colors.indigo,
                        child: Image(
                            image: AssetImage(
                              "assets/location.png",
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                        top: boxHeight * 43,
                        left: 0,
                        child: Container(
                          // margin: EdgeInsets.symmetric(vertical: boxWidth * 5),
                          height: boxHeight * 40,
                          width: boxWidth * 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: boxWidth * 4,
                                          right: boxWidth * 1),
                                      height: boxHeight * 10,
                                      width: boxWidth * 45,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter Building/Apartment Number';
                                          }
                                          return null;
                                        },
                                        controller:
                                            _userModel.buildingController,
                                        decoration: InputDecoration(
                                          hintText: "Building/Apartment Number",
                                        ),
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: boxWidth * 1,
                                          right: boxWidth * 4),
                                      height: boxHeight * 10,
                                      width: boxWidth * 45,
                                      child: TextFormField(
                                        textCapitalization:
                                            TextCapitalization.words,

                                        controller: userModel.streetController,
                                        decoration: InputDecoration(
                                          hintText: "Street Name",
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter Street Name';
                                          }
                                          return null;
                                        },
                                        // keyboardAppearance: TextInputAction.next,
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: boxWidth * 4,
                                          right: boxWidth * 1),
                                      height: boxHeight * 10,
                                      width: boxWidth * 45,
                                      child: TextFormField(
                                        textCapitalization:
                                            TextCapitalization.words,

                                        controller: userModel.areaController,
                                        decoration: InputDecoration(
                                          hintText: "Area",
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter Area Name';
                                          }
                                          return null;
                                        },
                                        // keyboardAppearance: TextInputAction.next,
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: boxWidth * 1,
                                          right: boxWidth * 4),
                                      height: boxHeight * 10,
                                      width: boxWidth * 45,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter PinCode';
                                          }
                                          if (value.length != 6) {
                                            return 'Please enter valid PinCode';
                                          }
                                          return null;
                                        },
                                        controller:
                                            _userModel.pinCodeController,
                                        decoration: InputDecoration(
                                          hintText: "Pincode",
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: boxWidth * 4,
                                          right: boxWidth * 1),
                                      height: boxHeight * 10,
                                      width: boxWidth * 45,
                                      child: TextFormField(
                                        textCapitalization:
                                            TextCapitalization.words,

                                        controller: userModel.cityController,
                                        decoration: InputDecoration(
                                          hintText: "City",
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter City Name';
                                          }
                                          return null;
                                        },
                                        // keyboardAppearance: TextInputAction.next,
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: boxWidth * 1,
                                          right: boxWidth * 4),
                                      height: boxHeight * 10,
                                      width: boxWidth * 45,
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter State Name';
                                          }
                                          return null;
                                        },
                                        controller: _userModel.stateController,
                                        decoration: InputDecoration(
                                          hintText: "State",
                                        ),
                                        keyboardType: TextInputType.text,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                      top: boxHeight * 78,
                      left: boxWidth * 15,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          alignment: Alignment.topLeft,
                          height: boxHeight * 7,
                          width: boxWidth * 70,
                          child: FlatButton(
                            color: Colors.teal,
                            onPressed: () async {
                              await userModel.insertUserLocation(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: boxWidth * 5,
                                  child: Center(
                                    child: Icon(
                                      Icons.location_on,
                                      size: boxWidth * 7,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: boxWidth * 40,
                                  child: Center(
                                    child: Text(
                                      "Confirm Your Location",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 20, right: 12, left: 12),
//               child: Form(
//                 key: userModel.formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       textCapitalization: TextCapitalization.words,
//                       controller: userModel.buildingController,

//                       decoration: InputDecoration(
//                         hintText: "Building/Apartment Number",
//                       ),
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return 'Please enter Building/Apartment Number';
//                         }
//                         return null;
//                       },
//                       // keyboardAppearance: TextInputAction.next,
//                       keyboardType: TextInputType.text,
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     TextFormField(
//                       textCapitalization: TextCapitalization.words,

//                       controller: userModel.streetController,
//                       decoration: InputDecoration(
//                         hintText: "Street Name",
//                       ),
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return 'Please enter Street Name';
//                         }
//                         return null;
//                       },
//                       // keyboardAppearance: TextInputAction.next,
//                       keyboardType: TextInputType.text,
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     TextFormField(
//                       textCapitalization: TextCapitalization.words,
//                       controller: userModel.areaController,

//                       decoration: InputDecoration(
//                         hintText: "Area",
//                       ),
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return 'Please enter Area';
//                         }
//                         return null;
//                       },
//                       // keyboardAppearance: TextInputAction.next,
//                       keyboardType: TextInputType.text,
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     TextFormField(
//                       textCapitalization: TextCapitalization.words,
//                       controller: userModel.cityController,

//                       decoration: InputDecoration(
//                         hintText: "City Name",
//                       ),
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return 'Please enter City Name';
//                         }
//                         return null;
//                       },
//                       // keyboardAppearance: TextInputAction.next,
//                       keyboardType: TextInputType.text,
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     TextFormField(
//                       textCapitalization: TextCapitalization.words,
//                       controller: userModel.pinCodeController,
//                       decoration: InputDecoration(
//                         hintText: "Pincode",
//                       ),
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return 'Please enter pincode';
//                         }
//                         if (value.length != 6) {
//                           return 'Please enter right pincode';
//                         }
//                         return null;
//                       },
//                       // keyboardAppearance: TextInputAction.next,
//                       keyboardType: TextInputType.number,
//                     ),
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     RaisedButton(
//                       onPressed: () async {
//                         await userModel.insertUserLocation(context);
//                       },
//                       child: Text("insert detail"),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
