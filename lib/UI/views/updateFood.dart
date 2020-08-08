import 'package:flutter/material.dart';
import 'package:flutterhackathon/core/viewmodel/foodModel.dart';
import 'package:provider/provider.dart';

class UpdateFood extends StatelessWidget {
  static final tag = "insertFood";

  @override
  Widget build(BuildContext context) {
    // final FoodModel _foodModel = Provider.of(context);

    return Scaffold(
      body: SafeArea(
        child: Consumer<FoodModel>(
          builder: (context, foodModel, _) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: foodModel.updateFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: foodModel.updateNameController,
                        decoration: InputDecoration(
                          hintText: "Food Dish Name",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Dish Name';
                          }
                          return null;
                        },
                        // keyboardAppearance: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: foodModel.updateTimeController,
                        decoration: InputDecoration(
                          hintText: "Quantity",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Quantity';
                          }
                          return null;
                        },
                        // keyboardAppearance: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: foodModel.updateServedController,
                        decoration: InputDecoration(
                          hintText: "Time of making the food",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter';
                          }
                          return null;
                        },
                        // keyboardAppearance: TextInputAction.next,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      RaisedButton(
                        onPressed: () async {
                          await foodModel.insertFoodDetail(context);
                        },
                        child: Text("Edit the Detail"),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
