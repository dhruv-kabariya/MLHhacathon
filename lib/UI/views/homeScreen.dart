import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutterhackathon/UI/views/dashboard.dart';
import 'package:flutterhackathon/UI/views/userLocation.dart';
import 'package:flutterhackathon/UI/widgets/drawer.dart';
import 'package:flutterhackathon/bloc/network.dart';
import 'package:flutterhackathon/core/viewmodel/foodModel.dart';

import 'package:provider/provider.dart';

import '../../bloc/network.dart';
import '../widgets/drawer.dart';
import './dashboard.dart';

import 'package:flutterhackathon/UI/widgets/appbar.dart';

class HomeScreen extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  static final tag = "home";
  final NetworkBloc bloc = NetworkBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      body: Container(
        child: MainScreen(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "insertFood");
        },
        child: Icon(Icons.add),
        tooltip: "Add Food Detail",
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodModel>(
      builder: (context, foodModel, _) {
        return StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection("Food").snapshots(),
          // initialData: initialData,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            return snapshot.data != null
                ? SafeArea(
                    child: CustomScrollView(
                      slivers: [
                        SliverPersistentHeader(
                          delegate: CustomAppBar(),
                        ),
                        DashBoardScreen(snapshot: snapshot.data.documents)
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        );
      },
    );
  }
}
