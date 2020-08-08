import 'package:flutter/material.dart';
import 'package:flutterhackathon/core/viewmodel/foodModel.dart';
import 'package:provider/provider.dart';

class InsertFood extends StatelessWidget {
  static final tag = "insertFood";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<FoodModel>(
          builder: (context, foodModel, _) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: foodModel.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: foodModel.nameController,
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
                        controller: foodModel.servedController,
                        decoration: InputDecoration(
                          hintText: "How many peoples can serve",
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
                      TextFormField(
                        textCapitalization: TextCapitalization.words,
                        controller: foodModel.timeController,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Choose Book Image"),
                          InkWell(
                            onTap: () {
                              foodModel.getImage();
                            },
                            child: Icon(Icons.image),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      RaisedButton(
                        onPressed: () async {
                          await foodModel.insertFoodDetail(context);
                        },
                        child: Text("insert detail"),
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
