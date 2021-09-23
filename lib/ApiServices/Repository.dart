import 'OperatorAuthServices.dart';
import 'ResponseObject.dart';

class Repository {
  final OperatorAuthServices _operatorAuthServices = OperatorAuthServices();

  Future<ResponseObject> offerRequest() => _operatorAuthServices.offerRequest();


}

final repository = Repository();