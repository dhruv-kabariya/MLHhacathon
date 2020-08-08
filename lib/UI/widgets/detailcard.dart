import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({
    Key key,
    @required this.boxWidth,
    @required this.boxHeight,
    @required this.snapshotIndex,
  }) : super(key: key);

  final double boxWidth;
  final double boxHeight;
  final snapshotIndex;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.only(bottom: 20),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          width: boxWidth * 70,
          height: boxHeight * 25,
          child: Padding(
            padding: EdgeInsets.only(left: boxWidth * 5, top: boxWidth * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Loaction"),
                        Text(
                          snapshotIndex.data['location'],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("No Of People Can Served"),
                        Text(snapshotIndex.data['served'])
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Time Of Prepared"),
                        Text(snapshotIndex.data['time'])
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
