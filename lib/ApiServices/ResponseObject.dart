
import 'package:flutter_bloc_practice/Utilities/Constants.dart';

class ResponseObject {
  int id;
  Object? object;

  ResponseObject({this.id: ResponseCode.NO_INTERNET_CONNECTION, this.object});
}