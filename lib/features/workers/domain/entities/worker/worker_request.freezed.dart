// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'worker_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkerRequest _$WorkerRequestFromJson(Map<String, dynamic> json) {
  return _WorkerRequest.fromJson(json);
}

/// @nodoc
mixin _$WorkerRequest {
  @JsonKey(name: 'worker_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkerRequestCopyWith<WorkerRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkerRequestCopyWith<$Res> {
  factory $WorkerRequestCopyWith(
          WorkerRequest value, $Res Function(WorkerRequest) then) =
      _$WorkerRequestCopyWithImpl<$Res, WorkerRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'worker_id') String userId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'profile_image') String profileImage});
}

/// @nodoc
class _$WorkerRequestCopyWithImpl<$Res, $Val extends WorkerRequest>
    implements $WorkerRequestCopyWith<$Res> {
  _$WorkerRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? title = null,
    Object? profileImage = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkerRequestImplCopyWith<$Res>
    implements $WorkerRequestCopyWith<$Res> {
  factory _$$WorkerRequestImplCopyWith(
          _$WorkerRequestImpl value, $Res Function(_$WorkerRequestImpl) then) =
      __$$WorkerRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'worker_id') String userId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'profile_image') String profileImage});
}

/// @nodoc
class __$$WorkerRequestImplCopyWithImpl<$Res>
    extends _$WorkerRequestCopyWithImpl<$Res, _$WorkerRequestImpl>
    implements _$$WorkerRequestImplCopyWith<$Res> {
  __$$WorkerRequestImplCopyWithImpl(
      _$WorkerRequestImpl _value, $Res Function(_$WorkerRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? title = null,
    Object? profileImage = null,
  }) {
    return _then(_$WorkerRequestImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkerRequestImpl implements _WorkerRequest {
  _$WorkerRequestImpl(
      {@JsonKey(name: 'worker_id') required this.userId,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'profile_image') required this.profileImage});

  factory _$WorkerRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkerRequestImplFromJson(json);

  @override
  @JsonKey(name: 'worker_id')
  final String userId;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'profile_image')
  final String profileImage;

  @override
  String toString() {
    return 'WorkerRequest(userId: $userId, name: $name, title: $title, profileImage: $profileImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkerRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, name, title, profileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkerRequestImplCopyWith<_$WorkerRequestImpl> get copyWith =>
      __$$WorkerRequestImplCopyWithImpl<_$WorkerRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkerRequestImplToJson(
      this,
    );
  }
}

abstract class _WorkerRequest implements WorkerRequest {
  factory _WorkerRequest(
          {@JsonKey(name: 'worker_id') required final String userId,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'profile_image') required final String profileImage}) =
      _$WorkerRequestImpl;

  factory _WorkerRequest.fromJson(Map<String, dynamic> json) =
      _$WorkerRequestImpl.fromJson;

  @override
  @JsonKey(name: 'worker_id')
  String get userId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'profile_image')
  String get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$WorkerRequestImplCopyWith<_$WorkerRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
