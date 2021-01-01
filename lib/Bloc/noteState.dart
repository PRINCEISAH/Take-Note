import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/Component/Note.dart';

abstract class NoteState extends Equatable {}

class NoteEmptyState extends NoteState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoadingSate extends NoteState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class NoteViewState extends NoteState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
