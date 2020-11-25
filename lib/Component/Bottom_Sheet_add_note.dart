import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/Color/Colors.dart';
import 'package:todo/Component/Create_Note.dart';
import 'package:todo/SizeConfig/SizeConfig.dart';

class BottomSheetAddNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void ShowCreateDialog() {
      showDialog(
          context: (context),
          builder: (BuildContext context) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: CreateNote());
          });
    }

    return InkWell(
      onTap: () => ShowCreateDialog(),
      child: Container(
        height: GetHeight(50),
        width: Getwidth(375),
        decoration: BoxDecoration(
          color: BlueColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("images/add.svg"),
            SizedBox(
              width: Getwidth(10),
            ),
            Text(
              "New Note",
              style: GoogleFonts.karla(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
