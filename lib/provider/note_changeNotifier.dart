import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/Model/model.dart';

class Note_Change_Notifier extends ChangeNotifier {
  final Todobox = Hive.box("todo");

  void AddNotes(NoteModel model) {}

  void deletNote(int index) {
    Todobox.deleteAt(index);
    notifyListeners();
  }

  void editNote(int index, NoteModel note) {
    Todobox.putAt(index, note);
    print(Todobox.values);
  }
}
