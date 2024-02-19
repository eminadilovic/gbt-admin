import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../registration/domain/entities/subscription/subscription.dart';

part 'shop_data.freezed.dart';
part 'shop_data.g.dart';

@freezed
class ShopData with _$ShopData {
  factory ShopData({
    @JsonKey(name: 'shop_id') required String shopId,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'barber_shop_name') required String barberShopName,
    @JsonKey(name: 'owner_name') required String ownerName,
    @JsonKey(name: 'country_code') required String countryCode,
    @JsonKey(name: 'town_name') required String townName,
    @JsonKey(name: 'profile_image') required String profileImage,
    @JsonKey(name: 'subscription') List<Subscription>? subscriptions,
    @JsonKey(name: 'overview_images') List<String>? overviewImages,
    @JsonKey(name: 'overview_description') String? overviewDescription,
  }) = _ShopData;

  factory ShopData.fromJson(Map<String, dynamic> json) => _$ShopDataFromJson(json);

  factory ShopData.fromFirestore(DocumentSnapshot<Map<String, Object?>> document) {
    final data = document.data();
    data!['id'] = document.id;

    return ShopData.fromJson(data);
  }
}
