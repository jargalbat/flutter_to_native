import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';


class Func {
  // static final logger = Logger('Utils');

//  static String baseId;

  // Generate a v1 (time-based) id
//  uuid.v1(); // -> '6c84fb90-12c4-11e1-840d-7b25c5ee775a'

// Generate a v4 (random) id
//  uuid.v4(); // -> '110ec58a-a0f2-4ac4-8393-c866d813b8d1'

// Generate a v5 (namespace-name-sha1-based) id
//  uuid.v5(Uuid.NAMESPACE_URL, 'www.google.com'); // -> 'c74a196f-f19d-5ea9-bffd-a2742432fc9c'

  static() {
    // logger.func = "static";
    // logger.log(s: 1);
  }

  static String uuid() {
    return Uuid().v1();
  }

  static String nextTrace() {
    // logger.func = "nextTrace";

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyyMMddHHmmss');
    String trace = formatter.format(now) + "00";

    // logger.log(s: 1, m: "TRACENO: $trace, len:${trace.length.toString()}");
    return trace;
  }

  static bool isNullEmpty(Object o) => o == null || "" == o;

  static bool isNullEmptyOrFalse(Object o) =>
      o == null || false == o || "" == o;

  static bool isNullEmptyFalseOrZero(Object o) =>
      o == null || false == o || 0 == o || "" == o;

  static int toInt2(Object o) {
    if (isNullEmpty(o)) {
      return 0;
    }
    return int.parse(o);
  }

  static int toInt(Object o) => isNullEmpty(o) ? 0 : int.parse(o);
  static bool toBoolFromObj(Object o) =>
      toBool(isNullEmpty(o) ? 0 : int.parse(o));
  static bool toBool(int i) => i == 1 ? true : false;
  static bool toBoolFromStr(String s) =>
      isNullEmpty(s) ? false : s.toUpperCase() == "TRUE" ? true : false;

  static String toStr(Object o) => isNullEmpty(o) ? "" : o.toString();

  static double toDouble(String strDouble,
      {String thousandSeparator = ",",
      String rightSymbol = "",
      String leftSymbol = ""}) {
    double val = 0;

    strDouble = (strDouble == null || strDouble.isEmpty) ? '0' : strDouble;

    strDouble = strDouble
        .replaceAll(thousandSeparator, '')
        .replaceAll(rightSymbol, '')
        .replaceAll(leftSymbol, '');

    try {
      val = double.parse(strDouble);
    } catch (_) {
      val = 0;
    }
    return val;
  }

  static bool isDigit(String value) {
    ///Зөвхөн тоо агуулсан эсэхийг шалгана

    RegExp _isDegit = RegExp(
      r'\\d+',
    );

    try {
      String regex = "\\d+";

      if (value == null) {
        return false;
      }

      if (value.trim().length == 0) {
        return false;
      }

      if (!_isDegit.hasMatch(value)) {
        return false;
      }
    } catch (_) {
      //App.error(e);
      return false;
    }

    return true;
  }

  static bool isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  static String toMoneyStr(
    Object value, {
    bool secureMode, //Secure mode ашиглах эсэх
    NumberFormat numberFormat,
  }) {
    /// Format number with "Decimal Point" digit grouping.
    /// 10000 -> 10,000.00

    //Secure mode ашиглах бол дансны үлдэгдлийг нуух эсэх
//    if (app.isTest) return "***";

//    if ((secureMode ?? false) && app.user.secureMode) return "***";

    //Хоосон утгатай эсэх
    if (Func.toStr(value) == "") {
      return "0.00";
    }

    //Зөвхөн тоо агуулсан эсэх
    String tmpStr = Func.toStr(value).replaceAll(",", "").replaceAll(".", "");
    if (!isNumeric(tmpStr)) {
      return "0.00";
    }

    //Хэрэв ',' тэмдэгт агуулсан бол устгана
    double tmpDouble = double.parse(Func.toStr(value).replaceAll(",", ""));

    String result = "";
    try {
      //Format number
//      final formatter = new NumberFormat("#,###.##", "pt-br");
      NumberFormat formatter = numberFormat ?? NumberFormat("#,###.##");
      result = formatter.format(tmpDouble);
    } catch (e) {
      print("*******  Алдаа  ***********");
      print("Функц: Func.toMoneyStr()");
      print("Утга: " + tmpDouble.toString());
      print(e);
      result = "0.00";
    }

    return result;
  }

  static String toIntegerMoneyStr(
    Object value, {
    bool secureMode, //Secure mode ашиглах эсэх
    NumberFormat numberFormat,
  }) {
    /// Format number with "Decimal Point" digit grouping.
    /// 10000 -> 10,000

    //Secure mode ашиглах бол дансны үлдэгдлийг нуух эсэх
//    if (app.isTest) return "***";

//    if ((secureMode ?? false) && app.user.secureMode) return "***";

    //Хоосон утгатай эсэх
    if (Func.toStr(value) == "") {
      return "0";
    }

    //Зөвхөн тоо агуулсан эсэх
    String tmpStr = Func.toStr(value).replaceAll(",", "").replaceAll(".", "");
    if (!isNumeric(tmpStr)) {
      return "0";
    }

    //Хэрэв ',' тэмдэгт агуулсан бол устгана
    double tmpDouble = double.parse(Func.toStr(value).replaceAll(",", ""));

    String result = "";
    try {
      //Format number
//      final formatter = new NumberFormat("#,###.##", "pt-br");
      NumberFormat formatter = numberFormat ?? NumberFormat("#,###,###");
      result = formatter.format(tmpDouble);
    } catch (e) {
      print("*******  Алдаа  ***********");
      print("Функц: Func.toIntegerMoneyStr()");
      print("Утга: " + tmpDouble.toString());
      print(e);
      result = "0";
    }

    return result;
  }

  static String fractionStr(double number) {
    // Тооны бутархай хэсгийг салгаад, 2 орноор тасалж буцаана
    // Input: 123.456
    // Output: '45'

    String result;
    if (number == null) return "";
    if (number.toInt() == number) return "00";

    result = number.toString().split('.')[1];
    if (result.length == 1) {
      result += "0";
    } else {
      result = result.substring(0, 2);
    }

    return result;
  }

  static String toCurSymbol(String curCode) {
    String currencySymbol;

    switch (Func.toStr(curCode)) {
      case "MNT":
        currencySymbol = "₮";
        break;

      case "EUR":
        currencySymbol = "€";
        break;

      case "USD":
        currencySymbol = "\$";
        break;

      case "ACO":
        currencySymbol = "ACO";
        break;

      default:
        currencySymbol = "";
        break;
    }

    return currencySymbol;
  }


  static String trim(String str) {
    /// Бүх whitespace-ийг устгана
    if (isNullEmpty(str)) return "";

    return str.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
  }

  static bool checkVatRegNo(String regno) {
    String patttern = r'(^\d{7}|\d{12}|[А-ЯЁӨҮ]{2}\d{8})\$)';
    RegExp regExp = new RegExp(patttern);
    return regExp.hasMatch(regno);
  }

  static bool checkMobileNumber(String mobile) {
    String patttern = r'(^\d{8}$)';
    RegExp regExp = new RegExp(patttern);
    return regExp.hasMatch(mobile);
  }

  static List<double> calcVatAmount(
      int vatType, double actualPrice, double decVatPercent, double vatAmt) {
    double totalAmnt;
    double vatTax = 0;
    List<double> amounts = new List<double>();

    switch (vatType) {
      case 1: //Нийт дүнд багтсан НӨАТ-н дүнг салгаж тооцох
        vatTax = (actualPrice * decVatPercent) / (1 + decVatPercent);
        totalAmnt = actualPrice;
        break;
      case 2: //Нийт дүнд НӨАТ -н дүнг нэмж тооцох
        vatTax = actualPrice * decVatPercent;
        totalAmnt = actualPrice + vatTax;
        break;
      case 3: //НӨАТ-н дүнг ТХА-с авах
        vatTax = vatAmt;
        totalAmnt = actualPrice;
        break;
      case 4: //НӨАТ-с чөлөөлөгдөх
        vatTax = 0;
        totalAmnt = actualPrice;
        break;
      case 5: //НӨАТ 0%-р тооцох
        vatTax = 0;
        totalAmnt = actualPrice;
        break;
      default:
        totalAmnt = actualPrice;
        break;
    }

    amounts.add(totalAmnt);
    amounts.add(vatTax);

    return amounts;
  }

  static String getDateStr(String str) {
    /// Datetime string-ээс date string-ийг буцаана '2019.01.01 15:13:00' to '2019.01.01'
    if (isNullEmpty(str)) return "";
    if (!str.contains(" ")) return str;

    return trim(str.split(" ")[0]);
  }

  static String getTimeStr(String str) {
    /// Datetime string-ээс time string-ийг буцаана '2019.01.01 15:13:00' to '15:13:00'
    if (isNullEmpty(str)) return "";
    if (!str.contains(" ")) return str;

    return str.split(" ")[1];
  }



  static Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }
}
