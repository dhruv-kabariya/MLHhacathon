import 'package:flutter/material.dart';
import 'package:flutterhackathon/UI/shared/commonUtility.dart';
import 'package:flutterhackathon/core/viewmodel/foodModel.dart';
import 'package:flutterhackathon/sharedPref.dart';
import 'package:provider/provider.dart';

class FoodDetail extends StatelessWidget {
  static final tag = "foodDetail";
  final snapshot;
  FoodDetail({this.snapshot});
  @override
  Widget build(BuildContext context) {
    final FoodModel _foodModel = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        // body: Container(
        //   color: Colors.black,
        //   child: CustomScrollView(
        //     slivers: <Widget>[
        //       SliverAppBar(
        //         expandedHeight: 200.0,
        //         floating: true,
        //         pinned: true,
        //         snap: true,
        //         actionsIconTheme: IconThemeData(opacity: 0.0),
        //         flexibleSpace: Container(
        //           decoration: BoxDecoration(
        //             gradient: LinearGradient(
        //               colors: [
        //                 Colors.transparent,
        //                 Colors.transparent,
        //                 Colors.black45
        //               ],
        //             ),
        //           ),
        //           child: Stack(
        //             children: <Widget>[
        //               Positioned.fill(
        //                 child: Image.network(
        //                   snapshot['photo'],
        //                   fit: BoxFit.cover,
        //                 ),
        //               ),
        //               Positioned(
        //                 bottom: 15,
        //                 left: 15,
        //                 child: Text(
        //                   snapshot.data['name'],
        //                   style: TextStyle(color: Colors.white, fontSize: 30),
        //                 ),
        //               )
        //             ],
        //           ),
        //         ),
        //       ),
        //       // SliverFillRemaining(
        //       //   child: Text("Location"),
        //       // ),
        //       SliverToBoxAdapter(
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text(
        //             "Location",
        //             style: TextStyle(
        //                 fontWeight: FontWeight.bold, color: Colors.white),
        //           ),
        //         ),
        //       ),
        //       SliverToBoxAdapter(
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Row(
        //             children: [
        //               Icon(Icons.location_on),
        //               SizedBox(
        //                 width: 20,
        //               ),
        //               Text(
        //                 snapshot.data['location'],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //       // SliverToBoxAdapter(
        //       //   child: Padding(
        //       //     padding: const EdgeInsets.all(8.0),
        //       //     child: Text("Dish Name"),
        //       //   ),
        //       // ),

        //       // SliverToBoxAdapter(
        //       //   child: Padding(
        //       //     padding: const EdgeInsets.all(8.0),
        //       //     child: Text(
        //       //       snapshot.data['name'],
        //       //     ),
        //       //   ),
        //       // ),
        //       SliverToBoxAdapter(
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text(
        //             "Number of peoples can be servered",
        //             style: TextStyle(
        //                 fontWeight: FontWeight.bold, color: Colors.white),
        //           ),
        //         ),
        //       ),

        //       SliverToBoxAdapter(
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Row(
        //             children: [
        //               Icon(Icons.person),
        //               SizedBox(
        //                 width: 20,
        //               ),
        //               Text(
        //                 snapshot.data['served'],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),

        //       SliverToBoxAdapter(
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text(
        //             "Prepare Time",
        //             style: TextStyle(
        //                 fontWeight: FontWeight.bold, color: Colors.white),
        //           ),
        //         ),
        //       ),

        //       SliverToBoxAdapter(
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Row(
        //             children: [
        //               Icon(Icons.timer),
        //               SizedBox(
        //                 width: 20,
        //               ),
        //               Text(
        //                 snapshot.data['time'],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),

        //       SliverToBoxAdapter(
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text(
        //             "How many hours Food can be good to eat",
        //             style: TextStyle(
        //                 fontWeight: FontWeight.bold, color: Colors.white),
        //           ),
        //         ),
        //       ),

        //       SliverToBoxAdapter(
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Row(
        //             children: [
        //               Icon(Icons.arrow_forward),
        //               SizedBox(
        //                 width: 20,
        //               ),
        //               Text(
        //                 snapshot.data['goodForHowManyHours'] + " Hours",
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),

        //       SliverToBoxAdapter(
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text(
        //             "Status",
        //             style: TextStyle(
        //                 fontWeight: FontWeight.bold, color: Colors.white),
        //           ),
        //         ),
        //       ),

        //       SliverToBoxAdapter(
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Row(
        //             children: [
        //               Icon(Icons.error),
        //               SizedBox(
        //                 width: 20,
        //               ),
        //               Text(
        //                 snapshot.data['status'],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4.2,
                  ),
                  Text(
                    snapshot.data['name'],
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Card(
                      elevation: 10,
                      child: FadeInImage(
                        placeholder: AssetImage("assets/logo.jpg"),
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          snapshot.data['photo'],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Time",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          snapshot.data['time'],
                        )
                      ],
                    ),
                  ),
                  // Padding(
                  // padding: const EdgeInsets.all(8.0),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Number of peoples can be servered",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        snapshot.data['served'],
                      )
                    ],
                    // ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Location",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          snapshot.data['location'],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "status",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          snapshot.data['status'],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Number of peoples can be servered",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        snapshot.data['served'],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Text(
              //             "How many hours Food can be good to eat",
              //             style: TextStyle(fontWeight: FontWeight.bold),
              //           ),
              //         ),
              //         Text(
              //           snapshot.data['goodForHowManyHours'],
              //         )
              //       ],
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text("Do you want to Pick Up"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    RaisedButton(
                      child: Text('Yes'),
                      onPressed: () {
                        _foodModel.updateStatus(context, snapshot.data['id']);
                        SPHelper.setBoolean("picked", true);
                        SPHelper.setString("foodId", snapshot.data['id']);

                        // await userModel.signOut();
                        Navigator.of(context).pop();
                        Navigator.pushNamedAndRemoveUntil(
                            context, "onTheWay", (route) => false);
                        showFlutterToast(
                            "You can't do anything while on the way");
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(Icons.airport_shuttle),
        ),
      ),
    );
  }
}
