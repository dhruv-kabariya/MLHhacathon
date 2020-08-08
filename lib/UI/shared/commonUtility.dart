import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color kprimaryColor = Color(0xff52BB70);
Color kaccentColor = Color(0xFFffcc00);

showFlutterToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      // timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

cirularAlertDialog(BuildContext context) async {
  return showDialog(
    barrierDismissible: false,
    context: context,
    child: AlertDialog(
      content: Row(
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(
            width: 10,
          ),
          Text("Please wait..."),
        ],
      ),
    ),
  );
}

Color kGreen = Color(0xff52BB70);

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    Text text,
    @required this.size,
    @required this.textdata,
    @required this.function,
  }) : super(key: key);

  final Size size;
  final Text textdata;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      child: RaisedButton(
        onPressed: function,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
        ),
        color: kGreen,
        textColor: Colors.white,
        child: textdata,
      ),
    );
  }
}
