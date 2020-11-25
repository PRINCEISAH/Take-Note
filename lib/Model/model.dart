import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class NoteModel {
  @HiveField(0)
  final title;
  @HiveField(1)
  final Text;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  NoteModel({
    this.title,
    this.date,
    this.Text,
  });
}
