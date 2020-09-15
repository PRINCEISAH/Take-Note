import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/Color/Colors.dart';
import 'package:todo/SizeConfig/SizeConfig.dart';

class CreateNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> BoxColors = [OrangeColor, GreenColor, lightBlue, PinkColor];
    return Container(
        height: Getproprateheight(265),
        width: Getpropratewidth(335),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Container(
          margin: EdgeInsets.only(top: 12, right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Title",
                    style: GoogleFonts.karla(
                        color: BlueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  Container(
                    height: Getproprateheight(18),
                    width: Getpropratewidth(65),
                    decoration: BoxDecoration(
                        color: SkyBlueTagColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("images/plus.svg"),
                        SizedBox(
                          width: Getpropratewidth(3),
                        ),
                        Text(
                          "Add Tag",
                          style: GoogleFonts.karla(
                              fontSize: 10, color: Color(0xffFDFCFC)),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Getproprateheight(12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: Getproprateheight(20),
                    width: Getpropratewidth(70),
                    child: Row(
                      children: [
                        SvgPicture.asset("images/note.svg"),
                        SizedBox(
                          width: Getproprateheight(4),
                        ),
                        Text(
                          "Simple",
                          style: GoogleFonts.karla(
                              fontSize: 14,
                              color: Color.fromRGBO(138, 138, 138, 0.8)),
                        )
                      ],
                    ),
                  ),
                  SvgPicture.asset("images/clock.svg")
                ],
              ),
              SizedBox(
                height: Getproprateheight(12),
              ),
              Container(
                height: Getproprateheight(20),
                width: Getpropratewidth(70),
                child: Row(
                  children: [
                    SvgPicture.asset("images/checkbox.svg"),
                    SizedBox(
                      width: Getproprateheight(4),
                    ),
                    Text(
                      "To-do",
                      style: GoogleFonts.karla(
                          fontSize: 14,
                          color: Color.fromRGBO(138, 138, 138, 0.8)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Getproprateheight(12),
              ),
              Container(
                height: Getproprateheight(20),
                width: Getpropratewidth(70),
                child: Row(
                  children: [
                    SvgPicture.asset("images/bulletlist.svg"),
                    SizedBox(
                      width: Getproprateheight(4),
                    ),
                    Text(
                      "Agenda",
                      style: GoogleFonts.karla(
                          fontSize: 14,
                          color: Color.fromRGBO(138, 138, 138, 0.8)),
                    )
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                          BoxColors.length,
                          (index) => ColorsSelect(
                                color: BoxColors[index],
                              )),
                    ),
                    SvgPicture.asset("images/fullbox.svg")
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class ColorsSelect extends StatelessWidget {
  final Color color;

  const ColorsSelect({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Getproprateheight(18),
      width: Getpropratewidth(18),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
