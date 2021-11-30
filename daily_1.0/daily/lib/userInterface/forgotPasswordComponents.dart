import 'package:flutter/material.dart';

Widget forgotPasswordTitle(BuildContext context) {
  return Column(
    children: [
      Text("Forgot Password?"),
      Text("Enter your email below to recieve password reset instructions"),
    ],
  );
}

Widget forgotPasswordCenterPiece(BuildContext context) {
  return Image(
    image: AssetImage(""),
  );
}

Widget forgotPasswordInputField(BuildContext context) {
  return TextFormField();
}

Widget forgotPasswordSend(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.red.shade300,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Text(
      "Send",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
