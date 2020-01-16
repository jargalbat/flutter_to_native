
import 'package:my_flutter/all/base_request.dart';
import 'package:my_flutter/all/crypto.dart';
import 'package:my_flutter/all/func.dart';
import 'package:my_flutter/all/operation.dart';

class LoginRequest extends BaseRequest {
  //@FieldDef(required = true, secured = true)
  String traceNo;

  //@FieldDef(required = true, secured = true)
  String loginName; //Утасны дугаар

  //@FieldDef(required = true, secured = true)
  String srcMsisdn; //Утасны дугаар

  //@FieldDef(required = true, secured = true)
  String pin;

  //@FieldDef(required = true, secured = true)
  String pinEnc;

  //@FieldDef(required = true)
  String wallet;

  //@FieldDef(required = true)
  int deviceAppVersion; //Хүсэлт илгээсэн төхөөрөмжийн App хувилбар

  //@FieldDef(required = true)
  String deviceId; //Хүсэлт илгээсэн төхөөрөмжийн дугаар

  //@FieldDef(required = true)
  String deviceIp; //Хүсэлт илгээсэн төхөөрөмжийн IP хаяг

  //@FieldDef(required = true)
  String deviceMac; //Хүсэлт илгээсэн төхөөрөмжийн MAC хаяг

  //@FieldDef(required = true)
  String deviceName; //Хүсэлт илгээсэн төхөөрөмжийн нэр

  //@FieldDef(required = true)
  String deviceOsVersion; //Хүсэлт илгээсэн төхөөрөмжийн OS хувилбар

  //@FieldDef(required = true)
  String sessionType; //Хэрэглэгчийн төрөл (Customer = 1)

  //@FieldDef(required = true)
  String
  pushNotifToken; //PUSH мэдэгдэл хүлээн авах төхөөрөмжийн токен (Нэг удаа аваад утсан дээр хадгалагдана)

  //@FieldDef(required = true)
  int fingerPrintFlag; //Хурууны хээгээр нэвтрэх төрөл
  // 0-ХХ-р нэвтрэх чеклгүй ПИН-р нэвтрэх
  // 1-ХХ-р нэвтрэх чеклээд ПИН-р нэвтрэх
  // 2-ХХ-р нэвтрэх чектэй ХХ-р нэвтрэх
  // 3-ХХ-р нэвтэрдэг хэрэглэгч ПИН-р нэвтэрсэн, эсвэл ПИН-р ТАН авах гэж нэвтэрсэн

// not api member
  bool rememberMe;
  String clearPin;

  LoginRequest update(
      {String ploginName,
        String pmobile,
        String ppin,
        //int pfingerPrintFlag,
        bool prememberMe}) {
    this.loginName = ploginName ?? this.loginName;
    this.srcMsisdn = pmobile ?? this.srcMsisdn;
    this.pin = ppin ?? this.pin;
    //this.fingerPrintFlag = pfingerPrintFlag ?? this.fingerPrintFlag;
    this.rememberMe = prememberMe ?? this.rememberMe;
    return this;
  }

  // LoginRequest(
  //     {String tt,
  //     this.loginName,
  //     this.srcMsisdn,
  //     this.pin,
  //     this.fingerPrintFlag,
  //     this.rememberMe}) {
  //   Tt = tt;
  // }

  // factory LoginRequest.submit(
  //     String ploginName, String pmobile, String ppin, int pfingerPrintFlag) {}

  LoginRequest(
      {String ploginName,
        String pmobile,
        String ppin,
        int pfingerPrintFlag,
        bool prememberMe}) {
    Tt = Operation.login;
    traceNo = Func.nextTrace();
    loginName = '88989800';
    srcMsisdn = '88989800';
    clearPin = '4587';
    //var tmpPin = Func.toStr(pmobile) + "_" + Func.toStr(ppin);
    pin = '5b45c1a5477a63d0ab6da929e5286312d16f694b';
    pinEnc = '2fff50ed637ce990c6e783dd4604e1b8407df07dbde9366328a2ddb8ddd19c32';
    wallet = "ARD_DIGITAL";
    deviceAppVersion = 42;
    deviceId = '881817f2f35b9d27';
    deviceIp = '1.1.1.1';
    deviceMac = '00:00:00:00:00';
    deviceName = 'SM-G955F';
    deviceOsVersion = '21';
    sessionType = '1';
    pushNotifToken = 'dpwsStGeUIM:APA91bFWG0vyYeLSkpfjflD7dR_mvpX2R1eZBzEsaoc4lU0O9rbXmTRCHS1GvxMFH73OX70vaeNCYFyiJTUB6ofu1QC8gTjXUJXncyp3bVL0IsicscmR';
    fingerPrintFlag = 0;

    rememberMe = prememberMe;

    Lang = "0";

//    loginRequest.loginName = '88989800';
//    //loginRequest.mobile = '88989800;
//    loginRequest.pin = '5b45c1a5477a63d0ab6da929e5286312d16f694b';
//    loginRequest.tt = "1000";
//    _pv = "03"
//    _rs = "00"
//    _lang = "0"
//    _channel = "71"
//    _srcInstId = "11"
//    _SD = null
//    _EK = null
//    _SG = null
//    traceNo = "2020011612253000"
//    loginName = "88989800"
//    srcMsisdn = "88989800"
//    pin = "5b45c1a5477a63d0ab6da929e5286312d16f694b"
//    pinEnc = "2fff50ed637ce990c6e783dd4604e1b8407df07dbde9366328a2ddb8ddd19c32"
//    wallet = "ARD_DIGITAL"
//    deviceAppVersion = 42
//    deviceId = "881817f2f35b9d27"
//    deviceIp = "1.1.1.1"
//    deviceMac = "00:00:00:00:00"
//    deviceName = "SM-G955F"
//    deviceOsVersion = "21"
//    sessionType = "1"
//    pushNotifToken = "dpwsStGeUIM:APA91bFWG0vyYeLSkpfjflD7dR_mvpX2R1eZBzEsaoc4lU0O9rbXmTRCHS1GvxMFH73OX70vaeNCYFyiJTUB6ofu1QC8gTjXUJXncyp3bVL0IsicscmR"
//    fingerPrintFlag = 0
//    rememberMe = true
//    clearPin = "4587"
  }

  @override
  Map<String, dynamic> toJson() {
    ///
    ///first make secure filed map
    ///
    final Map<String, dynamic> dataSecure = new Map<String, dynamic>();
    dataSecure['traceNo'] = this.traceNo;
    dataSecure['loginName'] = this.loginName;
    dataSecure['srcMsisdn'] = this.srcMsisdn;
    dataSecure['pin'] = this.pin;
    dataSecure['pinEnc'] = this.pinEnc;

    ///
    ///second encrypt secure fields and generate new final map
    ///
    final Map<String, dynamic> data = Crypto.encryptData(dataSecure);

    ///
    ///third add non seruce fileds
    ///
    data['wallet'] = this.wallet;
    data['deviceAppVersion'] = this.deviceAppVersion;
    data['deviceId'] = this.deviceId;
    data['deviceIp'] = this.deviceIp;
    data['deviceMac'] = this.deviceMac;
    data['deviceName'] = this.deviceName;
    data['deviceOsVersion'] = this.deviceOsVersion;
    data['sessionType'] = this.sessionType;
    data['pushNotifToken'] = this.pushNotifToken;
    data['fingerPrintFlag'] = this.fingerPrintFlag;

    ///
    /// base data
    ///
    base(data);

    return data;
  }

  @override
  String toString() {
    return '''LoginRequest {
      loginName: $loginName,
      mobile: $srcMsisdn,
      pin: $pin,
      clearPin: $clearPin,
      rememberMe: $rememberMe
      fingerPrintFlag: $fingerPrintFlag,
    }''';
  }
}
