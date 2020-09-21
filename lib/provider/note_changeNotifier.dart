import 'package:flutter/material.dart';
import 'package:todo/Model/model.dart';

class Note_Change_Notifier extends ChangeNotifier {
  List<NoteModel> _notes = [];

  List<NoteModel> get notes => _notes;
  void AddNotes(NoteModel model) {
    _notes.add(model);
  }
}
