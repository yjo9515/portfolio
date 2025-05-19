// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CommonStateCWProxy {
  CommonState status(CommonStatus status);

  CommonState errorMessage(String? errorMessage);

  CommonState page(int page);

  CommonState query(String? query);

  CommonState hasReachedMax(bool hasReachedMax);

  CommonState route(String? route);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommonState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommonState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommonState call({
    CommonStatus status,
    String? errorMessage,
    int page,
    String? query,
    bool hasReachedMax,
    String? route,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCommonState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCommonState.copyWith.fieldName(...)`
class _$CommonStateCWProxyImpl implements _$CommonStateCWProxy {
  const _$CommonStateCWProxyImpl(this._value);

  final CommonState _value;

  @override
  CommonState status(CommonStatus status) => this(status: status);

  @override
  CommonState errorMessage(String? errorMessage) =>
      this(errorMessage: errorMessage);

  @override
  CommonState page(int page) => this(page: page);

  @override
  CommonState query(String? query) => this(query: query);

  @override
  CommonState hasReachedMax(bool hasReachedMax) =>
      this(hasReachedMax: hasReachedMax);

  @override
  CommonState route(String? route) => this(route: route);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommonState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommonState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommonState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
    Object? page = const $CopyWithPlaceholder(),
    Object? query = const $CopyWithPlaceholder(),
    Object? hasReachedMax = const $CopyWithPlaceholder(),
    Object? route = const $CopyWithPlaceholder(),
  }) {
    return CommonState(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as CommonStatus,
      errorMessage: errorMessage == const $CopyWithPlaceholder()
          ? _value.errorMessage
          // ignore: cast_nullable_to_non_nullable
          : errorMessage as String?,
      page: page == const $CopyWithPlaceholder()
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as int,
      query: query == const $CopyWithPlaceholder()
          ? _value.query
          // ignore: cast_nullable_to_non_nullable
          : query as String?,
      hasReachedMax: hasReachedMax == const $CopyWithPlaceholder()
          ? _value.hasReachedMax
          // ignore: cast_nullable_to_non_nullable
          : hasReachedMax as bool,
      route: route == const $CopyWithPlaceholder()
          ? _value.route
          // ignore: cast_nullable_to_non_nullable
          : route as String?,
    );
  }
}

extension $CommonStateCopyWith on CommonState {
  /// Returns a callable class that can be used as follows: `instanceOfCommonState.copyWith(...)` or like so:`instanceOfCommonState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CommonStateCWProxy get copyWith => _$CommonStateCWProxyImpl(this);
}
