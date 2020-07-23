// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offer _$OfferFromJson(Map<String, dynamic> json) {
  return Offer(
    json['id'],
    json['quantity'],
    json['restaurant_id'],
    json['valid_form'],
    json['valid_to'],
    json['discount_type'],
    json['offer_type'],
    json['min_amount'],
    json['active'],
    json['note'],
  );
}

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'restaurant_id': instance.restaurant_id,
      'valid_form': instance.valid_form,
      'valid_to': instance.valid_to,
      'discount_type': instance.discount_type,
      'offer_type': instance.offer_type,
      'min_amount': instance.min_amount,
      'active': instance.active,
      'note': instance.note,
    };
