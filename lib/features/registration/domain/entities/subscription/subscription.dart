import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription.freezed.dart';
part 'subscription.g.dart';

@freezed
class Subscription with _$Subscription {
  factory Subscription({
    @JsonKey(name: 'amount') required double amount,
    @JsonKey(name: 'date_of_payment') required DateTime dateOfPayment,
    @JsonKey(name: 'valid_until') required DateTime validUntil,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);
}
