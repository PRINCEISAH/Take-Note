import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/Color/Colors.dart';
import 'package:todo/SizeConfig/SizeConfig.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Container(
        height: Getproprateheight(61),
        width: Getpropratewidth(321),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [AllCard(), ToDoCard(), AgendaCard()],
        ),
      ),
    );
  }
}

class AllCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Getproprateheight(61),
        width: Getpropratewidth(80),
        decoration: BoxDecoration(
            color: OrangeColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4, right: 6),
              child: Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset("images/list.svg")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, bottom: 4),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "All",
                  style: GoogleFonts.karla(fontSize: 14, color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }
}

class ToDoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Getproprateheight(61),
        width: Getpropratewidth(99),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4, right: 6),
              child: Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset("images/Check.svg")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, bottom: 4),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "To-do",
                  style: GoogleFonts.karla(fontSize: 14),
                ),
              ),
            )
          ],
        ));
  }
}

class AgendaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Getproprateheight(61),
        width: Getpropratewidth(112),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4, left: 6),
              child: Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset("images/agenda.svg")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6, bottom: 4),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Agenda",
                  style: GoogleFonts.karla(fontSize: 14),
                ),
              ),
            )
          ],
        ));
  }
}
