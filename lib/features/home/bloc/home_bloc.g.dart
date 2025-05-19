// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bloc.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeStateCWProxy {
  HomeState status(CommonStatus status);

  HomeState errorMessage(String? errorMessage);

  HomeState hasReachedMax(bool hasReachedMax);

  HomeState page(int page);

  HomeState query(String? query);

  HomeState isLoading(bool isLoading);

  HomeState projects(List<Project> projects);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeState call({
    CommonStatus status,
    String? errorMessage,
    bool hasReachedMax,
    int page,
    String? query,
    bool isLoading,
    List<Project> projects,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomeState.copyWith.fieldName(...)`
class _$HomeStateCWProxyImpl implements _$HomeStateCWProxy {
  const _$HomeStateCWProxyImpl(this._value);

  final HomeState _value;

  @override
  HomeState status(CommonStatus status) => this(status: status);

  @override
  HomeState errorMessage(String? errorMessage) =>
      this(errorMessage: errorMessage);

  @override
  HomeState hasReachedMax(bool hasReachedMax) =>
      this(hasReachedMax: hasReachedMax);

  @override
  HomeState page(int page) => this(page: page);

  @override
  HomeState query(String? query) => this(query: query);

  @override
  HomeState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  HomeState projects(List<Project> projects) => this(projects: projects);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
    Object? hasReachedMax = const $CopyWithPlaceholder(),
    Object? page = const $CopyWithPlaceholder(),
    Object? query = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? projects = const $CopyWithPlaceholder(),
  }) {
    return HomeState(
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as CommonStatus,
      errorMessage: errorMessage == const $CopyWithPlaceholder()
          ? _value.errorMessage
          // ignore: cast_nullable_to_non_nullable
          : errorMessage as String?,
      hasReachedMax: hasReachedMax == const $CopyWithPlaceholder()
          ? _value.hasReachedMax
          // ignore: cast_nullable_to_non_nullable
          : hasReachedMax as bool,
      page: page == const $CopyWithPlaceholder()
          ? _value.page
          // ignore: cast_nullable_to_non_nullable
          : page as int,
      query: query == const $CopyWithPlaceholder()
          ? _value.query
          // ignore: cast_nullable_to_non_nullable
          : query as String?,
      isLoading: isLoading == const $CopyWithPlaceholder()
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      projects: projects == const $CopyWithPlaceholder()
          ? _value.projects
          // ignore: cast_nullable_to_non_nullable
          : projects as List<Project>,
    );
  }
}

extension $HomeStateCopyWith on HomeState {
  /// Returns a callable class that can be used as follows: `instanceOfHomeState.copyWith(...)` or like so:`instanceOfHomeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeStateCWProxy get copyWith => _$HomeStateCWProxyImpl(this);
}
