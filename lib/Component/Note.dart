import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/Color/Colors.dart';
import 'package:todo/SizeConfig/SizeConfig.dart';

class Note extends StatelessWidget {
  final String text;
  final String title;
  final Color color;
  const Note({Key key, this.text, this.color, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Getproprateheight(100),
      width: Getpropratewidth(335),
      decoration:
          BoxDecoration(border: Border.all(color: color), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 17, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${title}",
                  style: GoogleFonts.karla(
                      fontSize: 16,
                      color: Color(0xff4F55A1),
                      fontWeight: FontWeight.bold),
                ),
                Text("Today")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16, right: 76),
            child: Text("${text}"),
          ),
          Spacer(),
          Container(
            height: Getproprateheight(19),
            width: Getpropratewidth(52),
            decoration: BoxDecoration(color: OrangeColor),
          )
        ],
      ),
    );
  }
}
