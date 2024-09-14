import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_import.dart';

enum Fontfamily { monSterRat }

class AutoText extends StatelessWidget {
  final String? text;
  final TextAlign? textAlign;
  final double? fontSize;
  final Color? color;
  final double? spaceHeight;
  final FontWeight? fontWeight;
  final double? minfontSize;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final TextOverflow? overflow;
  final Fontfamily? fontfamily;
  final bool translate;
  const AutoText(
    this.text, {
    super.key,
    this.textAlign,
    this.fontSize = 14,
    this.color = const Color(0xff221F20),
    this.spaceHeight,
    this.fontWeight = FontWeight.w500,
    this.maxLines,
    this.minfontSize = 10,
    this.textDecoration,
    this.overflow,
    this.fontfamily = Fontfamily.monSterRat,
    this.translate = false,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;
    switch (fontfamily) {
      case Fontfamily.monSterRat:
        textStyle = GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: color,
            fontSize: fontSize,
            height: spaceHeight,
            fontWeight: fontWeight,
            decoration: textDecoration,
            decorationColor: decorationColor,
          ),
        );
        break;

      default:
        textStyle = GoogleFonts.kanit(
          textStyle: TextStyle(
            color: color,
            fontSize: fontSize,
            height: spaceHeight,
            fontWeight: fontWeight,
            decoration: textDecoration,
            decorationColor: decorationColor,
          ),
        );
    }
    return AutoSizeText(
      text!,
      textAlign: textAlign,
      maxLines: maxLines,
      minFontSize: minfontSize!,
      overflow: overflow,
      style: textStyle,
    );
  }
}
