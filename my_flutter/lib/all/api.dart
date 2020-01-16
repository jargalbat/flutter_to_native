import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:my_flutter/all/base_request.dart';
import 'package:my_flutter/all/base_response.dart';
import 'package:my_flutter/all/logger.dart';
import 'package:my_flutter/all/network.dart';
import 'package:my_flutter/all/operation.dart';

/// MOST prod, OTS2 test user: 55558888 (123456)
//String BASE_URL = "https://customer.mostmoney.mn:9079/api/DG/TT";
//String BASE_CSE_URL = "https://customer.mostmoney.mn:9089/api/DG/TT";
//String BASE_IMAGE_URL = "https://customer.mostmoney.mn:9089/upload";

/// Integration
//String BASE_URL = "http://172.16.116.99:8087/api/DG/TT";
//String BASE_CSE_URL = "http://172.16.116.99:8087/api/DG/TT";
//String BASE_IMAGE_URL = "http://172.16.116.99:8087/upload";

///development - USER: 99031723, PIN: 123456
//  String BASE_URL = "http://172.16.116.92:8087/api/DG/TT";
//  String BASE_CSE_URL = "http://172.16.116.92:8087/api/DG/TT";
//  String BASE_IMAGE_URL = "http://172.16.116.92:8087/upload";

/// CASPO - IBD development - 1040 - (99232323 - 123123), (99101010 - 123123)
//String BASE_URL = "http://172.16.116.92:8287/api/DG/TT";
//String BASE_CSE_URL = "http://172.16.116.92:8287/api/DG/TT";
//String BASE_IMAGE_URL = "http://172.16.116.92:8287/upload";

/// CASPO - NAMPAG
String BASE_URL = "http://172.16.116.99:8099/api/DG/TT";
String BASE_CSE_URL = "http://172.16.116.99:8099/api/DG/TT";
String BASE_IMAGE_URL = "http://172.16.116.99:8099/upload";

/// test user for app store review
const String TEST_USER_MOBILE = "55558888";
const String TEST_USER_DEVICE = "test_device";
const String TEST_USER_BASE_URL = "http://202.131.242.156:8187/api/DG/TT";

//    public static String BASE_URL = "http://202.131.242.165:9082/api/DG/TT"; //MOST test
//    public static String BASE_IMAGE_URL = "http://202.131.242.165:9082/upload";//MOST test

//    public static String BASE_URL = "http://202.131.242.156:8187/api/DG/TT"; //OTS public
//    public static String BASE_IMAGE_URL = "http://202.131.242.156:8187/upload"; //OTS public upload

//String BASE_URL = "http://202.131.242.165:9088/api/DG/TT"; //CASPO
//String BASE_CSE_URL = "http://202.131.242.165:9088/api/DG/TT"; //CASPO
//String BASE_IMAGE_URL = "http://202.131.242.165:9088/upload"; //CASPO

// Must be top-level function
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

Api api;

class Api {
  final logger = Logger('Api');

  Dio _client;
  Dio _client2;
  static final Api _instance = Api._internal();

  factory Api() => _instance;

  StreamSubscription _connectionChangeStream;
  bool isOffline = false;

  Api._internal() {
    ConnectionStatusSingleton connectionStatus =
        ConnectionStatusSingleton.getInstance();
    connectionStatus.initialize();
    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);

    init();
  }

  void init({bool refresh = false}) {
//    StringBuffer log = StringBuffer();
    if (null == _client || refresh) {
      logger.func = "_internal";

      logger.log(s: 1);

      BaseOptions options = BaseOptions();
      options.baseUrl = BASE_URL;
      options.receiveTimeout = 1000 * 120; //120second
      options.connectTimeout = 1000 * 60; //60second
      options.contentType =
          Headers.jsonContentType; //ContentType.parse("application/json");
      //options.contentType= ContentType.parse("application/x-www-form-urlencoded");
      options.headers = {
        "Connection": "Close",
        "Accept": "application/json",
        "Accept-Charset": "utf-8",
        "Content-Type": "application/json; charset=utf-8",
      };

      _client = Dio(options);

      _client.interceptors
        ..add(CookieManager(CookieJar()))
        ..add(LogInterceptor(requestBody: true, responseBody: true));
    } else {
      logger.log(s: 2);
    }

    if (null == _client2 || refresh) {
      logger.func = "_internal";
      logger.log(s: 1);

      BaseOptions options = BaseOptions();
      options.baseUrl = BASE_CSE_URL;
      options.receiveTimeout = 1000 * 120; //120second
      options.connectTimeout = 1000 * 60; //60second
      options.contentType =
          Headers.jsonContentType; //ContentType.parse("application/json");
      //options.contentType= ContentType.parse("application/x-www-form-urlencoded");
      options.headers = {
        "Connection": "Close",
        "Accept": "application/json",
        "Accept-Charset": "utf-8",
        "Content-Type": "application/json; charset=utf-8",
      };

      _client2 = Dio(options);

      _client2.interceptors..add(CookieManager(CookieJar()))
          //..add(LogInterceptor(requestBody: false, responseBody: false))
          ;
    } else {
      logger.log(s: 2);
    }
  }

  void connectionChanged(dynamic hasConnection) {
    isOffline = !hasConnection;
  }

  ///
  /// regular base url get
  ///
  Future<Map<String, dynamic>> get(String path,
      [Map<String, dynamic> params]) async {
    Response<Map<String, dynamic>> response;
    if (null != params) {
      response = await _client.get(path, queryParameters: params);
    } else {
      response = await _client.get(path);
    }
    return response.data;
  }

  ///
  /// regular base url post
  ///
  Future<Response> post([BaseRequest request]) async {
    Response response = Response();
    assert(request != null);
    BaseResponse baseResponse = BaseResponse();
    logger.func = "post";
    try {
      if (isOffline) {
        response.statusCode = 400;
        baseResponse =
            BaseResponse(ERR_911, getErrMsg(ERR_911), 'Check connection');
        response.data = baseResponse.toJson();
        return response;
      }

      Options options = Options(
          headers: {"PV": request.Pv, "TT": request.Tt, "RS": request.Rs});

      // logger.log(s: 2, m: request.toString(), m2: request.toJson());

      response = await _client.post(request.Tt,
          data: request.toJson(), options: options);

      // logger.log(s: 3, m: response);

      if (response.statusCode == 200) {
        logger.log(s: 4);

        baseResponse = BaseResponse.fromJson(response.data);
        if (request.Tt != Operation.logout) {
          switch (baseResponse.responseCode) {
            // Session timeout
            case "7002":
            // Давхар login хийсэн
            case "101":
            case "60007000":
//              app.appBloc?.add(LoggedOut());
              //logout
              break;
            default:
//              print(
//                "responseCode: ${baseResponse.responseCode}, responseDesc: ${baseResponse.responseDesc}",
//              );
              break;
          }
        }
      } else {
        logger.log(s: 5);
      }
    } on DioError catch (error) {
      if (error.response != null) {
        response = error.response;
        response.data = BaseResponse.json(
            ERR_901, getErrMsg(ERR_901, error.message), error.message);
      } else {
        response.data = BaseResponse.json(
            ERR_902, getErrMsg(ERR_902, error.message), error.message);
      }

      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        response.statusCode = NetworkResultCode.NETWORK_TIMEOUT;
        response.data = BaseResponse.json(
            ERR_910, getErrMsg(ERR_910, error.message), error.message);
      }

      logger.log(s: 10, m: "DioError Exception: $error");
    } catch (error, stacktrace) {
      logger.log(s: 11, m: "Exception occured: $error stackTrace: $stacktrace");

      response.data = BaseResponse.json(
          ERR_904, getErrMsg(ERR_904, error.message), error.message);
    }

    return response;
  }

  ///connection_error
  static const ERR_901 = "901";
  static const ERR_902 = "902";
  static const ERR_903 = "903";
  static const ERR_904 = "904";
  static const ERR_905 = "905";
  static const ERR_906 = "906";
  static const ERR_907 = "907";
  static const ERR_908 = "908";
  static const ERR_909 = "909";

  ///exec_timeout
  static const ERR_910 = "910";

  ///check_internet
  static const ERR_911 = "911";

  String getErrMsg(String errCode, [String detail]) {
    String msg = "Error $errCode";
    switch (errCode) {
      case ERR_901:
      case ERR_902:
      case ERR_903:
      case ERR_904:
      case ERR_905:
      case ERR_906:
      case ERR_907:
      case ERR_908:
      case ERR_909:
//        msg =
//        '$errCode. ${app.localization?.connection_error() ?? "Failed to perform action! Connection error"} '; //+(detail==null?'':'[$detail]');
        break;
      case ERR_910:
//        msg =
//        '$errCode. ${app.localization?.exec_timeout() ?? "Failed to perform action! Timeout"} '; //+ (detail==null?'':'[$detail]');
        break;
      case ERR_911:
//        msg =
//        '$errCode. ${app.localization?.check_internet() ?? "Please check internet connection!"} '; //+(detail==null?'':'[$detail]');
        break;
    }
    return msg;
  }

  ///
  /// for CSE post !!!!!!!!!!!!
  ///
  /// case Operation.signupStepStart:
  /// case Operation.signupStepEnd:
  /// case Operation.signupStepComp:
  /// case Operation.signupChkMobile:
  /// case Operation.signupRegMobile:
  /// case Operation.signupVerfMobile:
  /// case Operation.signupChkReg:
  ///
  Future<Response> post2([BaseRequest request]) async {
    Response response = Response();
    assert(request != null);

    logger.func = "post";
    try {
      if (isOffline) {
        response.statusCode = 400;
        response.data = BaseResponse("997", 'Check internet', '').toJson();
        return response;
      }

      Options options = Options(
          headers: {"PV": request.Pv, "TT": request.Tt, "RS": request.Rs});

      logger.log(s: 2, m: request.toString(), m2: request.toJson());

      response = await _client2.post(request.Tt,
          data: request.toJson(), options: options);

      logger.log(s: 3, m: response);

      if (response.statusCode == 200) {
        logger.log(s: 4);
      } else {
        logger.log(s: 5);
      }
    } on DioError catch (error) {
      if (error.response != null) {
        response = error.response;
        response.data = BaseResponse.json(
            ERR_901, getErrMsg(ERR_901, error.message), error.message);
      } else {
        response.data = BaseResponse.json(
            ERR_902, getErrMsg(ERR_902, error.message), error.message);
      }

      if (error.type == DioErrorType.CONNECT_TIMEOUT) {
        response.statusCode = NetworkResultCode.NETWORK_TIMEOUT;
        response.data = BaseResponse.json(
            ERR_910, getErrMsg(ERR_910, error.message), error.message);
      }

      logger.log(s: 10, m: "DioError Exception: $error");
    } catch (error, stacktrace) {
      logger.log(s: 11, m: "Exception occured: $error stackTrace: $stacktrace");

      response.data = BaseResponse.json(
          ERR_904, getErrMsg(ERR_904, error.message), error.message);
    }
    return response;
  }

  ///
  /// for image upload multipart post
  ///
  Future<String> postFormData(
      File file, int cameraOrientation, String subFolder) async {
    String result = "";
    try {
      if (file == null) return "";

      Dio dio = new Dio();
      FormData formData = new FormData.fromMap({
        "nes-dir": subFolder,
        "file": await MultipartFile.fromFile(file.path, filename: "image.jpg"),
        //new UploadFileInfo(file, "image.jpg"),
      });
      await dio
          .post(BASE_IMAGE_URL,
              data: formData,
              options:
                  Options(method: 'POST', responseType: ResponseType.plain))
          .then((response) {
        if (response.statusCode == 200) {
          result = response.data
              .toString()
              .replaceAll('\"', "")
              .replaceAll("\n", "");
        } else {
          result = "";
        }
      }).catchError((error) {
        print(error);
        result = getErrMsg(ERR_907, error);
      });

      return result;
    } catch (e) {
      print(e);
      result = getErrMsg(ERR_908, e);
      return "";
    }
  }
}

//todo -> check this out https://www.jianshu.com/p/95ddea60107d
class NetworkResultCode {
  ///Network Error
  static const NETWORK_ERROR = -1;

  ///network timeout
  static const NETWORK_TIMEOUT = -2;

  ///Network returns data formatted once
  static const NETWORK_JSON_EXCEPTION = -3;

  static const SUCCESS = 200;

//  static final EventBus eventBus = new EventBus();
//
//  static errorHandleFunction(code, message, noTip) {
//    if(noTip) {
//      return message;
//    }
//    eventBus.fire(new YYResultErrorEvent(code, message));
//    return message;
//  }
}
