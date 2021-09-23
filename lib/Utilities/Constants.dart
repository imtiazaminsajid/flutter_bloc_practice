import 'dart:ui';

const String DATABASE_NAME = "ecom.sqlite";
const int DATABASE_VERSION = 1;
const bool DEBUG_MODE = false;
const int scrollCallOffset = 200;

class AppColors {

  static const Color gradient1 = const Color(0xffEE964B);
  static const Color gradient2 = const Color(0xffF95738);
  static const Color blueGradient1 = const Color(0xff2471BC);
  static const Color blueGradient2 = const Color(0xff00006B);
  static const Color blueGradient3 = const Color(0xff1D5C9A);
  static const Color appBackground = const Color(0xffE5E5E5);
  static const Color whiteColor = const Color(0xffFFFFFF);
  static const Color blackColor = const Color(0xff1B1B1B);
  static const Color yellowColor = const Color(0xffF4D35E);
  static const Color blueColor = const Color(0xff2471BC);
  static const Color color001122 = const Color(0xff001122);
  static const Color colorF7F7F7 = const Color(0xffF7F7F7);
  static const Color color00AADF = const Color(0xff00AADF);
  static const Color hintColor = const Color(0xff969696);
  static const Color coffeeColor = const Color(0xff6f4e37);
  static const Color colorEAF1F9 = const Color(0xffEAF1F9);
  static const Color borderColor = const Color(0xffEFEFEF);
  static const Color color020202 = const Color(0xff020202);
  static const Color dialogRedButton = const Color(0xffDD242C);
  static const Color color0EC583 = const Color(0xff0EC583);

}

class AppFonts {
  static const String nunitoSans = "NunitoSans";
}

class AppBool {
  static const bool isMembershipShow = true;
  static const bool isBidShow = true;
}

class AppInts {
  static int payLaterEnableValue = 0;
}

class APIResponseCode {
  static const int OK = 200;
  static const int CREATED = 201;
  static const int BAD_REQUEST = 400;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int UNAUTHORIZED_ERROR = 900;
}

class ResponseCode {
  static const int NO_INTERNET_CONNECTION = 0;
  static const int AUTHORIZATION_FAILED = 900;
  static const int SUCCESSFUL = 500;
  static const int FAILED = 501;
  static const int NOT_FOUND = 502;
}

class APIConstants {
  //Test Server
  // static const String API_BASE_URL = "http://api.aleshamart.anvs.xyz/api/v3/";

  //Staging Server
  //static const String API_BASE_URL =
  //"https://api.staging.aleshamart.com/api/v2/";

  //Live Server
  static const String API_BASE_URL = "https://api.aleshamart.com/api/v1/";


  static const String offers = API_BASE_URL + "offers";


}

class SharedPrefsKeys {
  static const String apiToken = "api_token";
}



class AppStrings {
  static const String district = "District";
  static const String thana = "Thana";
  static const String city = "City";
}
