import 'package:json_annotation/json_annotation.dart';
part 'Offer.g.dart';

@JsonSerializable()
class Offer{
  dynamic id;
  dynamic quantity;
  dynamic restaurant_id;
  dynamic valid_form;
  dynamic valid_to;
  dynamic discount_type;
  dynamic offer_type;
  dynamic min_amount;
  dynamic active;
  dynamic note;

  Offer(this.id, this.quantity, this.restaurant_id, this.valid_form, this.valid_to, this.discount_type, this.offer_type, this.min_amount, this.active, this.note);

  factory Offer.fromJson(Map<String, dynamic>json)=>_$OfferFromJson(json);
}