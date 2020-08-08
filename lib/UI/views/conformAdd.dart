import 'package:flutter/material.dart';
import 'package:flutterhackathon/UI/shared/commonUtility.dart';
import 'package:provider/provider.dart';
import 'package:flutterhackathon/core/viewmodel/foodModel.dart';

class ConfirmAddress extends StatelessWidget {
  static final tag = "confirmAdd";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        title: Text(
          "Confirm Your Location",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Consumer<FoodModel>(
        builder: (context, foodModel, _) {
          return Form(
            key: foodModel.confirmLocationForm,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: foodModel.confirmLocationController,
                    decoration: InputDecoration(
                      labelText: 'Your Location',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Location';
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
                    onPressed: () async {
                      await foodModel.insertFoodDetail(context);
                    },
                    child: Text('Post Food Details'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
