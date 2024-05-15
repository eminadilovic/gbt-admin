// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopData _$ShopDataFromJson(Map<String, dynamic> json) {
  return _ShopData.fromJson(json);
}

/// @nodoc
mixin _$ShopData {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'barber_shop_name')
  String get barberShopName => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_name')
  String get ownerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_code')
  String get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'town_name')
  String get townName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'subscription')
  List<Subscription>? get subscriptions => throw _privateConstructorUsedError;
  @JsonKey(name: 'overview_images')
  List<String>? get overviewImages => throw _privateConstructorUsedError;
  @JsonKey(name: 'overview_description')
  String? get overviewDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopDataCopyWith<ShopData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopDataCopyWith<$Res> {
  factory $ShopDataCopyWith(ShopData value, $Res Function(ShopData) then) =
      _$ShopDataCopyWithImpl<$Res, ShopData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'barber_shop_name') String barberShopName,
      @JsonKey(name: 'owner_name') String ownerName,
      @JsonKey(name: 'country_code') String countryCode,
      @JsonKey(name: 'town_name') String townName,
      @JsonKey(name: 'profile_image') String profileImage,
      @JsonKey(name: 'subscription') List<Subscription>? subscriptions,
      @JsonKey(name: 'overview_images') List<String>? overviewImages,
      @JsonKey(name: 'overview_description') String? overviewDescription});
}

/// @nodoc
class _$ShopDataCopyWithImpl<$Res, $Val extends ShopData>
    implements $ShopDataCopyWith<$Res> {
  _$ShopDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? barberShopName = null,
    Object? ownerName = null,
    Object? countryCode = null,
    Object? townName = null,
    Object? profileImage = null,
    Object? subscriptions = freezed,
    Object? overviewImages = freezed,
    Object? overviewDescription = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      barberShopName: null == barberShopName
          ? _value.barberShopName
          : barberShopName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      townName: null == townName
          ? _value.townName
          : townName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptions: freezed == subscriptions
          ? _value.subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<Subscription>?,
      overviewImages: freezed == overviewImages
          ? _value.overviewImages
          : overviewImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      overviewDescription: freezed == overviewDescription
          ? _value.overviewDescription
          : overviewDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopDataImplCopyWith<$Res>
    implements $ShopDataCopyWith<$Res> {
  factory _$$ShopDataImplCopyWith(
          _$ShopDataImpl value, $Res Function(_$ShopDataImpl) then) =
      __$$ShopDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'barber_shop_name') String barberShopName,
      @JsonKey(name: 'owner_name') String ownerName,
      @JsonKey(name: 'country_code') String countryCode,
      @JsonKey(name: 'town_name') String townName,
      @JsonKey(name: 'profile_image') String profileImage,
      @JsonKey(name: 'subscription') List<Subscription>? subscriptions,
      @JsonKey(name: 'overview_images') List<String>? overviewImages,
      @JsonKey(name: 'overview_description') String? overviewDescription});
}

/// @nodoc
class __$$ShopDataImplCopyWithImpl<$Res>
    extends _$ShopDataCopyWithImpl<$Res, _$ShopDataImpl>
    implements _$$ShopDataImplCopyWith<$Res> {
  __$$ShopDataImplCopyWithImpl(
      _$ShopDataImpl _value, $Res Function(_$ShopDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? barberShopName = null,
    Object? ownerName = null,
    Object? countryCode = null,
    Object? townName = null,
    Object? profileImage = null,
    Object? subscriptions = freezed,
    Object? overviewImages = freezed,
    Object? overviewDescription = freezed,
  }) {
    return _then(_$ShopDataImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      barberShopName: null == barberShopName
          ? _value.barberShopName
          : barberShopName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      townName: null == townName
          ? _value.townName
          : townName // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptions: freezed == subscriptions
          ? _value._subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<Subscription>?,
      overviewImages: freezed == overviewImages
          ? _value._overviewImages
          : overviewImages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      overviewDescription: freezed == overviewDescription
          ? _value.overviewDescription
          : overviewDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShopDataImpl implements _ShopData {
  _$ShopDataImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'barber_shop_name') required this.barberShopName,
      @JsonKey(name: 'owner_name') required this.ownerName,
      @JsonKey(name: 'country_code') required this.countryCode,
      @JsonKey(name: 'town_name') required this.townName,
      @JsonKey(name: 'profile_image') required this.profileImage,
      @JsonKey(name: 'subscription') final List<Subscription>? subscriptions,
      @JsonKey(name: 'overview_images') final List<String>? overviewImages,
      @JsonKey(name: 'overview_description') this.overviewDescription})
      : _subscriptions = subscriptions,
        _overviewImages = overviewImages;

  factory _$ShopDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShopDataImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'barber_shop_name')
  final String barberShopName;
  @override
  @JsonKey(name: 'owner_name')
  final String ownerName;
  @override
  @JsonKey(name: 'country_code')
  final String countryCode;
  @override
  @JsonKey(name: 'town_name')
  final String townName;
  @override
  @JsonKey(name: 'profile_image')
  final String profileImage;
  final List<Subscription>? _subscriptions;
  @override
  @JsonKey(name: 'subscription')
  List<Subscription>? get subscriptions {
    final value = _subscriptions;
    if (value == null) return null;
    if (_subscriptions is EqualUnmodifiableListView) return _subscriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _overviewImages;
  @override
  @JsonKey(name: 'overview_images')
  List<String>? get overviewImages {
    final value = _overviewImages;
    if (value == null) return null;
    if (_overviewImages is EqualUnmodifiableListView) return _overviewImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'overview_description')
  final String? overviewDescription;

  @override
  String toString() {
    return 'ShopData(userId: $userId, barberShopName: $barberShopName, ownerName: $ownerName, countryCode: $countryCode, townName: $townName, profileImage: $profileImage, subscriptions: $subscriptions, overviewImages: $overviewImages, overviewDescription: $overviewDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.barberShopName, barberShopName) ||
                other.barberShopName == barberShopName) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.townName, townName) ||
                other.townName == townName) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            const DeepCollectionEquality()
                .equals(other._subscriptions, _subscriptions) &&
            const DeepCollectionEquality()
                .equals(other._overviewImages, _overviewImages) &&
            (identical(other.overviewDescription, overviewDescription) ||
                other.overviewDescription == overviewDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      barberShopName,
      ownerName,
      countryCode,
      townName,
      profileImage,
      const DeepCollectionEquality().hash(_subscriptions),
      const DeepCollectionEquality().hash(_overviewImages),
      overviewDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopDataImplCopyWith<_$ShopDataImpl> get copyWith =>
      __$$ShopDataImplCopyWithImpl<_$ShopDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShopDataImplToJson(
      this,
    );
  }
}

abstract class _ShopData implements ShopData {
  factory _ShopData(
      {@JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'barber_shop_name') required final String barberShopName,
      @JsonKey(name: 'owner_name') required final String ownerName,
      @JsonKey(name: 'country_code') required final String countryCode,
      @JsonKey(name: 'town_name') required final String townName,
      @JsonKey(name: 'profile_image') required final String profileImage,
      @JsonKey(name: 'subscription') final List<Subscription>? subscriptions,
      @JsonKey(name: 'overview_images') final List<String>? overviewImages,
      @JsonKey(name: 'overview_description')
      final String? overviewDescription}) = _$ShopDataImpl;

  factory _ShopData.fromJson(Map<String, dynamic> json) =
      _$ShopDataImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'barber_shop_name')
  String get barberShopName;
  @override
  @JsonKey(name: 'owner_name')
  String get ownerName;
  @override
  @JsonKey(name: 'country_code')
  String get countryCode;
  @override
  @JsonKey(name: 'town_name')
  String get townName;
  @override
  @JsonKey(name: 'profile_image')
  String get profileImage;
  @override
  @JsonKey(name: 'subscription')
  List<Subscription>? get subscriptions;
  @override
  @JsonKey(name: 'overview_images')
  List<String>? get overviewImages;
  @override
  @JsonKey(name: 'overview_description')
  String? get overviewDescription;
  @override
  @JsonKey(ignore: true)
  _$$ShopDataImplCopyWith<_$ShopDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
