import 'package:flutter/material.dart';
import 'package:todo/Color/Colors.dart';
import 'package:todo/Component/Bottom_Sheet_add_note.dart';
import 'package:todo/Component/Categories.dart';
import 'package:todo/Component/searchBox.dart';
import 'package:todo/SizeConfig/SizeConfig.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomSheet: BottomSheetAddNote(),
      backgroundColor: BackgroundColor,
      body: Screen(),
    );
  }
}

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          SizedBox(
            height: Getproprateheight(50),
          ),
          SearchBox(),
          SizedBox(
            height: Getproprateheight(10),
          ),
          Categories(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
