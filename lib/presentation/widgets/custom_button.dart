import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final onPressed;

  const CustomButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0,
      onPressed: onPressed,
      color: const Color.fromARGB(255, 105, 73, 254),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      // ignore: prefer_const_constructors
      child: Text(
        'Second Screen',
        style: const TextStyle(
          color: Colors.white,
          letterSpacing: .5,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
