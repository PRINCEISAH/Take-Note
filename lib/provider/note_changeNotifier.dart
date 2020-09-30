import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo/Model/model.dart';

import '../Model/model.dart';
import '../Model/model.dart';
import '../Model/model.dart';

class Note_Change_Notifier extends ChangeNotifier {
  TextEditingController _textcontroller = TextEditingController();
  TextEditingController _detailecontroller = TextEditingController();

  List<NoteModel> _notes = [];
  List<to_do_selection> _todo_section = [];

  List<to_do_selection> get todosection => _todo_section;
  List<NoteModel> get notes => _notes;

  TextEditingController get gettextcontroller => _textcontroller;
  TextEditingController get getdetailedcontroller => _detailecontroller;

  void AddNotes(NoteModel model) {
    _notes.add(model);
  }

  void deletNote(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }

  void addbodercolor(to_do_selection section) {
    _todo_section.add(section);
    notifyListeners();
  }

  void titleText(text) {
    _textcontroller = text;
    notifyListeners();
  }

  void detailedText(text) {
    _detailecontroller = text;
    notifyListeners();
  }
}
