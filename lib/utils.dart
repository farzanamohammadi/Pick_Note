import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
TextStyle textStyle({required double size, required Color color, required FontWeight fw}){
return GoogleFonts.daysOne(
  fontSize: size,
  color: color,
  fontWeight: fw,
);

}