import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
      height: Getproprateheight(265),
      width: Getpropratewidth(335),
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
                      controller: prov.gettextcontroller,
                      decoration: InputDecoration(
                          hintText: 'Title',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: Getproprateheight(18),
                    width: Getpropratewidth(65),
                    decoration: BoxDecoration(
                        color: SkyBlueTagColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: InkWell(
                        onTap: () {
                          prov.AddNotes(NoteModel(
                              borderColor: Colors.green,
                              title: titleController.text,
                              date: DateTime.now(),
                              Text: textController.text));

                          textController.clear();
                          titleController.clear();
                          Navigator.pop(context);
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
                            fontSize: 14,
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
                        fontSize: 14,
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
                              onTap: () {
                                prov.addbodercolor(to_do_selection(
                                    color: BoxColors[index],
                                    Selection: "Agender"));
                              },
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
      height: Getproprateheight(18),
      width: Getpropratewidth(18),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
