import 'package:flutter/material.dart';

class MyButton extends Padding {
  MyButton({required String label, required VoidCallback onPressed})
      : super(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Material(
                borderRadius: BorderRadius.circular(30.0),
                shadowColor: Colors.tealAccent.shade100,
                elevation: 5.0,
                color: Colors.teal,
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 42.0,
                  onPressed: onPressed,
                  child: Text((label),
                      style: TextStyle(fontSize: 18.0, color: Colors.white)),
                )));
}
