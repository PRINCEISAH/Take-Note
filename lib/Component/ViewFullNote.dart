import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/Color/Colors.dart';
import 'package:todo/Component/Create_Note.dart';
import 'package:todo/Model/model.dart';
import 'package:todo/SizeConfig/SizeConfig.dart';
import 'package:todo/provider/note_changeNotifier.dart';
import 'package:todo/widget/appbar.dart';

class ViewFullNote extends StatelessWidget {
  final Text;
  final title;

  const ViewFullNote({Key key, this.Text, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTop(),
      body: ViewFullNoteBody(
        eText: Text,
        eTitle: title,
      ),
    );
  }
}

class ViewFullNoteBody extends StatefulWidget {
  final String eText;
  final String eTitle;

  const ViewFullNoteBody({Key key, this.eText, this.eTitle}) : super(key: key);

  @override
  _ViewFullNoteBodyState createState() => _ViewFullNoteBodyState();
}

class _ViewFullNoteBodyState extends State<ViewFullNoteBody> {
  TextEditingController titleController = TextEditingController();

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Note_Change_Notifier>(context);

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
                      flex: 4,
                      child: Container(
                        height: Getproprateheight(28),
                        child: TextField(
                          controller:
                              TextEditingController(text: widget.eTitle),
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
                      child: Container(
                        height: Getproprateheight(20.77),
                        width: Getpropratewidth(75),
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
                                return Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Title and Text cannot be empty")));
                              else {
                                prov.AddNotes(NoteModel(
                                    borderColor: Colors.green,
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
                                  width: Getpropratewidth(3),
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
                  height: Getproprateheight(12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: Getproprateheight(20),
                      width: Getpropratewidth(70),
                      child: Row(
                        children: [
                          SvgPicture.asset("images/note.svg"),
                          SizedBox(
                            width: Getproprateheight(4),
                          ),
                          Text(
                            "Simple",
                            style: GoogleFonts.karla(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(138, 138, 138, 0.8)),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          print("${prov.notes.length}");
                        },
                        child: SvgPicture.asset("images/clock.svg"))
                  ],
                ),
                SizedBox(
                  height: Getproprateheight(12),
                ),
                Container(
                  height: Getproprateheight(20),
                  width: Getpropratewidth(70),
                  child: Row(
                    children: [
                      SvgPicture.asset("images/checkbox.svg"),
                      SizedBox(
                        width: Getproprateheight(4),
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
                  height: Getproprateheight(12),
                ),
                Container(
                  height: Getproprateheight(20),
                  width: Getpropratewidth(70),
                  child: Row(
                    children: [
                      SvgPicture.asset("images/bulletlist.svg"),
                      SizedBox(
                        width: Getproprateheight(4),
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
                  height: Getproprateheight(20),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    child: TextField(
                        maxLines: 400,
                        controller: TextEditingController(text: widget.eText),
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
