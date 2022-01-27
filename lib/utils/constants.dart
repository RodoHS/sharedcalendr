import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double horizontalSpacing = 20.0;
const String genericErrorMsg = 'Sorry, Something went wrong, please try again or contact support.';
const Color barrierColor = Colors.black12;

TextStyle paragraph = GoogleFonts.openSans(
  fontSize: 16,
  color: Colors.black,
  fontWeight: FontWeight.w400,
);

TextStyle ubuntuTitle = GoogleFonts.ubuntu(
  fontSize: 28,
  color: Colors.black87,
  fontWeight: FontWeight.w600,
);

TextStyle ubuntuBold = GoogleFonts.ubuntu(
  color: Colors.black,
  fontSize: 22,
  fontWeight: FontWeight.w600,
);

TextStyle ubuntuSmallBold = GoogleFonts.ubuntu(
  color: Colors.blueGrey,
  fontSize: 14,
  fontWeight: FontWeight.bold,
);

TextStyle ubuntuSmall = GoogleFonts.ubuntu(
  color: Colors.black,
  fontSize: 14,
  fontStyle: FontStyle.normal,
);
