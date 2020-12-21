import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todo/Color/Colors.dart';
import 'package:todo/SizeConfig/SizeConfig.dart';

class Note extends StatelessWidget {
  final String text;
  final String title;
  final Color color;
  final String section;
  final dateTime;
  const Note(
      {Key key, this.section, this.dateTime, this.text, this.color, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetHeight(120),
      width: Getwidth(335),
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
                Container(
                  width: Getwidth(180),
                  child: Text(
                    "${title}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.karla(
                        fontSize: 16,
                        color: Color(0xff4F55A1),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text("${dateTime}",
                    style: GoogleFonts.karla(
                        fontSize: 14,
                        color: Color(0xff4F55A1),
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Container(
            height: GetHeight(30),
            margin: EdgeInsets.only(left: 16, right: 76),
            child: Text(
              "${text}",
              overflow: TextOverflow.ellipsis,
              style:
                  GoogleFonts.karla(fontSize: 13, fontWeight: FontWeight.w400),
              maxLines: 2,
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              Box todobox = Hive.box("todo");
              print(todobox.length);
              print(todobox.values);
            },
            child: Container(
              height: GetHeight(19),
              width: Getwidth(52),
              decoration: BoxDecoration(color: OrangeColor),
            ),
          )
        ],
      ),
    );
  }
}
