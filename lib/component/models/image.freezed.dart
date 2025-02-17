// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GalleryImage _$GalleryImageFromJson(Map<String, dynamic> json) {
  return _GalleryImage.fromJson(json);
}

/// @nodoc
mixin _$GalleryImage {
  @JsonKey(name: 't')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'h')
  int? get imgHeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'w')
  int? get imgWidth => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String? get href => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryImageCopyWith<GalleryImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryImageCopyWith<$Res> {
  factory $GalleryImageCopyWith(
          GalleryImage value, $Res Function(GalleryImage) then) =
      _$GalleryImageCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 't') String type,
      @JsonKey(name: 'h') int? imgHeight,
      @JsonKey(name: 'w') int? imgWidth,
      @JsonKey(ignore: true) String? imageUrl,
      @JsonKey(ignore: true) String? href});
}

/// @nodoc
class _$GalleryImageCopyWithImpl<$Res> implements $GalleryImageCopyWith<$Res> {
  _$GalleryImageCopyWithImpl(this._value, this._then);

  final GalleryImage _value;
  // ignore: unused_field
  final $Res Function(GalleryImage) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? imgHeight = freezed,
    Object? imgWidth = freezed,
    Object? imageUrl = freezed,
    Object? href = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      imgHeight: imgHeight == freezed
          ? _value.imgHeight
          : imgHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      imgWidth: imgWidth == freezed
          ? _value.imgWidth
          : imgWidth // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      href: href == freezed
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_GalleryImageCopyWith<$Res>
    implements $GalleryImageCopyWith<$Res> {
  factory _$$_GalleryImageCopyWith(
          _$_GalleryImage value, $Res Function(_$_GalleryImage) then) =
      __$$_GalleryImageCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 't') String type,
      @JsonKey(name: 'h') int? imgHeight,
      @JsonKey(name: 'w') int? imgWidth,
      @JsonKey(ignore: true) String? imageUrl,
      @JsonKey(ignore: true) String? href});
}

/// @nodoc
class __$$_GalleryImageCopyWithImpl<$Res>
    extends _$GalleryImageCopyWithImpl<$Res>
    implements _$$_GalleryImageCopyWith<$Res> {
  __$$_GalleryImageCopyWithImpl(
      _$_GalleryImage _value, $Res Function(_$_GalleryImage) _then)
      : super(_value, (v) => _then(v as _$_GalleryImage));

  @override
  _$_GalleryImage get _value => super._value as _$_GalleryImage;

  @override
  $Res call({
    Object? type = freezed,
    Object? imgHeight = freezed,
    Object? imgWidth = freezed,
    Object? imageUrl = freezed,
    Object? href = freezed,
  }) {
    return _then(_$_GalleryImage(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      imgHeight: imgHeight == freezed
          ? _value.imgHeight
          : imgHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      imgWidth: imgWidth == freezed
          ? _value.imgWidth
          : imgWidth // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      href: href == freezed
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_GalleryImage implements _GalleryImage {
  const _$_GalleryImage(
      {@JsonKey(name: 't') this.type = 'j',
      @JsonKey(name: 'h') this.imgHeight,
      @JsonKey(name: 'w') this.imgWidth,
      @JsonKey(ignore: true) this.imageUrl,
      @JsonKey(ignore: true) this.href});

  factory _$_GalleryImage.fromJson(Map<String, dynamic> json) =>
      _$$_GalleryImageFromJson(json);

  @override
  @JsonKey(name: 't')
  final String type;
  @override
  @JsonKey(name: 'h')
  final int? imgHeight;
  @override
  @JsonKey(name: 'w')
  final int? imgWidth;
  @override
  @JsonKey(ignore: true)
  final String? imageUrl;
  @override
  @JsonKey(ignore: true)
  final String? href;

  @override
  String toString() {
    return 'GalleryImage(type: $type, imgHeight: $imgHeight, imgWidth: $imgWidth, imageUrl: $imageUrl, href: $href)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GalleryImage &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.imgHeight, imgHeight) &&
            const DeepCollectionEquality().equals(other.imgWidth, imgWidth) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.href, href));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(imgHeight),
      const DeepCollectionEquality().hash(imgWidth),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(href));

  @JsonKey(ignore: true)
  @override
  _$$_GalleryImageCopyWith<_$_GalleryImage> get copyWith =>
      __$$_GalleryImageCopyWithImpl<_$_GalleryImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GalleryImageToJson(
      this,
    );
  }
}

abstract class _GalleryImage implements GalleryImage {
  const factory _GalleryImage(
      {@JsonKey(name: 't') final String type,
      @JsonKey(name: 'h') final int? imgHeight,
      @JsonKey(name: 'w') final int? imgWidth,
      @JsonKey(ignore: true) final String? imageUrl,
      @JsonKey(ignore: true) final String? href}) = _$_GalleryImage;

  factory _GalleryImage.fromJson(Map<String, dynamic> json) =
      _$_GalleryImage.fromJson;

  @override
  @JsonKey(name: 't')
  String get type;
  @override
  @JsonKey(name: 'h')
  int? get imgHeight;
  @override
  @JsonKey(name: 'w')
  int? get imgWidth;
  @override
  @JsonKey(ignore: true)
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  String? get href;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryImageCopyWith<_$_GalleryImage> get copyWith =>
      throw _privateConstructorUsedError;
}
