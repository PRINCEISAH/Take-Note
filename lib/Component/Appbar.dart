import 'package:flutter/material.dart';

Widget HomeAppbar() {
  return AppBar(
    backgroundColor: Colors.pink,
    actions: [
      IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: null),
      IconButton(
          icon: Icon(
            Icons.arrow_drop_down_circle,
            color: Colors.white,
          ),
          onPressed: null)
    ],
  );
}
