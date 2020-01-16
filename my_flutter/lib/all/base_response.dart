class BaseResponse {
  String responseBody; //Хүсэлтийн хариу
  String responseCode; //Гүйлгээний хариу код
  String responseDesc; //Гүйлгээний хариу текст
  String traceNo; //Гүйлгээний трэйс дугаар
//    public String responseData; //Смарт мэдэгдлийн жагсаалт
//    public String responseParam;

  BaseResponse([this.responseCode, this.responseDesc, this.responseBody]);

  BaseResponse.fromJson(Map<String, dynamic> json)
      : responseBody = json["responseBody"],
        responseCode = json["responseCode"],
        responseDesc = json["responseDesc"],
        traceNo = json["traceNo"];

  Map<String, dynamic> toJson() {
    /// Secure fields
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseBody'] = this.responseBody;
    data['responseCode'] = this.responseCode;
    data['responseDesc'] = this.responseDesc;
    data['traceNo'] = this.traceNo;

    return data;
  }

  static Map<String, dynamic> json([
    String responseCode, String responseDesc, String responseBody]) {
    return BaseResponse(responseCode, responseDesc, responseBody).toJson();
  }

  @override
  String toString() {
    return '''BaseResponse {
      responseBody: $responseBody,
      responseCode: $responseCode,
      responseDesc: $responseDesc,      
      traceNo: $traceNo 
    }''';
  }
//BaseResponse.withError();
}
