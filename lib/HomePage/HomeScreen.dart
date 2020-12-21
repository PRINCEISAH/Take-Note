import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/Color/Colors.dart';
import 'package:todo/Component/Bottom_Sheet_add_note.dart';
import 'package:todo/Component/Categories.dart';
import 'package:todo/Component/FullCreatNote.dart';
import 'package:todo/Component/Note.dart';
import 'package:todo/Component/ViewFullNote.dart';
import 'package:todo/Component/searchBox.dart';
import 'package:todo/SizeConfig/SizeConfig.dart';
import 'package:todo/provider/note_changeNotifier.dart';

import '../Color/Colors.dart';
import '../Component/FullCreatNote.dart';

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

    return ValueListenableBuilder(
        valueListenable: Hive.box("todo").listenable(),
        builder: (context, box, widget) {
          Box todoBox = box;
          return ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: SizeConfig.screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: GetHeight(50),
                    ),
                    SearchBox(),
                    SizedBox(
                      height: GetHeight(10),
                    ),
                    Categories(),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: List.generate(
                          todoBox.length,
                          (index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ViewFullNote(
                                              index: index,
                                            )));
                              },
                              child: Builder(
                                builder: (context) => Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Slidable(
                                    actionPane: SlidableBehindActionPane(),
                                    actionExtentRatio: 0.20,
                                    secondaryActions: [
                                      IconSlideAction(
                                        caption: "Delete",
                                        color: BackgroundColor,
                                        iconWidget: SvgPicture.asset(
                                            "images/delete.svg"),
                                        onTap: () => {
                                          Scaffold.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text("deleted"),
                                            duration: Duration(seconds: 2),
                                          )),
                                          prov.deleteNote(index),
                                          print("deleted")
                                        },
                                      )
                                    ],
                                    child: Note(
                                      dateTime: DateFormat.yMMMEd()
                                          .format(DateTime.now()),
                                      title: todoBox.getAt(index).title,
                                      text: todoBox.getAt(index).Text,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ))),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
