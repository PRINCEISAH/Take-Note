import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Watch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: Hive.box("todo").listenable(),
            builder: (context, box, _) {
              Box textBox = box;
              return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Center(
                        child: Text("${textBox.getAt(index)}"),
                      ),
                    );
                  });
            }));
  }
}
