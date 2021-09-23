import 'Offers.dart';

class OfferResponseModel {
  List<Offers>? offers;

  OfferResponseModel({this.offers});

  OfferResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['offers'] != null) {
      offers = [];
      json['offers'].forEach((v) {
        offers!.add(new Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.offers != null) {
      data['offers'] = this.offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
