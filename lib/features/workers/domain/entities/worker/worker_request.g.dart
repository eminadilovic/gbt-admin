// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkerRequestImpl _$$WorkerRequestImplFromJson(Map<String, dynamic> json) =>
    _$WorkerRequestImpl(
      userId: json['worker_id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      profileImage: json['profile_image'] as String,
    );

Map<String, dynamic> _$$WorkerRequestImplToJson(_$WorkerRequestImpl instance) =>
    <String, dynamic>{
      'worker_id': instance.userId,
      'name': instance.name,
      'title': instance.title,
      'profile_image': instance.profileImage,
    };
