import 'package:my_flutter/all/base_response.dart';
import 'package:my_flutter/all/func.dart';

class LoginResponse extends BaseResponse {
  //@SerializedName("accessDate")
  String accessDate;

  //@SerializedName("custId")
  String custId;

  //@SerializedName("custName")
  String custName;

  //@SerializedName("custType")
  String custType;

  //@SerializedName("deviceId")
  String deviceId;

  //@SerializedName("deviceIp")
  String deviceIp;

  //@SerializedName("deviceName")
  String deviceName;

  //@SerializedName("email")
  String email;

  //@SerializedName("isPrepiad")
  String isPrepiad;

  //@SerializedName("pinBlock")
  String pinBlock; //ПИН блоклогдсон эсэх
  // 0-Хэвийн
  // 1-Блоклогдсон
  // 2-Системээс үүсгэсэн ПИН. ПИН код оо солино уу.
  // 3-ПИН -н хүчинтэй хугацаа дууссан. ПИН код оо солино уу.
  // 4-Таны бүртгэлийн гар утасны дугаар давхардсан байна. Гар утасны дугаараа солино уу.

  //@SerializedName("passBlock")
  String passBlock;

  //@SerializedName("sessionToken")
  String sessionToken;

  //@SerializedName("fbAppId")
  String fbAppId;

  String picture;

  LoginResponse([String responseCode, String responseDesc, String responseBody])
      : super(responseCode, responseDesc, responseBody);

  LoginResponse.fromJson(Map<String, dynamic> json)
      : accessDate = json["accessDate"] ?? "",
        custId = json["custId"],
        custName = json["custName"],
        custType = json["custType"],
        deviceId = json["deviceId"],
        deviceIp = json["deviceIp"],
        deviceName = json["deviceName"],
        email = json["email"],
        isPrepiad = json["isPrepiad"],
        pinBlock = Func.toStr(json["pinBlock"]),
        passBlock = Func.toStr(json["passBlock"]),
        sessionToken = json["sessionToken"],
        fbAppId = json["fbAppId"],
        picture = json["picture"],
        error = "",
        super.fromJson(json);

  //custId = Name.fromJson(json["name"]),
  //location = Location.fromJson(json["location"]),
  //picture = Picture.fromJson(json["picture"]

  String error;

  LoginResponse.withError(String errorValue) : error = errorValue;

  @override
  String toString() {
    return super.toString();
  }
}
