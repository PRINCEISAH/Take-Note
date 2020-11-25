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

class FullNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTop(context),
      body: ListView(
        children: [
          FullNoteBody(),
        ],
      ),
    );
  }
}

class FullNoteBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [CreateFullNote()],
      ),
    );
  }
}

class CreateFullNote extends StatefulWidget {
  @override
  _CreateFullNoteState createState() => _CreateFullNoteState();
}

class _CreateFullNoteState extends State<CreateFullNote> {
  TextEditingController titleController = TextEditingController();

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Color> BoxColors = [OrangeColor, GreenColor, lightBlue, PinkColor];
    final prov = Provider.of<Note_Change_Notifier>(context);

    void addtodo(NoteModel note) {
      Box todobox = Hive.box("todo");
      todobox.add(note);
    }

    Color color;

    Color selectColor(int index) {
      return BoxColors[index];
    }

    return Container(
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
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          hintText: 'Title',
                          hintStyle: GoogleFonts.karla(
                              fontSize: 24,
                              color: BlueColor,
                              fontWeight: FontWeight.w700),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: GetHeight(20.77),
                    width: Getwidth(75),
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
                  child: Row(
                    children: [
                      SvgPicture.asset("images/note.svg"),
                      SizedBox(
                        width: GetHeight(4),
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
                    onTap: () {}, child: SvgPicture.asset("images/clock.svg"))
              ],
            ),
            SizedBox(
              height: GetHeight(12),
            ),
            Container(
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
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(fontSize: 14),
                        hintText: 'Text')),
              ),
            ),
            Spacer(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                        BoxColors.length,
                        (index) => InkWell(
                              onTap: () {
                                print("$index");
                              },
                              child: FullColorsSelect(
                                color: BoxColors[index],
                              ),
                            )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FullColorsSelect extends StatelessWidget {
  final Color color;

  const FullColorsSelect({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetHeight(41),
      width: Getwidth(41),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
