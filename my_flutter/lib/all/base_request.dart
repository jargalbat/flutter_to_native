import 'dart:io' show Platform;

const String SRC_INST_ID = '11';

abstract class BaseRequest {
  //@Ignore
  String _tt;

  //@Ignore
  String _pv = "03";

  //@Ignore
  String _rs = "00";

  //@FieldDef(required = true)
  String _lang = "0";

  //@FieldDef(required = true)
  String _channel = "71";

  //@FieldDef(required = true)
  String _srcInstId = SRC_INST_ID;

  //#region [ get , set ]
  String get Tt {
    return _tt;
  }

  set Tt(String tt) {
    this._tt = tt;
  }

  String get Pv {
    return _pv;
  }

  set Pv(String pv) {
    this._pv = pv;
  }

  String get Rs {
    return _rs;
  }

  set Rs(String rs) {
    this._rs = rs;
  }

  String get Lang {
    return _lang;
  }

  set Lang(String lang) {
    this._lang = lang;
  }

  String get Channel {
    _channel = "71";
    if (Platform.isIOS) {
      _channel = "72";
    }
    return _channel;
  }

//  set Channel(String channel) {
//    this._channel = channel;
//  }

  String get SrcInstId {
    return _srcInstId;
  }

  set SrcInstId(String srcInstId) {
    this._srcInstId = srcInstId;
  }

  String _SD;

  String get SD {
    return _SD;
  }

  set SD(String sd) {
    this._SD = sd;
  }

  String _EK;

  String get EK {
    return _EK;
  }

  set EK(String EK) {
    this._EK = EK;
  }

  String _SG;

  String get SG {
    return _SG;
  }

  set SG(String SG) {
    this._SG = SG;
  }

  Map<String, dynamic> toJson();

  void base(Map<String, dynamic> data) {
    data['Tt'] = this.Tt;
    data['Pv'] = this.Pv;
    data['Rs'] = this.Rs;
    data['Lang'] = this.Lang;
    data['Channel'] = this.Channel;
    data['SrcInstId'] = this.SrcInstId;
  }
}

// import 'package:ard/common/annotations/annotations.dart';
// // import 'package:extra';
// // import 'dart:extra';
// // import 'dart:extra';
// // import 'dart:mirrors';
// // import 'dart:mirrors'; //mirrors dos't support for flutter sdk :(

// class BaseRequest {
//   @todo("asdf","adsf")
//   final String productId;

//   @todo2(true, false)
//   final String productName;
//   final String shortDescription;
//   final String longDescription;
//   final String price;
//   final String productImage;
//   final double reviewRating;
//   final int reviewCount;
//   final bool inStock;

//   const BaseRequest({
//     this.productId,
//     this.productName,
//     this.shortDescription,
//     this.longDescription,
//     this.price,
//     this.productImage,
//     this.reviewRating,
//     this.reviewCount,
//     this.inStock
//   });

//   BaseRequest.fromMap(Map<String, dynamic>  map) :
//     productId = map['productId'],
//     productName = map['productName'],
//     shortDescription = map['shortDescription'],
//     longDescription = map['longDescription'],
//     price = map['price'],
//     productImage = map['productImage'],
//     reviewRating = map['reviewRating'],
//     reviewCount = map['reviewCount'],
//     inStock = map['inStock'];

//   void fooMethod() {

//     // this.productId.me.who ="d";
//     // InstanceMirror im = reflect(new todo());
//     // ClassMirror classMirror = im.type;

//     // // ClassMirror
//     // classMirror.metadata.forEach((metadata) {
//     //   print(metadata.reflectee.who); // -> akira
//     //   print(metadata.reflectee.what); // -> add something
//     // });

//     // // VariableMirror
//     // for (VariableMirror variable in classMirror.variables.values) {
//     //   print(variable.metadata.first.reflectee.who); // -> naoto
//     //   print(variable.metadata.first.reflectee.what); // -> do something
//     // }

//     // // MethodMirror
//     // classMirror.methods.values.forEach((MethodMirror method) {
//     //   print(method.metadata.first.reflectee.who); // -> kitano
//     //   print(method.metadata.first.reflectee.what); // -> change the name
//     // });
//   }

//     // final String tt;

//     // final String pv = "03";

//     // final String rs = "00";

//     // //@FieldDef(true, true,"")
//     // String lang = "0";

//     // //@FieldDef(required = true)
//     // final String channel = "71";

//     // //@FieldDef(required = true)
//     // final String srcInstId = "11";

// }
