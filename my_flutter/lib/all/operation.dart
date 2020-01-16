
import 'package:my_flutter/all/logger.dart';

class Operation {
  static final logger = Logger('Const');

  static const String linkInstList =
      "0155"; //Түрүүвчинд хамаарах СБ-н жагсаалт авах
  static const String bankBranchList =
      "0175"; //СБ-д хамаарах АТМ/Салбар жагсаалт авах
  static const String txnCodePrefix = "6000";
  static const String login = "1000"; //Хэрэглэгч системд нэвтрэх
  static const String logout = "1001"; //Хэрэглэгч системээс гарах
  static const String changePin = "1004"; //Хэрэглэгч пин код солих
  static const String bindFingerPrintLogin =
      "1009"; //Хэрэглэгч хурууний хээгээр нэвтрэх төхөөрөмж холбох
  static const String getDictionaryVersions =
      "1218"; //Параметрын хувилбар татах,
  static const String getDictionary = "1219"; //Параметр татах
  static const String transferQpayP2P = "1600"; //QPay шилжүүлэг`
  static const String topupMobile = "1601"; //Нэгж авах
  static const String transferQpay = "1602"; //QPay төлбөр
  static const String transferSelfAccount =
      "1603"; //Мөнгөн шилжүүлэг – өөрийн данс хооронд
  static const String transferMobile =
      "1604"; //Мөнгөн шилжүүлэг – гар утасны дугаараар
  static const String payBill = "1606"; // 1606 - Нэхэмжлэхгүй билл төлбөр
  static const String payWithBill = "1607"; // 1607 - Нэхэмжлэхтэй билл төлбөр
  static const String transferFbAccount =
      "1611"; //Мөнгөн шилжүүлэг – дансны дугаараар
  static const String transferToBankAccount =
      "1615"; //Мөнгөн шилжүүлэг – FB хаягаар
  static const String topupPrepaid = "1619"; //Карт худалдан авах
  static const String getTan = "1633"; //Гүйлгээний ТАН авах
  static const String acntStatement =
      "1643"; //MM Хэрэглэгч дансны X хуулга авах
  static const String confirmByTanCode =
      "1676"; //Бүртгэл баталгаажуулах ТАН оруулах
  static const String getCustBillList =
      "1802"; // 1802 - Лавлагаа - Билл лавлах - төлбөр төлөгчөөр
  static const String checkVatRegNo =
      "1969"; //НӨАТ төлөгчийн регистрийн дугаар онлайн шалгах
  static const String getBillerCustList =
      "2550"; // 2550 - Биллерийн хэрэглэгчийн холболт харах
  static const String addBillerCust =
      "2551"; // 2551 - Биллерийн хэрэглэгч холбох
  static const String editBillerCust =
      "2552"; // 2552 - Биллерийн хэрэглэгчийн холболт засварлах
  static const String checkBillerCust =
      "2555"; // 2555 - Биллерийн хэрэглэгчийн мэдээлэл баталгаажуулах
  static const String searchCustByAddress =
      "2556"; // 2556 - Биллерийн хэрэглэгчийн хаяг хайх
  static const String searchByAddress =
      "2558"; // 2558 - Биллeрийн хэрэглэгч хаягаар хайх
  static const String getFavoriteBillList =
      "2576"; // 2576 - Билл төлөгчийн favorite төлбөр - жагсаалт
  static const String addFavoriteBill =
      "2577"; // 2577 - Билл төлөгчийн favorite төлбөр - нэмэх
  static const String removeFavoriteBill =
      "2578"; // 2578 - Билл төлөгчийн favorite төлбөр - хасах
  static const String checkKeyField =
      "2579"; // 2579 - Биллерийн хэрэглэгчийн түлхүүр талбар шалгах
  static const String linkAccount = "3010"; //ММ үйлчилгээнд данс холбох
  static const String removeAccount = "3011"; //ММ үйлчилгээнээс данс хасах
  static const String loanSchedule = "3012"; //Зээлийн дансны хуваарь авах
  static const String creditBalDetail = "3016"; //Зээлийн дансны хуваарь авах
  static const String decodeQPay = "3020"; //QR код задлах
  static const String checkFieldQPay = "3031"; //QR нэмэлт талбар шалгах
  static const String createQr = "3041"; //QR код үүсгэх
  static const String signupStepStart =
      "5001"; //Хэрэглэгчийн гар утасны дугаар солих
  static const String signupStepEnd =
      "5002"; //Хэрэглэгчийн гар утасны дугаар солих
  static const String signupStepComp =
      "5003"; //Хэрэглэгчийн гар утасны дугаар солих
  static const String signupChkMobile =
      "5004"; //Хэрэглэгчийн гар утасны дугаар солих
  static const String signupRegMobile =
      "5005"; //Хэрэглэгчийн гар утасны дугаар солих
  static const String signupVerfMobile =
      "5006"; //Хэрэглэгчийн гар утасны дугаар солих
  static const String inviteFriend = "5009"; //Найзаа урих
  static const String getProfile =
      "5014"; //Хэрэглэгчийн дэлгэрэнгүй мэдээлэл авах
  static const String editProfile = "5018"; //Хэрэглэгчийн мэдээлэл засварлах
  static const String signupChkReg =
      "5019"; //ММ Хэрэглэгчийг регистрийн дугаараар шалгах
  static const String changeDefaultAcnt =
      "5024"; // MM Хэрэглэгчийн дефолт данс өөрчлөх
  static const String changeAcntNickname = "5027"; // Дансны ММ нэр өөрчлөх
  static const String bindFacebookId =
      "5030"; // Хэрэглэгч Facebook Account холбох/салгах
  static const String getProfileMore =
      "5031"; //Хэрэглэгчийн нэмэлт тохиргоо авах
  static const String changeEmail = "5083"; //Хэрэглэгчийн имэйл хаяг солих
  static const String changeMobile =
      "5084"; //Хэрэглэгчийн гар утасны дугаар солих
  static const String forgotPassword =
      "5075"; //Хэрэглэгч пин код мартсан хүсэлт илгээх
  static const String templateList = "5100"; //Бүх гүйлгээний загварын жагсаалт
  static const String templateDetail = "5101"; //Гүйлгээний загвар лавлах
  static const String templateAdd = "5102"; //Гүйлгээний загвар бүртгэх
  static const String templateEdit = "5103"; //Гүйлгээний загвар засварлах
  static const String templateDelete = "5104"; //Гүйлгээний загвар устгах
  static const String smartNotifRead =
      "5111"; //Смарт мэдэгдэл уншсан төлөвт оруулах
  static const String smartNotifList = "5112"; //Смарт мэдэгдлийн жагсаалт авах
  static const String deviceRemove =
      "5113"; //Хэрэглэгчийн тогтмол хандах төхөөрөмж устгах
  static const String deviceList =
      "5115"; //Хэрэглэгчийн тогтмол хандах төхөөрөмжийн лавлагаа авах
  static const String accountList = "7000"; //Дансны жагсаалт
  static const String getQrCoin = "7002"; //QR урамшууллын койн уншуулах
  static const String getWithdraw = "7003"; //Койн гаргаж авах
  static const String applicationList = "7100"; //Хүсэлтийн жагсаалт
  static const String applicationDetail = "7101"; //Хүсэлтийн дэлгэрэнгүй
  static const String createApplication = "7102"; //Хүсэлт бүртгэх
  static const String cancelApplication = "7103"; //Хүсэлт цуцлах
  static const String prodList = "7105"; //Бүтээгдэхүүний жагсаалт
  static const String prodCurList = "7106"; //Бүтээгдэхүүний валютын жагсаалт
  static const String applicationListWithID = "7107"; //Хүсэлтийн жагсаалт (ID)
  static const String getTermCond = "7108"; //Гэрээний дэлгэрэнгүй
  static const String getVerificationInfo =
      "7109"; //Харилцагчийн баталгаажуулалтын мэдээлэл авах
  static const String getLoan = "7010"; //Зээл авах
  static const String extendLoan = "7011"; //Зээл сунгах
  static const String getExtendLoanContract = "7012"; //Зээл сунгах нөхцөл авах
  static const String getCredit = "7020"; //Зээл авах
  static const String createSaving = "7030"; //Хадгаламж нээх
  static const String setOverdraft = "7031"; //Улайх эрх олгох
  static const String calcIntRate = "7033"; //Хадгаламжийн хүү тооцоолох
  static const String ipoDetail = "7040"; //IPO захиалгын жагсаалт авах
  static const String ipoOrder = "7041"; //IPO захиалга бүртгэх
  static const String ipoList = "7046"; //IPO жагсаалт авах
  static const String ipoBroker = "7060"; //Broker Intro
  static const String ipoAccountEdit = "7062"; //ҮЦТХТ данс засах
  static const String ipoAccountReg = "7065"; //ҮЦК-аас данс бүртгэх
  static const String investmentAcntStmt =
      "7066"; //Үнэт цаасны дансны хуулга авах
  static const String stockMarketInfo =
      "7070"; //ҮЦ-ны зах зээлийн мэдээ (ханш) авах
  static const String stockCreateOrder = "7072"; //ҮЦ-ны захиалга бүртгэх
  static const String stockGetOrder = "7073"; //ҮЦ-ны захиалга лавлах
  static const String stockCancelOrder = "7074"; //ҮЦ-ны захиалга цуцлах
  static const String stockList = "7075"; //ҮЦ-ны жагсаалт
  static const String stockCreateFeatured = "7076"; //Онцлох хувьцаа бүртгэх
  static const String stockRemoveFeatured = "7077"; //Онцлох хувьцаа хасах
  static const String stockGetTopTen = "7078"; //Топ 10 захиалгын жагсаалт
  static const String stockStatement = "7079"; //ҮЦ-ны дансны хуулга
  static const String stockDetail = "7080"; //Хувьцааны дэлгэрэнгүй
  static const String stockEscrowAccountBalance =
      "7081"; //Эскроу дансны боломжит үлдэгдэл
  static const String getMarketToken = "7902"; //ММаркетаас токен авах
  static const String cryptoList = "7903"; //Крипто дансны жагсаалт авах
  static const String cryptoRate = "7904"; //Крипто ханшийн жагсаалт авах
  static const String investmentList =
      "7047"; //Хөрөнгө оруулалтын дансны жагсаалт авах
  static const String cinemaToken = "7906"; //
  static const String checkTanCodeDevice =
      "5088"; // 5088 - Тогтмол ашиглах төхөөрөмж баталгаажуулах ТАН оруулах

  static String getLongTranCode(String txnCode) {
    logger.func = "getLongTranCode";
    String tranCode = "";
    try {
      switch (txnCode) {
        case topupPrepaid:
          tranCode = "60001619";
          break;
        case "Картын дугаар луу шилжүүлэг":
          tranCode = "60001700";
          break;
        case "Татвар төлбөр":
          tranCode = "60001623";
          break;
        case "Хялбар төлөлт":
          tranCode = "60001624";
          break;
        case "Гаалийн төлбөр":
          tranCode = "60001625";
          break;
        case transferQpay:
          tranCode = "60001602";
          break;
        case transferQpayP2P:
          tranCode = "60001600";
          break;
        case transferToBankAccount:
          tranCode = "60001615";
          break;
        case transferSelfAccount:
          tranCode = "60001603";
          break;
        case transferFbAccount:
          tranCode = "60001611";
          break;
        case "FB чатаар шилжүүлэг":
          tranCode = "60001614";
          break;
        case transferMobile:
          tranCode = "60001604";
          break;
        case topupMobile:
          tranCode = "60003004";
          break;
        case payBill:
          tranCode = "60001606";
          break;
        case payWithBill:
          tranCode = "60001607";
          break;
        case "Зээл авах":
          tranCode = "60001617";
          break;
        case "Байгууллагын шилжүүлэг":
          tranCode = "60001618";
          break;
        case "Хадгаламж нээх":
          tranCode = "60001616";
          break;
      }
    } on Exception catch (e) {
      logger.log(e: e);
    }
    return tranCode;
  }

  static String getShortTranCode(String tranCode) {
    logger.func = "getShortTranCode";
    String txnCode = "";
    try {
      switch (tranCode) {
        case "60001615":
          txnCode = transferToBankAccount;
          break;
        case "60001603":
          txnCode = transferSelfAccount;
          break;
        case "60001604":
          txnCode = transferMobile;
          break;
        case "60001611":
          txnCode = transferFbAccount;
          break;
        case "60003004":
          txnCode = topupMobile;
          break;
        case "60001607":
          txnCode = "";
          break;
        case "60001619":
          txnCode = topupPrepaid;
          break;
      }
    } on Exception catch (e) {
      logger.log(e: e);
    }
    return txnCode;
  }

  static String getPayeeCode(String txnCode) {
    logger.func = "getPayeeCode";
    String payeeCode = "";
    try {
      switch (txnCode) {
        case topupMobile:
          payeeCode = "60003004";
          break;
        case "Биллерийн дугаар":
          payeeCode = "60001607";
          break;
        case topupPrepaid:
          payeeCode = "60001619";
          break;
      }
    } on Exception catch (e) {
      logger.log(e: e);
    }
    return payeeCode;
  }

  static String getCustExtId(String txnCode) {
    logger.func = "getCustExtId";
    String custExtId = "";
    try {
      switch (txnCode) {
        case "Биллерийн хэрэглэгчийн гадаад дугаар":
          custExtId = "60001607";
          break;
        case topupPrepaid:
          custExtId = "60001619";
          break;
      }
    } on Exception catch (e) {
      logger.log(e: e);
    }
    return custExtId;
  }

  static String getCardType(String txnCode) {
    logger.func = "getCardType";
    String cardType = "";
    try {
      switch (txnCode) {
        case topupMobile:
          cardType = "60003004";
          break;
        case "Хүлээн авах дансны бүртгэлийн дугаар":
          cardType = "60001603";
          break;
        case topupPrepaid:
          cardType = "60001619";
          break;
      }
    } on Exception catch (e) {
      logger.log(e: e);
    }
    return cardType;
  }

  static String getCardServiceId(String txnCode) {
    logger.func = "getCardServiceId";
    String cardServiceId = "";
    try {
      switch (txnCode) {
        case "Биллерийн хэрэглэгчийн гадаад дугаар":
          cardServiceId = "60003004";
          break;
        case "хүлээн авах дансны бүртгэлийн дугаар":
          cardServiceId = "60001603";
          break;
        case topupPrepaid:
          cardServiceId = "60001619";
          break;
      }
    } on Exception catch (e) {
      logger.log(e: e);
    }
    return cardServiceId;
  }

  static String getCardId(String txnCode) {
    logger.func = "getCardId";
    String cardId = "";
    try {
      switch (txnCode) {
        case "Цэнэглэгч картын дугаар":
          cardId = "60003004";
          break;
        case "Бүтээгдэхүүний код":
          cardId = "60001619";
          break;
      }
    } on Exception catch (e) {
      logger.log(e: e);
    }
    return cardId;
  }

  static String getDstInstId(String txnCode) {
    logger.func = "getDstInstId";
    String dstInstId = "";
    try {
      switch (txnCode) {
        case transferToBankAccount:
          dstInstId = "60001615";
          break;
      }
    } on Exception catch (e) {
      logger.log(e: e);
    }
    return dstInstId;
  }

  static String getDstAcntName(String txnCode) {
    logger.func = "getDstAcntName";
    String dstAcntName = "";
    try {
      switch (txnCode) {
        case transferToBankAccount:
          dstAcntName = "60001615";
          break;
      }
    } on Exception catch (e) {
      logger.log(e: e);
    }
    return dstAcntName;
  }

  static String getDstAcntCur(String txnCode) {
    logger.func = "getDstAcntCur";
    String dstAcntCur = "";
    try {
      switch (txnCode) {
        case transferToBankAccount:
          dstAcntCur = "60001615";
          break;
      }
    } on Exception catch (e) {
      logger.log(e: e);
    }
    return dstAcntCur;
  }

  static String getVatRegNo(String txnCode) {
    logger.func = "getVatRegNo";
    String vatRegNo = "";
    try {
      switch (txnCode) {
        case topupMobile:
          vatRegNo = "60003004";
          break;
        case "Нэхэмжлэхтэй билл төлбөр":
          vatRegNo = "60001607";
          break;
        case "Карт худалдан авах":
          vatRegNo = "60001619";
          break;
      }
    } on Exception catch (e) {
      logger.log(e: e);
    }
    return vatRegNo;
  }
}
