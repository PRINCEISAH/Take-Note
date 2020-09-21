import 'package:flutter/material.dart';
import 'package:todo/Component/Create_Note.dart';

class FullNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FullNoteBody(),
    );
  }
}

class FullNoteBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [CreateNote()],
      ),
    );
  }
}
