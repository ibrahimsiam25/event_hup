// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEventDto {

 String get id; String get name; String get imageUrl; String get localDate; String get localTime; String get venueName; String get city; String get address; double get distance;
/// Create a copy of HomeEventDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventDtoCopyWith<HomeEventDto> get copyWith => _$HomeEventDtoCopyWithImpl<HomeEventDto>(this as HomeEventDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.localDate, localDate) || other.localDate == localDate)&&(identical(other.localTime, localTime) || other.localTime == localTime)&&(identical(other.venueName, venueName) || other.venueName == venueName)&&(identical(other.city, city) || other.city == city)&&(identical(other.address, address) || other.address == address)&&(identical(other.distance, distance) || other.distance == distance));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,localDate,localTime,venueName,city,address,distance);

@override
String toString() {
  return 'HomeEventDto(id: $id, name: $name, imageUrl: $imageUrl, localDate: $localDate, localTime: $localTime, venueName: $venueName, city: $city, address: $address, distance: $distance)';
}


}

/// @nodoc
abstract mixin class $HomeEventDtoCopyWith<$Res>  {
  factory $HomeEventDtoCopyWith(HomeEventDto value, $Res Function(HomeEventDto) _then) = _$HomeEventDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String imageUrl, String localDate, String localTime, String venueName, String city, String address, double distance
});




}
/// @nodoc
class _$HomeEventDtoCopyWithImpl<$Res>
    implements $HomeEventDtoCopyWith<$Res> {
  _$HomeEventDtoCopyWithImpl(this._self, this._then);

  final HomeEventDto _self;
  final $Res Function(HomeEventDto) _then;

/// Create a copy of HomeEventDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? localDate = null,Object? localTime = null,Object? venueName = null,Object? city = null,Object? address = null,Object? distance = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,localDate: null == localDate ? _self.localDate : localDate // ignore: cast_nullable_to_non_nullable
as String,localTime: null == localTime ? _self.localTime : localTime // ignore: cast_nullable_to_non_nullable
as String,venueName: null == venueName ? _self.venueName : venueName // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeEventDto].
extension HomeEventDtoPatterns on HomeEventDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeEventDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeEventDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeEventDto value)  $default,){
final _that = this;
switch (_that) {
case _HomeEventDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeEventDto value)?  $default,){
final _that = this;
switch (_that) {
case _HomeEventDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String imageUrl,  String localDate,  String localTime,  String venueName,  String city,  String address,  double distance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeEventDto() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.localDate,_that.localTime,_that.venueName,_that.city,_that.address,_that.distance);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String imageUrl,  String localDate,  String localTime,  String venueName,  String city,  String address,  double distance)  $default,) {final _that = this;
switch (_that) {
case _HomeEventDto():
return $default(_that.id,_that.name,_that.imageUrl,_that.localDate,_that.localTime,_that.venueName,_that.city,_that.address,_that.distance);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String imageUrl,  String localDate,  String localTime,  String venueName,  String city,  String address,  double distance)?  $default,) {final _that = this;
switch (_that) {
case _HomeEventDto() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.localDate,_that.localTime,_that.venueName,_that.city,_that.address,_that.distance);case _:
  return null;

}
}

}

/// @nodoc


class _HomeEventDto extends HomeEventDto {
  const _HomeEventDto({this.id = '', this.name = '', this.imageUrl = '', this.localDate = '', this.localTime = '', this.venueName = '', this.city = '', this.address = '', this.distance = 0.0}): super._();
  

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String imageUrl;
@override@JsonKey() final  String localDate;
@override@JsonKey() final  String localTime;
@override@JsonKey() final  String venueName;
@override@JsonKey() final  String city;
@override@JsonKey() final  String address;
@override@JsonKey() final  double distance;

/// Create a copy of HomeEventDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeEventDtoCopyWith<_HomeEventDto> get copyWith => __$HomeEventDtoCopyWithImpl<_HomeEventDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeEventDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.localDate, localDate) || other.localDate == localDate)&&(identical(other.localTime, localTime) || other.localTime == localTime)&&(identical(other.venueName, venueName) || other.venueName == venueName)&&(identical(other.city, city) || other.city == city)&&(identical(other.address, address) || other.address == address)&&(identical(other.distance, distance) || other.distance == distance));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,localDate,localTime,venueName,city,address,distance);

@override
String toString() {
  return 'HomeEventDto(id: $id, name: $name, imageUrl: $imageUrl, localDate: $localDate, localTime: $localTime, venueName: $venueName, city: $city, address: $address, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$HomeEventDtoCopyWith<$Res> implements $HomeEventDtoCopyWith<$Res> {
  factory _$HomeEventDtoCopyWith(_HomeEventDto value, $Res Function(_HomeEventDto) _then) = __$HomeEventDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String imageUrl, String localDate, String localTime, String venueName, String city, String address, double distance
});




}
/// @nodoc
class __$HomeEventDtoCopyWithImpl<$Res>
    implements _$HomeEventDtoCopyWith<$Res> {
  __$HomeEventDtoCopyWithImpl(this._self, this._then);

  final _HomeEventDto _self;
  final $Res Function(_HomeEventDto) _then;

/// Create a copy of HomeEventDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? localDate = null,Object? localTime = null,Object? venueName = null,Object? city = null,Object? address = null,Object? distance = null,}) {
  return _then(_HomeEventDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,localDate: null == localDate ? _self.localDate : localDate // ignore: cast_nullable_to_non_nullable
as String,localTime: null == localTime ? _self.localTime : localTime // ignore: cast_nullable_to_non_nullable
as String,venueName: null == venueName ? _self.venueName : venueName // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
