import 'package:flutter/material.dart';
import 'package:flutterhackathon/UI/views/foodDetail.dart';

import './detailcard.dart';
import './detailphoto.dart';

class DashBoardCard extends StatelessWidget {
  final snapshotIndex;
  DashBoardCard({@required this.snapshotIndex});
  @override
  Widget build(BuildContext context) {
    double boxHeight = MediaQuery.of(context).size.height / 100;
    double boxWidth = MediaQuery.of(context).size.width / 100;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FoodDetail(
              snapshot: snapshotIndex,
            ),
          ),
        );
      },
      child: Container(
        height: boxHeight * 27,
        width: boxWidth * 100,
        margin: EdgeInsets.only(top: 10),
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: 0,
              child: DetailCard(
                boxWidth: boxWidth,
                boxHeight: boxHeight,
                snapshotIndex: snapshotIndex,
              ),
            ),
            Positioned(
              right: boxWidth * 5,
              top: boxHeight * 2.5,
              child: DetailPhoto(
                boxHeight: boxHeight,
                photo: snapshotIndex.data['photo'] ?? "",
              ),
            )
          ],
        ),
      ),
    );
  }
}
