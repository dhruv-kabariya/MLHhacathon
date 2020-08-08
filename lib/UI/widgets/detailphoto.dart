import 'package:flutter/material.dart';

class DetailPhoto extends StatelessWidget {
  const DetailPhoto({
    Key key,
    @required this.boxHeight,
    @required this.photo,
  }) : super(key: key);

  final double boxHeight;
  final String photo;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      child: Container(
        height: boxHeight * 20,
        width: boxHeight * 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: photo != null || photo != ""
                  ? NetworkImage(photo)
                  : AssetImage("assets/f1.jpeg"),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
