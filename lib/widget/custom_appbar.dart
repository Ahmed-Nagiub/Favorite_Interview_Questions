import 'package:flutter/material.dart';

AppBar customAppBar(String title) {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    backgroundColor: Colors.blueAccent[300],
    elevation: 1,
    title:  Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
