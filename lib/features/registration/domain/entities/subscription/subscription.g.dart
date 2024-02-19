// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionImpl _$$SubscriptionImplFromJson(Map<String, dynamic> json) =>
    _$SubscriptionImpl(
      amount: (json['amount'] as num).toDouble(),
      dateOfPayment: DateTime.parse(json['date_of_payment'] as String),
      validUntil: DateTime.parse(json['valid_until'] as String),
    );

Map<String, dynamic> _$$SubscriptionImplToJson(_$SubscriptionImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'date_of_payment': instance.dateOfPayment.toIso8601String(),
      'valid_until': instance.validUntil.toIso8601String(),
    };
