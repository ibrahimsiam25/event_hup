// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EventDto {

 String get id; String get name; String get ticketUrl; String get imageUrl; String get localDate; String get localTime; String get venue; String get city; String get address; String get organizer; String get organizerImageUrl; String get info; String get pleaseNote; String get category; double get minPrice; double get maxPrice; String get currency; double get latitude; double get longitude; double get distance;
/// Create a copy of EventDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventDtoCopyWith<EventDto> get copyWith => _$EventDtoCopyWithImpl<EventDto>(this as EventDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.ticketUrl, ticketUrl) || other.ticketUrl == ticketUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.localDate, localDate) || other.localDate == localDate)&&(identical(other.localTime, localTime) || other.localTime == localTime)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.city, city) || other.city == city)&&(identical(other.address, address) || other.address == address)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&(identical(other.organizerImageUrl, organizerImageUrl) || other.organizerImageUrl == organizerImageUrl)&&(identical(other.info, info) || other.info == info)&&(identical(other.pleaseNote, pleaseNote) || other.pleaseNote == pleaseNote)&&(identical(other.category, category) || other.category == category)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distance, distance) || other.distance == distance));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,name,ticketUrl,imageUrl,localDate,localTime,venue,city,address,organizer,organizerImageUrl,info,pleaseNote,category,minPrice,maxPrice,currency,latitude,longitude,distance]);

@override
String toString() {
  return 'EventDto(id: $id, name: $name, ticketUrl: $ticketUrl, imageUrl: $imageUrl, localDate: $localDate, localTime: $localTime, venue: $venue, city: $city, address: $address, organizer: $organizer, organizerImageUrl: $organizerImageUrl, info: $info, pleaseNote: $pleaseNote, category: $category, minPrice: $minPrice, maxPrice: $maxPrice, currency: $currency, latitude: $latitude, longitude: $longitude, distance: $distance)';
}


}

/// @nodoc
abstract mixin class $EventDtoCopyWith<$Res>  {
  factory $EventDtoCopyWith(EventDto value, $Res Function(EventDto) _then) = _$EventDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String ticketUrl, String imageUrl, String localDate, String localTime, String venue, String city, String address, String organizer, String organizerImageUrl, String info, String pleaseNote, String category, double minPrice, double maxPrice, String currency, double latitude, double longitude, double distance
});




}
/// @nodoc
class _$EventDtoCopyWithImpl<$Res>
    implements $EventDtoCopyWith<$Res> {
  _$EventDtoCopyWithImpl(this._self, this._then);

  final EventDto _self;
  final $Res Function(EventDto) _then;

/// Create a copy of EventDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? ticketUrl = null,Object? imageUrl = null,Object? localDate = null,Object? localTime = null,Object? venue = null,Object? city = null,Object? address = null,Object? organizer = null,Object? organizerImageUrl = null,Object? info = null,Object? pleaseNote = null,Object? category = null,Object? minPrice = null,Object? maxPrice = null,Object? currency = null,Object? latitude = null,Object? longitude = null,Object? distance = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ticketUrl: null == ticketUrl ? _self.ticketUrl : ticketUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,localDate: null == localDate ? _self.localDate : localDate // ignore: cast_nullable_to_non_nullable
as String,localTime: null == localTime ? _self.localTime : localTime // ignore: cast_nullable_to_non_nullable
as String,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,organizer: null == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as String,organizerImageUrl: null == organizerImageUrl ? _self.organizerImageUrl : organizerImageUrl // ignore: cast_nullable_to_non_nullable
as String,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as String,pleaseNote: null == pleaseNote ? _self.pleaseNote : pleaseNote // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,minPrice: null == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double,maxPrice: null == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [EventDto].
extension EventDtoPatterns on EventDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventDto value)  $default,){
final _that = this;
switch (_that) {
case _EventDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventDto value)?  $default,){
final _that = this;
switch (_that) {
case _EventDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String ticketUrl,  String imageUrl,  String localDate,  String localTime,  String venue,  String city,  String address,  String organizer,  String organizerImageUrl,  String info,  String pleaseNote,  String category,  double minPrice,  double maxPrice,  String currency,  double latitude,  double longitude,  double distance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventDto() when $default != null:
return $default(_that.id,_that.name,_that.ticketUrl,_that.imageUrl,_that.localDate,_that.localTime,_that.venue,_that.city,_that.address,_that.organizer,_that.organizerImageUrl,_that.info,_that.pleaseNote,_that.category,_that.minPrice,_that.maxPrice,_that.currency,_that.latitude,_that.longitude,_that.distance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String ticketUrl,  String imageUrl,  String localDate,  String localTime,  String venue,  String city,  String address,  String organizer,  String organizerImageUrl,  String info,  String pleaseNote,  String category,  double minPrice,  double maxPrice,  String currency,  double latitude,  double longitude,  double distance)  $default,) {final _that = this;
switch (_that) {
case _EventDto():
return $default(_that.id,_that.name,_that.ticketUrl,_that.imageUrl,_that.localDate,_that.localTime,_that.venue,_that.city,_that.address,_that.organizer,_that.organizerImageUrl,_that.info,_that.pleaseNote,_that.category,_that.minPrice,_that.maxPrice,_that.currency,_that.latitude,_that.longitude,_that.distance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String ticketUrl,  String imageUrl,  String localDate,  String localTime,  String venue,  String city,  String address,  String organizer,  String organizerImageUrl,  String info,  String pleaseNote,  String category,  double minPrice,  double maxPrice,  String currency,  double latitude,  double longitude,  double distance)?  $default,) {final _that = this;
switch (_that) {
case _EventDto() when $default != null:
return $default(_that.id,_that.name,_that.ticketUrl,_that.imageUrl,_that.localDate,_that.localTime,_that.venue,_that.city,_that.address,_that.organizer,_that.organizerImageUrl,_that.info,_that.pleaseNote,_that.category,_that.minPrice,_that.maxPrice,_that.currency,_that.latitude,_that.longitude,_that.distance);case _:
  return null;

}
}

}

/// @nodoc


class _EventDto extends EventDto {
  const _EventDto({this.id = '', this.name = '', this.ticketUrl = '', this.imageUrl = '', this.localDate = '', this.localTime = '', this.venue = '', this.city = '', this.address = '', this.organizer = '', this.organizerImageUrl = '', this.info = '', this.pleaseNote = '', this.category = '', this.minPrice = 0.0, this.maxPrice = 0.0, this.currency = '', this.latitude = 0.0, this.longitude = 0.0, this.distance = 0.0}): super._();
  

@override@JsonKey() final  String id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String ticketUrl;
@override@JsonKey() final  String imageUrl;
@override@JsonKey() final  String localDate;
@override@JsonKey() final  String localTime;
@override@JsonKey() final  String venue;
@override@JsonKey() final  String city;
@override@JsonKey() final  String address;
@override@JsonKey() final  String organizer;
@override@JsonKey() final  String organizerImageUrl;
@override@JsonKey() final  String info;
@override@JsonKey() final  String pleaseNote;
@override@JsonKey() final  String category;
@override@JsonKey() final  double minPrice;
@override@JsonKey() final  double maxPrice;
@override@JsonKey() final  String currency;
@override@JsonKey() final  double latitude;
@override@JsonKey() final  double longitude;
@override@JsonKey() final  double distance;

/// Create a copy of EventDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventDtoCopyWith<_EventDto> get copyWith => __$EventDtoCopyWithImpl<_EventDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.ticketUrl, ticketUrl) || other.ticketUrl == ticketUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.localDate, localDate) || other.localDate == localDate)&&(identical(other.localTime, localTime) || other.localTime == localTime)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.city, city) || other.city == city)&&(identical(other.address, address) || other.address == address)&&(identical(other.organizer, organizer) || other.organizer == organizer)&&(identical(other.organizerImageUrl, organizerImageUrl) || other.organizerImageUrl == organizerImageUrl)&&(identical(other.info, info) || other.info == info)&&(identical(other.pleaseNote, pleaseNote) || other.pleaseNote == pleaseNote)&&(identical(other.category, category) || other.category == category)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.distance, distance) || other.distance == distance));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,name,ticketUrl,imageUrl,localDate,localTime,venue,city,address,organizer,organizerImageUrl,info,pleaseNote,category,minPrice,maxPrice,currency,latitude,longitude,distance]);

@override
String toString() {
  return 'EventDto(id: $id, name: $name, ticketUrl: $ticketUrl, imageUrl: $imageUrl, localDate: $localDate, localTime: $localTime, venue: $venue, city: $city, address: $address, organizer: $organizer, organizerImageUrl: $organizerImageUrl, info: $info, pleaseNote: $pleaseNote, category: $category, minPrice: $minPrice, maxPrice: $maxPrice, currency: $currency, latitude: $latitude, longitude: $longitude, distance: $distance)';
}


}

/// @nodoc
abstract mixin class _$EventDtoCopyWith<$Res> implements $EventDtoCopyWith<$Res> {
  factory _$EventDtoCopyWith(_EventDto value, $Res Function(_EventDto) _then) = __$EventDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String ticketUrl, String imageUrl, String localDate, String localTime, String venue, String city, String address, String organizer, String organizerImageUrl, String info, String pleaseNote, String category, double minPrice, double maxPrice, String currency, double latitude, double longitude, double distance
});




}
/// @nodoc
class __$EventDtoCopyWithImpl<$Res>
    implements _$EventDtoCopyWith<$Res> {
  __$EventDtoCopyWithImpl(this._self, this._then);

  final _EventDto _self;
  final $Res Function(_EventDto) _then;

/// Create a copy of EventDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? ticketUrl = null,Object? imageUrl = null,Object? localDate = null,Object? localTime = null,Object? venue = null,Object? city = null,Object? address = null,Object? organizer = null,Object? organizerImageUrl = null,Object? info = null,Object? pleaseNote = null,Object? category = null,Object? minPrice = null,Object? maxPrice = null,Object? currency = null,Object? latitude = null,Object? longitude = null,Object? distance = null,}) {
  return _then(_EventDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ticketUrl: null == ticketUrl ? _self.ticketUrl : ticketUrl // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,localDate: null == localDate ? _self.localDate : localDate // ignore: cast_nullable_to_non_nullable
as String,localTime: null == localTime ? _self.localTime : localTime // ignore: cast_nullable_to_non_nullable
as String,venue: null == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,organizer: null == organizer ? _self.organizer : organizer // ignore: cast_nullable_to_non_nullable
as String,organizerImageUrl: null == organizerImageUrl ? _self.organizerImageUrl : organizerImageUrl // ignore: cast_nullable_to_non_nullable
as String,info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as String,pleaseNote: null == pleaseNote ? _self.pleaseNote : pleaseNote // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,minPrice: null == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as double,maxPrice: null == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
