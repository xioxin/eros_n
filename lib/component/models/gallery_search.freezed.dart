// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gallery_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GallerySearch _$GallerySearchFromJson(Map<String, dynamic> json) {
  return _GallerySearch.fromJson(json);
}

/// @nodoc
mixin _$GallerySearch {
  @JsonKey(name: 'result')
  List<Gallery> get result => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_pages')
  int? get numPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GallerySearchCopyWith<GallerySearch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GallerySearchCopyWith<$Res> {
  factory $GallerySearchCopyWith(
          GallerySearch value, $Res Function(GallerySearch) then) =
      _$GallerySearchCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'result') List<Gallery> result,
      @JsonKey(name: 'num_pages') int? numPages,
      @JsonKey(name: 'per_page') int? perPage});
}

/// @nodoc
class _$GallerySearchCopyWithImpl<$Res>
    implements $GallerySearchCopyWith<$Res> {
  _$GallerySearchCopyWithImpl(this._value, this._then);

  final GallerySearch _value;
  // ignore: unused_field
  final $Res Function(GallerySearch) _then;

  @override
  $Res call({
    Object? result = freezed,
    Object? numPages = freezed,
    Object? perPage = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Gallery>,
      numPages: numPages == freezed
          ? _value.numPages
          : numPages // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: perPage == freezed
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_GallerySearchCopyWith<$Res>
    implements $GallerySearchCopyWith<$Res> {
  factory _$$_GallerySearchCopyWith(
          _$_GallerySearch value, $Res Function(_$_GallerySearch) then) =
      __$$_GallerySearchCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'result') List<Gallery> result,
      @JsonKey(name: 'num_pages') int? numPages,
      @JsonKey(name: 'per_page') int? perPage});
}

/// @nodoc
class __$$_GallerySearchCopyWithImpl<$Res>
    extends _$GallerySearchCopyWithImpl<$Res>
    implements _$$_GallerySearchCopyWith<$Res> {
  __$$_GallerySearchCopyWithImpl(
      _$_GallerySearch _value, $Res Function(_$_GallerySearch) _then)
      : super(_value, (v) => _then(v as _$_GallerySearch));

  @override
  _$_GallerySearch get _value => super._value as _$_GallerySearch;

  @override
  $Res call({
    Object? result = freezed,
    Object? numPages = freezed,
    Object? perPage = freezed,
  }) {
    return _then(_$_GallerySearch(
      result: result == freezed
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Gallery>,
      numPages: numPages == freezed
          ? _value.numPages
          : numPages // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: perPage == freezed
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GallerySearch implements _GallerySearch {
  const _$_GallerySearch(
      {@JsonKey(name: 'result') final List<Gallery> result = const <Gallery>[],
      @JsonKey(name: 'num_pages') this.numPages,
      @JsonKey(name: 'per_page') this.perPage})
      : _result = result;

  factory _$_GallerySearch.fromJson(Map<String, dynamic> json) =>
      _$$_GallerySearchFromJson(json);

  final List<Gallery> _result;
  @override
  @JsonKey(name: 'result')
  List<Gallery> get result {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_result);
  }

  @override
  @JsonKey(name: 'num_pages')
  final int? numPages;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;

  @override
  String toString() {
    return 'GallerySearch(result: $result, numPages: $numPages, perPage: $perPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GallerySearch &&
            const DeepCollectionEquality().equals(other._result, _result) &&
            const DeepCollectionEquality().equals(other.numPages, numPages) &&
            const DeepCollectionEquality().equals(other.perPage, perPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_result),
      const DeepCollectionEquality().hash(numPages),
      const DeepCollectionEquality().hash(perPage));

  @JsonKey(ignore: true)
  @override
  _$$_GallerySearchCopyWith<_$_GallerySearch> get copyWith =>
      __$$_GallerySearchCopyWithImpl<_$_GallerySearch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GallerySearchToJson(
      this,
    );
  }
}

abstract class _GallerySearch implements GallerySearch {
  const factory _GallerySearch(
      {@JsonKey(name: 'result') final List<Gallery> result,
      @JsonKey(name: 'num_pages') final int? numPages,
      @JsonKey(name: 'per_page') final int? perPage}) = _$_GallerySearch;

  factory _GallerySearch.fromJson(Map<String, dynamic> json) =
      _$_GallerySearch.fromJson;

  @override
  @JsonKey(name: 'result')
  List<Gallery> get result;
  @override
  @JsonKey(name: 'num_pages')
  int? get numPages;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  @JsonKey(ignore: true)
  _$$_GallerySearchCopyWith<_$_GallerySearch> get copyWith =>
      throw _privateConstructorUsedError;
}
