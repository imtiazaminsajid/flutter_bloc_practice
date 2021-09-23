import 'package:dio/dio.dart';
import 'package:flutter_bloc_practice/Models/OfferResponseModel.dart';
import 'package:flutter_bloc_practice/Utilities/Constants.dart';
import 'package:flutter_bloc_practice/Utilities/Utils.dart';

import 'ResponseObject.dart';

class OperatorAuthServices {


  Future<ResponseObject> offerRequest() async {
    print("==================== Offer Api Call====================");

    Response response;
    Dio dio = new Dio();

    try {
      response = await dio.post(APIConstants.offers);

      print("Offer error => ${response.data["error"]}");
      print("Offer code => ${response.statusCode}");

      if (response.statusCode == 200) {
        final error = response.data["error"];

        if (error == 0) {
          print("Offer response.data => ${response.data}");
          OfferResponseModel offerResponseModel =
          OfferResponseModel.fromJson(response.data["data"]);
          return ResponseObject(
              id: ResponseCode.SUCCESSFUL, object: offerResponseModel);
        } else {
          Utils().showToast(response.data["errorMsg"], true);
        }
      } else {
        Utils().showToast("Offer Failed!", true);
      }
    } catch (error) {
      print("Offer response code " +
          " : " +
          "${error.toString()}");
    }

    return ResponseObject(id: ResponseCode.FAILED, object: 'Offer Failed!');
  }

}