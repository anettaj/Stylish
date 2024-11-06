import 'package:flutter/material.dart';

var authOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
        color: Color(0xffA8A8A9)
    )
);


var SubmitButtonStyle =  ElevatedButton.styleFrom(
    elevation: 0,
    backgroundColor: Colors.pink,
    foregroundColor: Colors.white,
    padding: EdgeInsets.all(13),
    minimumSize: const Size(double.infinity, 48),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
);
