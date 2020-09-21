import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Color/Colors.dart';
import 'package:todo/Component/Bottom_Sheet_add_note.dart';
import 'package:todo/Component/Categories.dart';
import 'package:todo/Component/Note.dart';
import 'package:todo/Component/searchBox.dart';
import 'package:todo/SizeConfig/SizeConfig.dart';
import 'package:todo/provider/note_changeNotifier.dart';

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
    var prov = Provider.of<Note_Change_Notifier>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: SizeConfig.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          InkWell(
            onTap: () {},
            child: Note(
              title: "coreteam meeting",
              text: "with d lead and others",
            ),
          ),
          Column(
            children: List.generate(
                prov.notes.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Note(
                        title: prov.notes[index].title,
                        text: prov.notes[index].Text,
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
