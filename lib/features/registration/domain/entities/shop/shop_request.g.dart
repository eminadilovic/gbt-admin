// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopRequestImpl _$$ShopRequestImplFromJson(Map<String, dynamic> json) =>
    _$ShopRequestImpl(
      userId: json['user_id'] as String,
      barberShopName: json['barber_shop_name'] as String,
      ownerName: json['owner_name'] as String,
      countryCode: json['country_code'] as String,
      townName: json['town_name'] as String,
      profileImage: json['profile_image'] as String,
      subscriptions: (json['subscription'] as List<dynamic>)
          .map((e) => Subscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      overviewImages: (json['overview_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      overviewDescription: json['overview_description'] as String?,
    );

Map<String, dynamic> _$$ShopRequestImplToJson(_$ShopRequestImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'barber_shop_name': instance.barberShopName,
      'owner_name': instance.ownerName,
      'country_code': instance.countryCode,
      'town_name': instance.townName,
      'profile_image': instance.profileImage,
      'subscription': instance.subscriptions,
      'overview_images': instance.overviewImages,
      'overview_description': instance.overviewDescription,
    };
