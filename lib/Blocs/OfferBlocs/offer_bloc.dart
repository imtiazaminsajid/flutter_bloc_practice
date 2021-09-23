import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/ApiServices/Repository.dart';
import 'package:flutter_bloc_practice/ApiServices/ResponseObject.dart';
import 'package:flutter_bloc_practice/Models/OfferResponseModel.dart';
import 'package:flutter_bloc_practice/Utilities/Constants.dart';
import 'package:flutter_bloc_practice/Utilities/Utils.dart';

import 'offer_event.dart';
import 'offer_states.dart';


class OfferBloc extends Bloc<OfferEvent, OfferStates> {
  Repository repository;
  OfferResponseModel? offerResponseModel = new OfferResponseModel();
  OfferBloc(OfferStates initialState, this.repository) : super(initialState);

  @override
  Stream<OfferStates> mapEventToState(OfferEvent event) async* {
    if (event is DoFetchEvent) {
      yield LoadingState();
      try {
        ResponseObject responseObject = await repository.offerRequest();
        switch (responseObject.id) {
          case ResponseCode.SUCCESSFUL:
            offerResponseModel = responseObject.object as OfferResponseModel?;
            yield FetchSuccess(offers: offerResponseModel!.offers);
            break;
          case ResponseCode.FAILED:
            Utils().showToast("Api called FAILED", true);
            break;
          case ResponseCode.AUTHORIZATION_FAILED:
            Utils().showToast("Api called AUTHORIZATION_FAILED", true);
            break;
        }

      } catch (e) {
        yield ErrorStates(message: e.toString());
      }
    }
  }
}
