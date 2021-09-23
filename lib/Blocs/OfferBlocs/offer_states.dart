import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_practice/Models/Offers.dart';

class OfferStates extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialState extends OfferStates {}

class LoadingState extends OfferStates {}

class FetchSuccess extends OfferStates {
  List<Offers>? offers;
  FetchSuccess({this.offers});
}

class ErrorStates extends OfferStates {
  String? message;
  ErrorStates({this.message});
}
