import 'package:flutter/widgets.dart';

class NoteModel {
  final title;
  final Text;
  final Color borderColor;
  final DateTime date;
  final to_do_selection select;
  NoteModel({this.title, this.select, this.date, this.Text, this.borderColor});
}

class to_do_selection {
  final String Selection;
  final Color color;
  to_do_selection({this.Selection, this.color});
}
