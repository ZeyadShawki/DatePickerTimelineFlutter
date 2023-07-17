// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'color_extension.dart';

extension StringExtensions on String {
  String capitalize() {
    List<String> words = split(' ');
    for (int i = 0; i < words.length; i++) {
      words[i] =
          "${words[i][0].toUpperCase()}${words[i].substring(1).toLowerCase()}";
    }
    return words.join(' ');
  }

 

  String timeAdjust(DateTime time) {
    if (time.hour < 10) {
      if (time.minute < 10) {
        return '0' "${time.hour}:${time.minute}" '0';
      } else {
        return '0' "${time.hour}:${time.minute}";
      }
    } else {
      if (time.minute < 10) {
        return "${time.hour}:${time.minute}" '0';
      } else {
        return "${time.hour}:${time.minute}";
      }
    }
  }

  // Returns true if email address is in use.


  String dateToStringAdjust({
    required String fromDate,
    required String toTime,
  }) {
    fromDate = fromDate.replaceAll('/', '-');
    final date = fromDate.split('-');
    String returnDate = '';
    if (int.parse(date[1]) < 10) {
      if (int.parse(date[0]) < 10) {
        returnDate = date[2] +
            '-' +
            '0' +
            date[0] +
            '-' +
            '0' +
            date[1] +
            " " +
            toTime +
            ':00';
      } else {
        returnDate = date[2] +
            '-' +
            date[0] +
            '-' +
            '0' +
            date[1] +
            " " +
            toTime +
            ':00';
      }
    } else {
      if (int.parse(date[0]) < 10) {
        returnDate = date[2] +
            '-' +
            '0' +
            date[0] +
            '-' +
            date[1] +
            " " +
            toTime +
            ':00';
      } else {
        returnDate =
            date[2] + '-' + date[0] + '-' + date[1] + " " + toTime + ':00';
      }
    }
    return returnDate;
  }

  String adjustMinHours(DateTime sub) {
    if (sub.hour < 10) {
      if (sub.minute < 10) {
        return '0' "${sub.hour}:${sub.minute}" '0';
      } else {
        return '0' "${sub.hour}:${sub.minute}";
      }
    } else {
      if (sub.minute < 10) {
        return "${sub.hour}:${sub.minute}" '0';
      } else {
        return "${sub.hour}:${sub.minute}";
      }
    }
  }


  Image toAssetImage({double? height, double? width}) => Image.asset(
        this,
        height: height,
        width: width,
      );



  Widget toSubTitle(
          {num fontSize = AppFontSize.subTitle1,
          FontWeight fontWeight = FontWeight.w400,
          Color color = Colors.black,
          Color linkColor = Colors.black,
          TextAlign textAlgin = TextAlign.start,
          void Function(String)? launchFunction,
          void Function(String)? onTapHashtag,
          void Function(String)? onTapMention,
          TextOverflow overflow = TextOverflow.clip,
          double? letterSpacing,
          int? maxLines,
          String? fontFamily,
          TextStyle? style,
          bool underline = false}) =>
      Linkify(
        strutStyle: const StrutStyle(
          height: 1.0,
          forceStrutHeight: false,
        ),
        onOpen: (link) async {
          // closing keyboard
          FocusManager.instance.primaryFocus!.unfocus();
          SystemChannels.textInput.invokeMethod('TextInput.hide');
   
        },
        linkifiers: const [
          UrlLinkifier(),
          EmailLinkifier(),
        ],
        overflow: overflow,
        text: this,
        maxLines: maxLines,
        textAlign: textAlgin,
        style:style ,
        linkStyle: TextStyle(
          color: linkColor,
          height: 0.8,
          decoration: TextDecoration.none,
        ),
      );

  bool get isValidEmail {
    // final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    // return emailRegExp.hasMatch(this);
    final emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailValid.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp = RegExp(r"^[\p{L} ,.'-]*$",
        caseSensitive: false, unicode: true, dotAll: true);

    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    // ignore: unnecessary_null_comparison
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}

class AppFontSize {
  static const num headLine6 = 20;
  static const num headLine5 = 24;
  static const num headLine4 = 34;
  static const num headLine3 = 48;
  static const num headLine2 = 60;
  static const num headLine1 = 96;
  static const num subTitle1 = 16;
  static const num subTitle2 = 14;
  static const num bodyText1 = 16;
  static const num bodyText2 = 14;
  static const num button = 15;
  static const num caption = 12;
  static const num overLine = 10;
}

TextStyle myFontStyle(
    {FontWeight? fontWeight, required double fontSize, double? letterSpacing}) {
  return TextStyle(
      fontWeight: fontWeight,
      fontSize: ScreenUtil().setSp(fontSize),
      letterSpacing: letterSpacing);
}

class AppTheme {
  static TextStyle get headline5 => myFontStyle(
      fontSize: AppFontSize.headLine5.sp, fontWeight: FontWeight.w600);
  static TextStyle get headline6 => myFontStyle(
      fontWeight: FontWeight.w600,
      fontSize: AppFontSize.headLine6.sp,
      letterSpacing: 0.15);
  static TextStyle get headline4 => myFontStyle(
      fontSize: AppFontSize.headLine4.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);
  static TextStyle get headline3 => myFontStyle(
      fontSize: AppFontSize.headLine3.sp, fontWeight: FontWeight.w400);
  static TextStyle get headline2 => myFontStyle(
      fontSize: AppFontSize.headLine2.sp,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5);
  static TextStyle get headline1 => myFontStyle(
      fontSize: AppFontSize.headLine1.sp,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5);
  static TextStyle get subTitle1 => myFontStyle(
      fontSize: AppFontSize.subTitle1.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15);
  static TextStyle get subTitle2 => myFontStyle(
      fontSize: AppFontSize.subTitle2.sp,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1);
  static TextStyle get bodyText1 => myFontStyle(
      fontSize: AppFontSize.bodyText1.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5);
  static TextStyle get bodyText2 => myFontStyle(
      fontSize: AppFontSize.bodyText2.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25);
  static TextStyle get button => myFontStyle(
      fontSize: AppFontSize.button.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1);
  static TextStyle get caption => myFontStyle(
      fontSize: AppFontSize.caption.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4);
  static TextStyle get overLine => myFontStyle(
      fontSize: AppFontSize.overLine.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5);
}

