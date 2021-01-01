import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Bloc/noteEvent.dart';
import 'package:todo/Bloc/noteState.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  @override
  // TODO: implement initialState
  NoteState get initialState => LoadingSate();

  @override
  Stream<NoteState> mapEventToState(NoteEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
