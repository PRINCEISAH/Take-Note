import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo/Color/Colors.dart';
import 'package:todo/Component/Create_Note.dart';
import 'package:todo/Model/model.dart';
import 'package:todo/SizeConfig/SizeConfig.dart';
import 'package:todo/provider/note_changeNotifier.dart';
import 'package:todo/widget/appbar.dart';

class ViewFullNote extends StatelessWidget {
  final int index;
  const ViewFullNote({
    Key key,
    this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTop(context),
      body: ViewFullNoteBody(
        index: index,
      ),
    );
  }
}

class ViewFullNoteBody extends StatefulWidget {
  final int index;
  const ViewFullNoteBody({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  _ViewFullNoteBodyState createState() => _ViewFullNoteBodyState();
}

class _ViewFullNoteBodyState extends State<ViewFullNoteBody> {
  final todobox = Hive.box('todo');

  @override
  Widget build(BuildContext context) {
    var todoindexbox = todobox.getAt(widget.index) as NoteModel;

    final prov = Provider.of<Note_Change_Notifier>(context);
    TextEditingController titleController =
        TextEditingController(text: todoindexbox.title);
    TextEditingController textController =
        TextEditingController(text: todoindexbox.Text);

    return ListView(
      children: [
        Container(
          height: SizeConfig.screenheight - 100,
          width: SizeConfig.screenWidth,
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
                      child: Container(
                        child: TextField(
                          maxLines: 2,
                          controller: titleController,
                          decoration: InputDecoration(
                              hintText: '${titleController.text}',
                              hintStyle: GoogleFonts.karla(
                                  fontSize: 24,
                                  color: BlueColor,
                                  fontWeight: FontWeight.w700),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          prov.editNote(
                              widget.index,
                              NoteModel(
                                  date: DateTime.now(),
                                  title: titleController.text,
                                  Text: textController.text));
                          print("saved");
                        },
                        child: Container(
                          height: GetHeight(20.77),
                          width: Getwidth(75),
                          decoration: BoxDecoration(
                              color: SkyBlueTagColor,
                              borderRadius: BorderRadius.circular(10)),
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
                  ],
                ),
                SizedBox(
                  height: GetHeight(12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          SvgPicture.asset("images/note.svg"),
                          SizedBox(
                            width: GetHeight(4),
                          ),
                          Container(
                            child: Text(
                              "Simple",
                              style: GoogleFonts.karla(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(138, 138, 138, 0.8)),
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                        onTap: () {},
                        child: SvgPicture.asset("images/clock.svg"))
                  ],
                ),
                SizedBox(
                  height: GetHeight(12),
                ),
                Container(
                  height: GetHeight(20),
                  child: Row(
                    children: [
                      SvgPicture.asset("images/checkbox.svg"),
                      SizedBox(
                        width: GetHeight(4),
                      ),
                      Text(
                        "To-do",
                        style: GoogleFonts.karla(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
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
                      Text("Agenda",
                          style: GoogleFonts.karla(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(138, 138, 138, 0.8)))
                    ],
                  ),
                ),
                SizedBox(
                  height: GetHeight(20),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    child: TextField(
                        maxLines: 400,
                        controller: textController,
                        decoration: new InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12),
                            labelStyle: TextStyle(fontSize: 14),
                            hintText: 'Text')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
