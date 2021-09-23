import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';

import 'Constants.dart';

class Utils {
  void showToast(String message, bool isError) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: isError ? Colors.red[900] : Colors.grey[700],
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<bool> internetConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  String formatDate(String date, String formatType) {
    final deliveryDate = date;
    var deliveryAt = DateTime.parse(deliveryDate);
    return DateFormat(formatType).format(deliveryAt);
  }

  Widget builtItemImageContainer(String? imageName) {
    String imageUrl = "";

    if (imageName != null && imageName.length > 0) {
      imageUrl = "$imageName";
    }

    bool _validURL = Uri.parse(imageUrl).isAbsolute;

    try {
      return Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: (_validURL && imageUrl.length > 0)
                ? CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(0),
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                  padding: EdgeInsets.all(0),
                  child: Center(child: CupertinoActivityIndicator())),
              errorWidget: (context, url, error) => Container(
                  height: 25,
                  width: 25,
                  margin: EdgeInsets.all(0),
                  child:
                  Image.asset("assets/images/login_logo.png")),
            )
                : Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
                border: Border(
                  top:
                  BorderSide(width: 1.0, color: AppColors.whiteColor),
                  left:
                  BorderSide(width: 1.0, color: AppColors.whiteColor),
                  right:
                  BorderSide(width: 1.0, color: AppColors.whiteColor),
                  bottom:
                  BorderSide(width: 1.0, color: AppColors.whiteColor),
                ),
                image: DecorationImage(
                    image:
                    AssetImage("assets/images/login_logo.png"),
                    fit: BoxFit.contain),
              ),
            ),
          ));
    } catch (error) {
      print("error : $error");
      return Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
          border: Border(
            top: BorderSide(width: 1.0, color: AppColors.whiteColor),
            left: BorderSide(width: 1.0, color: AppColors.whiteColor),
            right: BorderSide(width: 1.0, color: AppColors.whiteColor),
            bottom: BorderSide(width: 1.0, color: AppColors.whiteColor),
          ),
          image: DecorationImage(
              image: AssetImage("assets/images/login_logo.png"),
              fit: BoxFit.contain),
        ),
      );
    }
  }

  Widget builtHomeItemImageContainer(String imageName) {

    String imageUrl = "";

    if (imageName != null && imageName.length > 0) {
      imageUrl = "$imageName";
    }

    bool _validURL = Uri.parse(imageUrl).isAbsolute;

    try {
      return Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: (_validURL && imageUrl.length > 0)
                ? CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(0),
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                  padding: EdgeInsets.all(0),
                  child: Center(child: CupertinoActivityIndicator())),
              errorWidget: (context, url, error) => Container(
                  height: 25,
                  width: 25,
                  margin: EdgeInsets.all(0),
                  child:
                  Image.asset("assets/images/login_logo.png")),
            )
                : Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
                border: Border(
                  top:
                  BorderSide(width: 1.0, color: AppColors.whiteColor),
                  left:
                  BorderSide(width: 1.0, color: AppColors.whiteColor),
                  right:
                  BorderSide(width: 1.0, color: AppColors.whiteColor),
                  bottom:
                  BorderSide(width: 1.0, color: AppColors.whiteColor),
                ),
                image: DecorationImage(
                    image:
                    AssetImage("assets/images/login_logo.png"),
                    fit: BoxFit.cover),
              ),
            ),
          ));
    } catch (error) {
      print("error : $error");
      return Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
          border: Border(
            top: BorderSide(width: 1.0, color: AppColors.whiteColor),
            left: BorderSide(width: 1.0, color: AppColors.whiteColor),
            right: BorderSide(width: 1.0, color: AppColors.whiteColor),
            bottom: BorderSide(width: 1.0, color: AppColors.whiteColor),
          ),
          image: DecorationImage(
              image: AssetImage("assets/images/login_logo.png"),
              fit: BoxFit.cover),
        ),
      );
    }
  }

  Widget emptyScreenPlaceholder(bool _loading, String title) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: _loading
            ? Container()
            : Text(
          _loading ? "" : "$title",
          style: TextStyle(
              fontFamily: AppFonts.nunitoSans,
              fontSize: 25.0,
              color: AppColors.yellowColor,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  String getValue(String value) {
    if (value != null && !value.contains("null")) {
      return value;
    }

    return "";
  }

  // launchSliderURL(String urlString) async {
  //   String url = urlString;
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

}