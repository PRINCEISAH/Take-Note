import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo/Color/Colors.dart';
import 'package:todo/Component/FullCreatNote.dart';
import 'package:todo/Model/model.dart';
import 'package:todo/SizeConfig/SizeConfig.dart';
import 'package:todo/provider/note_changeNotifier.dart';
import 'package:intl/intl.dart';

import '../Model/model.dart';
import '../Model/model.dart';

class CreateNote extends StatefulWidget {
  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  TextEditingController titleController = TextEditingController();

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Color> BoxColors = [OrangeColor, GreenColor, lightBlue, PinkColor];
    final prov = Provider.of<Note_Change_Notifier>(context);

    Color color;

    Color selectColor(int index) {
      return BoxColors[index];
    }

    return Container(
      height: GetHeight(265),
      width: Getwidth(335),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: EdgeInsets.only(top: 12, right: 16, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: Getwidth(100),
                    height: GetHeight(28),
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          hintText: 'Title',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: GetHeight(18),
                    width: Getwidth(65),
                    decoration: BoxDecoration(
                        color: SkyBlueTagColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: InkWell(
                        onTap: () {
                          if (textController.text.isEmpty &&
                              titleController.text.isEmpty)
                            return Scaffold.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("Title and Text cannot be empty")));
                          else {
                            prov.addtodo(NoteModel(
                                title: titleController.text,
                                date: DateTime.now(),
                                Text: textController.text));

                            textController.clear();
                            titleController.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("images/plus.svg"),
                            SizedBox(
                              width: Getwidth(3),
                            ),
                            Text(
                              "Save",
                              style: GoogleFonts.karla(
                                  fontSize: 10, color: Color(0xffFDFCFC)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: GetHeight(12),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: GetHeight(20),
                  width: Getwidth(70),
                  child: Row(
                    children: [
                      SvgPicture.asset("images/note.svg"),
                      SizedBox(
                        width: GetHeight(4),
                      ),
                      Text(
                        "Simple",
                        style: GoogleFonts.karla(
                            fontSize: 14,
                            color: Color.fromRGBO(138, 138, 138, 0.8)),
                      )
                    ],
                  ),
                ),
                InkWell(
                    onTap: () {}, child: SvgPicture.asset("images/clock.svg"))
              ],
            ),
            SizedBox(
              height: GetHeight(12),
            ),
            Container(
              height: GetHeight(20),
              width: Getwidth(70),
              child: Row(
                children: [
                  SvgPicture.asset("images/checkbox.svg"),
                  SizedBox(
                    width: GetHeight(4),
                  ),
                  Text(
                    "To-do",
                    style: GoogleFonts.karla(
                        fontSize: 14,
                        color: Color.fromRGBO(138, 138, 138, 0.8)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: GetHeight(12),
            ),
            Container(
              height: GetHeight(20),
              width: Getwidth(70),
              child: Row(
                children: [
                  SvgPicture.asset("images/bulletlist.svg"),
                  SizedBox(
                    width: GetHeight(4),
                  ),
                  Text(
                    "Agenda",
                    style: GoogleFonts.karla(
                        fontSize: 14,
                        color: Color.fromRGBO(138, 138, 138, 0.8)),
                  )
                ],
              ),
            ),
            Container(
              child: TextField(
                controller: textController,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                        BoxColors.length,
                        (index) => InkWell(
                              child: ColorsSelect(
                                color: BoxColors[index],
                              ),
                            )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => FullNote()));
                      print("next");
                    },
                    child: Container(
                        child: SvgPicture.asset("images/fullbox.svg")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ColorsSelect extends StatelessWidget {
  final Color color;

  const ColorsSelect({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetHeight(18),
      width: Getwidth(18),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
