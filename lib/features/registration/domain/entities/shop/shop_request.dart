import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../subscription/subscription.dart';

part 'shop_request.freezed.dart';
part 'shop_request.g.dart';

@freezed
class ShopRequest with _$ShopRequest {
  factory ShopRequest({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'barber_shop_name') required String barberShopName,
    @JsonKey(name: 'owner_name') required String ownerName,
    @JsonKey(name: 'country_code') required String countryCode,
    @JsonKey(name: 'town_name') required String townName,
    @JsonKey(name: 'profile_image') required String profileImage,
    @JsonKey(name: 'subscription') required List<Subscription> subscriptions,
    @JsonKey(name: 'overview_images') List<String>? overviewImages,
    @JsonKey(name: 'overview_description') String? overviewDescription,
  }) = _ShopRequest;

  factory ShopRequest.fromJson(Map<String, dynamic> json) => _$ShopRequestFromJson(json);

  factory ShopRequest.fromFirestore(DocumentSnapshot<Map<String, Object?>> document) {
    final data = document.data();
    data!['id'] = document.id;

    return ShopRequest.fromJson(data);
  }
}
