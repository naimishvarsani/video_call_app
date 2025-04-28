import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonWidget {
  Widget robotoText(
      {text,
      textMaxline,
      textOverFlow,
      textAlign,
      textColor,
      textSize,
      textWeight}) {
    return Text(text,
        maxLines: textMaxline,
        overflow: textOverFlow,
        textAlign: textAlign,
        style: GoogleFonts.roboto(
          color: textColor,
          fontSize: textSize,
          fontWeight: textWeight,
        ));
  }
}
