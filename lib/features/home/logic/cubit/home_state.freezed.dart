// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeState<T> {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeState<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeState<$T>()';
  }
}

/// @nodoc
class $HomeStateCopyWith<T, $Res> {
  $HomeStateCopyWith(HomeState<T> _, $Res Function(HomeState<T>) __);
}

/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns<T> on HomeState<T> {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(HomeScreenLoading<T> value)? homeScreenLoading,
    TResult Function(HomeScreenLoaded<T> value)? homeScreenLoaded,
    TResult Function(HomeScreenLoadedError<T> value)? homeScreenLoadedError,
    TResult Function(GettingCourses<T> value)? gettingCourses,
    TResult Function(CoursesLoaded<T> value)? coursesLoaded,
    TResult Function(CoursesLoadedError<T> value)? coursesLoadedError,
    TResult Function(GettingCoursesByCategory<T> value)?
        gettingCoursesByCategory,
    TResult Function(CoursesByCategoryLoaded<T> value)? coursesByCategoryLoaded,
    TResult Function(CoursesByCategoryLoadedError<T> value)?
        coursesByCategoryLoadedError,
    TResult Function(WeeklyProgressLoaded<T> value)? weeklyProgressLoaded,
    TResult Function(WeeklyProgressError<T> value)? weeklyProgressError,
    TResult Function(GettingCategories<T> value)? gettingCategories,
    TResult Function(CategoriesLoaded<T> value)? categoriesLoaded,
    TResult Function(CategoriesLoadedError<T> value)? categoriesLoadedError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case HomeScreenLoading() when homeScreenLoading != null:
        return homeScreenLoading(_that);
      case HomeScreenLoaded() when homeScreenLoaded != null:
        return homeScreenLoaded(_that);
      case HomeScreenLoadedError() when homeScreenLoadedError != null:
        return homeScreenLoadedError(_that);
      case GettingCourses() when gettingCourses != null:
        return gettingCourses(_that);
      case CoursesLoaded() when coursesLoaded != null:
        return coursesLoaded(_that);
      case CoursesLoadedError() when coursesLoadedError != null:
        return coursesLoadedError(_that);
      case GettingCoursesByCategory() when gettingCoursesByCategory != null:
        return gettingCoursesByCategory(_that);
      case CoursesByCategoryLoaded() when coursesByCategoryLoaded != null:
        return coursesByCategoryLoaded(_that);
      case CoursesByCategoryLoadedError()
          when coursesByCategoryLoadedError != null:
        return coursesByCategoryLoadedError(_that);
      case WeeklyProgressLoaded() when weeklyProgressLoaded != null:
        return weeklyProgressLoaded(_that);
      case WeeklyProgressError() when weeklyProgressError != null:
        return weeklyProgressError(_that);
      case GettingCategories() when gettingCategories != null:
        return gettingCategories(_that);
      case CategoriesLoaded() when categoriesLoaded != null:
        return categoriesLoaded(_that);
      case CategoriesLoadedError() when categoriesLoadedError != null:
        return categoriesLoadedError(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(HomeScreenLoading<T> value) homeScreenLoading,
    required TResult Function(HomeScreenLoaded<T> value) homeScreenLoaded,
    required TResult Function(HomeScreenLoadedError<T> value)
        homeScreenLoadedError,
    required TResult Function(GettingCourses<T> value) gettingCourses,
    required TResult Function(CoursesLoaded<T> value) coursesLoaded,
    required TResult Function(CoursesLoadedError<T> value) coursesLoadedError,
    required TResult Function(GettingCoursesByCategory<T> value)
        gettingCoursesByCategory,
    required TResult Function(CoursesByCategoryLoaded<T> value)
        coursesByCategoryLoaded,
    required TResult Function(CoursesByCategoryLoadedError<T> value)
        coursesByCategoryLoadedError,
    required TResult Function(WeeklyProgressLoaded<T> value)
        weeklyProgressLoaded,
    required TResult Function(WeeklyProgressError<T> value) weeklyProgressError,
    required TResult Function(GettingCategories<T> value) gettingCategories,
    required TResult Function(CategoriesLoaded<T> value) categoriesLoaded,
    required TResult Function(CategoriesLoadedError<T> value)
        categoriesLoadedError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case HomeScreenLoading():
        return homeScreenLoading(_that);
      case HomeScreenLoaded():
        return homeScreenLoaded(_that);
      case HomeScreenLoadedError():
        return homeScreenLoadedError(_that);
      case GettingCourses():
        return gettingCourses(_that);
      case CoursesLoaded():
        return coursesLoaded(_that);
      case CoursesLoadedError():
        return coursesLoadedError(_that);
      case GettingCoursesByCategory():
        return gettingCoursesByCategory(_that);
      case CoursesByCategoryLoaded():
        return coursesByCategoryLoaded(_that);
      case CoursesByCategoryLoadedError():
        return coursesByCategoryLoadedError(_that);
      case WeeklyProgressLoaded():
        return weeklyProgressLoaded(_that);
      case WeeklyProgressError():
        return weeklyProgressError(_that);
      case GettingCategories():
        return gettingCategories(_that);
      case CategoriesLoaded():
        return categoriesLoaded(_that);
      case CategoriesLoadedError():
        return categoriesLoadedError(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(HomeScreenLoading<T> value)? homeScreenLoading,
    TResult? Function(HomeScreenLoaded<T> value)? homeScreenLoaded,
    TResult? Function(HomeScreenLoadedError<T> value)? homeScreenLoadedError,
    TResult? Function(GettingCourses<T> value)? gettingCourses,
    TResult? Function(CoursesLoaded<T> value)? coursesLoaded,
    TResult? Function(CoursesLoadedError<T> value)? coursesLoadedError,
    TResult? Function(GettingCoursesByCategory<T> value)?
        gettingCoursesByCategory,
    TResult? Function(CoursesByCategoryLoaded<T> value)?
        coursesByCategoryLoaded,
    TResult? Function(CoursesByCategoryLoadedError<T> value)?
        coursesByCategoryLoadedError,
    TResult? Function(WeeklyProgressLoaded<T> value)? weeklyProgressLoaded,
    TResult? Function(WeeklyProgressError<T> value)? weeklyProgressError,
    TResult? Function(GettingCategories<T> value)? gettingCategories,
    TResult? Function(CategoriesLoaded<T> value)? categoriesLoaded,
    TResult? Function(CategoriesLoadedError<T> value)? categoriesLoadedError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case HomeScreenLoading() when homeScreenLoading != null:
        return homeScreenLoading(_that);
      case HomeScreenLoaded() when homeScreenLoaded != null:
        return homeScreenLoaded(_that);
      case HomeScreenLoadedError() when homeScreenLoadedError != null:
        return homeScreenLoadedError(_that);
      case GettingCourses() when gettingCourses != null:
        return gettingCourses(_that);
      case CoursesLoaded() when coursesLoaded != null:
        return coursesLoaded(_that);
      case CoursesLoadedError() when coursesLoadedError != null:
        return coursesLoadedError(_that);
      case GettingCoursesByCategory() when gettingCoursesByCategory != null:
        return gettingCoursesByCategory(_that);
      case CoursesByCategoryLoaded() when coursesByCategoryLoaded != null:
        return coursesByCategoryLoaded(_that);
      case CoursesByCategoryLoadedError()
          when coursesByCategoryLoadedError != null:
        return coursesByCategoryLoadedError(_that);
      case WeeklyProgressLoaded() when weeklyProgressLoaded != null:
        return weeklyProgressLoaded(_that);
      case WeeklyProgressError() when weeklyProgressError != null:
        return weeklyProgressError(_that);
      case GettingCategories() when gettingCategories != null:
        return gettingCategories(_that);
      case CategoriesLoaded() when categoriesLoaded != null:
        return categoriesLoaded(_that);
      case CategoriesLoadedError() when categoriesLoadedError != null:
        return categoriesLoadedError(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? homeScreenLoading,
    TResult Function(ProfileAccountModel profileData)? homeScreenLoaded,
    TResult Function(String error)? homeScreenLoadedError,
    TResult Function()? gettingCourses,
    TResult Function(List<CourseInfoModel> courses)? coursesLoaded,
    TResult Function(String error)? coursesLoadedError,
    TResult Function()? gettingCoursesByCategory,
    TResult Function(List<CourseInfoModel> courses)? coursesByCategoryLoaded,
    TResult Function(String error)? coursesByCategoryLoadedError,
    TResult Function(Map<String, int> data)? weeklyProgressLoaded,
    TResult Function(String error)? weeklyProgressError,
    TResult Function()? gettingCategories,
    TResult Function(List<CategoryModel> categories)? categoriesLoaded,
    TResult Function(String error)? categoriesLoadedError,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case HomeScreenLoading() when homeScreenLoading != null:
        return homeScreenLoading();
      case HomeScreenLoaded() when homeScreenLoaded != null:
        return homeScreenLoaded(_that.profileData);
      case HomeScreenLoadedError() when homeScreenLoadedError != null:
        return homeScreenLoadedError(_that.error);
      case GettingCourses() when gettingCourses != null:
        return gettingCourses();
      case CoursesLoaded() when coursesLoaded != null:
        return coursesLoaded(_that.courses);
      case CoursesLoadedError() when coursesLoadedError != null:
        return coursesLoadedError(_that.error);
      case GettingCoursesByCategory() when gettingCoursesByCategory != null:
        return gettingCoursesByCategory();
      case CoursesByCategoryLoaded() when coursesByCategoryLoaded != null:
        return coursesByCategoryLoaded(_that.courses);
      case CoursesByCategoryLoadedError()
          when coursesByCategoryLoadedError != null:
        return coursesByCategoryLoadedError(_that.error);
      case WeeklyProgressLoaded() when weeklyProgressLoaded != null:
        return weeklyProgressLoaded(_that.data);
      case WeeklyProgressError() when weeklyProgressError != null:
        return weeklyProgressError(_that.error);
      case GettingCategories() when gettingCategories != null:
        return gettingCategories();
      case CategoriesLoaded() when categoriesLoaded != null:
        return categoriesLoaded(_that.categories);
      case CategoriesLoadedError() when categoriesLoadedError != null:
        return categoriesLoadedError(_that.error);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() homeScreenLoading,
    required TResult Function(ProfileAccountModel profileData) homeScreenLoaded,
    required TResult Function(String error) homeScreenLoadedError,
    required TResult Function() gettingCourses,
    required TResult Function(List<CourseInfoModel> courses) coursesLoaded,
    required TResult Function(String error) coursesLoadedError,
    required TResult Function() gettingCoursesByCategory,
    required TResult Function(List<CourseInfoModel> courses)
        coursesByCategoryLoaded,
    required TResult Function(String error) coursesByCategoryLoadedError,
    required TResult Function(Map<String, int> data) weeklyProgressLoaded,
    required TResult Function(String error) weeklyProgressError,
    required TResult Function() gettingCategories,
    required TResult Function(List<CategoryModel> categories) categoriesLoaded,
    required TResult Function(String error) categoriesLoadedError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case HomeScreenLoading():
        return homeScreenLoading();
      case HomeScreenLoaded():
        return homeScreenLoaded(_that.profileData);
      case HomeScreenLoadedError():
        return homeScreenLoadedError(_that.error);
      case GettingCourses():
        return gettingCourses();
      case CoursesLoaded():
        return coursesLoaded(_that.courses);
      case CoursesLoadedError():
        return coursesLoadedError(_that.error);
      case GettingCoursesByCategory():
        return gettingCoursesByCategory();
      case CoursesByCategoryLoaded():
        return coursesByCategoryLoaded(_that.courses);
      case CoursesByCategoryLoadedError():
        return coursesByCategoryLoadedError(_that.error);
      case WeeklyProgressLoaded():
        return weeklyProgressLoaded(_that.data);
      case WeeklyProgressError():
        return weeklyProgressError(_that.error);
      case GettingCategories():
        return gettingCategories();
      case CategoriesLoaded():
        return categoriesLoaded(_that.categories);
      case CategoriesLoadedError():
        return categoriesLoadedError(_that.error);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? homeScreenLoading,
    TResult? Function(ProfileAccountModel profileData)? homeScreenLoaded,
    TResult? Function(String error)? homeScreenLoadedError,
    TResult? Function()? gettingCourses,
    TResult? Function(List<CourseInfoModel> courses)? coursesLoaded,
    TResult? Function(String error)? coursesLoadedError,
    TResult? Function()? gettingCoursesByCategory,
    TResult? Function(List<CourseInfoModel> courses)? coursesByCategoryLoaded,
    TResult? Function(String error)? coursesByCategoryLoadedError,
    TResult? Function(Map<String, int> data)? weeklyProgressLoaded,
    TResult? Function(String error)? weeklyProgressError,
    TResult? Function()? gettingCategories,
    TResult? Function(List<CategoryModel> categories)? categoriesLoaded,
    TResult? Function(String error)? categoriesLoadedError,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case HomeScreenLoading() when homeScreenLoading != null:
        return homeScreenLoading();
      case HomeScreenLoaded() when homeScreenLoaded != null:
        return homeScreenLoaded(_that.profileData);
      case HomeScreenLoadedError() when homeScreenLoadedError != null:
        return homeScreenLoadedError(_that.error);
      case GettingCourses() when gettingCourses != null:
        return gettingCourses();
      case CoursesLoaded() when coursesLoaded != null:
        return coursesLoaded(_that.courses);
      case CoursesLoadedError() when coursesLoadedError != null:
        return coursesLoadedError(_that.error);
      case GettingCoursesByCategory() when gettingCoursesByCategory != null:
        return gettingCoursesByCategory();
      case CoursesByCategoryLoaded() when coursesByCategoryLoaded != null:
        return coursesByCategoryLoaded(_that.courses);
      case CoursesByCategoryLoadedError()
          when coursesByCategoryLoadedError != null:
        return coursesByCategoryLoadedError(_that.error);
      case WeeklyProgressLoaded() when weeklyProgressLoaded != null:
        return weeklyProgressLoaded(_that.data);
      case WeeklyProgressError() when weeklyProgressError != null:
        return weeklyProgressError(_that.error);
      case GettingCategories() when gettingCategories != null:
        return gettingCategories();
      case CategoriesLoaded() when categoriesLoaded != null:
        return categoriesLoaded(_that.categories);
      case CategoriesLoadedError() when categoriesLoadedError != null:
        return categoriesLoadedError(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial<T> implements HomeState<T> {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeState<$T>.initial()';
  }
}

/// @nodoc

class HomeScreenLoading<T> implements HomeState<T> {
  const HomeScreenLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeScreenLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeState<$T>.homeScreenLoading()';
  }
}

/// @nodoc

class HomeScreenLoaded<T> implements HomeState<T> {
  const HomeScreenLoaded({required this.profileData});

  final ProfileAccountModel profileData;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeScreenLoadedCopyWith<T, HomeScreenLoaded<T>> get copyWith =>
      _$HomeScreenLoadedCopyWithImpl<T, HomeScreenLoaded<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeScreenLoaded<T> &&
            (identical(other.profileData, profileData) ||
                other.profileData == profileData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileData);

  @override
  String toString() {
    return 'HomeState<$T>.homeScreenLoaded(profileData: $profileData)';
  }
}

/// @nodoc
abstract mixin class $HomeScreenLoadedCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $HomeScreenLoadedCopyWith(
          HomeScreenLoaded<T> value, $Res Function(HomeScreenLoaded<T>) _then) =
      _$HomeScreenLoadedCopyWithImpl;
  @useResult
  $Res call({ProfileAccountModel profileData});
}

/// @nodoc
class _$HomeScreenLoadedCopyWithImpl<T, $Res>
    implements $HomeScreenLoadedCopyWith<T, $Res> {
  _$HomeScreenLoadedCopyWithImpl(this._self, this._then);

  final HomeScreenLoaded<T> _self;
  final $Res Function(HomeScreenLoaded<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileData = null,
  }) {
    return _then(HomeScreenLoaded<T>(
      profileData: null == profileData
          ? _self.profileData
          : profileData // ignore: cast_nullable_to_non_nullable
              as ProfileAccountModel,
    ));
  }
}

/// @nodoc

class HomeScreenLoadedError<T> implements HomeState<T> {
  const HomeScreenLoadedError({required this.error});

  final String error;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeScreenLoadedErrorCopyWith<T, HomeScreenLoadedError<T>> get copyWith =>
      _$HomeScreenLoadedErrorCopyWithImpl<T, HomeScreenLoadedError<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeScreenLoadedError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'HomeState<$T>.homeScreenLoadedError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $HomeScreenLoadedErrorCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $HomeScreenLoadedErrorCopyWith(HomeScreenLoadedError<T> value,
          $Res Function(HomeScreenLoadedError<T>) _then) =
      _$HomeScreenLoadedErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$HomeScreenLoadedErrorCopyWithImpl<T, $Res>
    implements $HomeScreenLoadedErrorCopyWith<T, $Res> {
  _$HomeScreenLoadedErrorCopyWithImpl(this._self, this._then);

  final HomeScreenLoadedError<T> _self;
  final $Res Function(HomeScreenLoadedError<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(HomeScreenLoadedError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GettingCourses<T> implements HomeState<T> {
  const GettingCourses();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GettingCourses<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeState<$T>.gettingCourses()';
  }
}

/// @nodoc

class CoursesLoaded<T> implements HomeState<T> {
  const CoursesLoaded({required final List<CourseInfoModel> courses})
      : _courses = courses;

  final List<CourseInfoModel> _courses;
  List<CourseInfoModel> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoursesLoadedCopyWith<T, CoursesLoaded<T>> get copyWith =>
      _$CoursesLoadedCopyWithImpl<T, CoursesLoaded<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoursesLoaded<T> &&
            const DeepCollectionEquality().equals(other._courses, _courses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_courses));

  @override
  String toString() {
    return 'HomeState<$T>.coursesLoaded(courses: $courses)';
  }
}

/// @nodoc
abstract mixin class $CoursesLoadedCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $CoursesLoadedCopyWith(
          CoursesLoaded<T> value, $Res Function(CoursesLoaded<T>) _then) =
      _$CoursesLoadedCopyWithImpl;
  @useResult
  $Res call({List<CourseInfoModel> courses});
}

/// @nodoc
class _$CoursesLoadedCopyWithImpl<T, $Res>
    implements $CoursesLoadedCopyWith<T, $Res> {
  _$CoursesLoadedCopyWithImpl(this._self, this._then);

  final CoursesLoaded<T> _self;
  final $Res Function(CoursesLoaded<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? courses = null,
  }) {
    return _then(CoursesLoaded<T>(
      courses: null == courses
          ? _self._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<CourseInfoModel>,
    ));
  }
}

/// @nodoc

class CoursesLoadedError<T> implements HomeState<T> {
  const CoursesLoadedError({required this.error});

  final String error;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoursesLoadedErrorCopyWith<T, CoursesLoadedError<T>> get copyWith =>
      _$CoursesLoadedErrorCopyWithImpl<T, CoursesLoadedError<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoursesLoadedError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'HomeState<$T>.coursesLoadedError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $CoursesLoadedErrorCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $CoursesLoadedErrorCopyWith(CoursesLoadedError<T> value,
          $Res Function(CoursesLoadedError<T>) _then) =
      _$CoursesLoadedErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$CoursesLoadedErrorCopyWithImpl<T, $Res>
    implements $CoursesLoadedErrorCopyWith<T, $Res> {
  _$CoursesLoadedErrorCopyWithImpl(this._self, this._then);

  final CoursesLoadedError<T> _self;
  final $Res Function(CoursesLoadedError<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(CoursesLoadedError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GettingCoursesByCategory<T> implements HomeState<T> {
  const GettingCoursesByCategory();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GettingCoursesByCategory<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeState<$T>.gettingCoursesByCategory()';
  }
}

/// @nodoc

class CoursesByCategoryLoaded<T> implements HomeState<T> {
  const CoursesByCategoryLoaded({required final List<CourseInfoModel> courses})
      : _courses = courses;

  final List<CourseInfoModel> _courses;
  List<CourseInfoModel> get courses {
    if (_courses is EqualUnmodifiableListView) return _courses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courses);
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoursesByCategoryLoadedCopyWith<T, CoursesByCategoryLoaded<T>>
      get copyWith =>
          _$CoursesByCategoryLoadedCopyWithImpl<T, CoursesByCategoryLoaded<T>>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoursesByCategoryLoaded<T> &&
            const DeepCollectionEquality().equals(other._courses, _courses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_courses));

  @override
  String toString() {
    return 'HomeState<$T>.coursesByCategoryLoaded(courses: $courses)';
  }
}

/// @nodoc
abstract mixin class $CoursesByCategoryLoadedCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $CoursesByCategoryLoadedCopyWith(CoursesByCategoryLoaded<T> value,
          $Res Function(CoursesByCategoryLoaded<T>) _then) =
      _$CoursesByCategoryLoadedCopyWithImpl;
  @useResult
  $Res call({List<CourseInfoModel> courses});
}

/// @nodoc
class _$CoursesByCategoryLoadedCopyWithImpl<T, $Res>
    implements $CoursesByCategoryLoadedCopyWith<T, $Res> {
  _$CoursesByCategoryLoadedCopyWithImpl(this._self, this._then);

  final CoursesByCategoryLoaded<T> _self;
  final $Res Function(CoursesByCategoryLoaded<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? courses = null,
  }) {
    return _then(CoursesByCategoryLoaded<T>(
      courses: null == courses
          ? _self._courses
          : courses // ignore: cast_nullable_to_non_nullable
              as List<CourseInfoModel>,
    ));
  }
}

/// @nodoc

class CoursesByCategoryLoadedError<T> implements HomeState<T> {
  const CoursesByCategoryLoadedError({required this.error});

  final String error;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoursesByCategoryLoadedErrorCopyWith<T, CoursesByCategoryLoadedError<T>>
      get copyWith => _$CoursesByCategoryLoadedErrorCopyWithImpl<T,
          CoursesByCategoryLoadedError<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CoursesByCategoryLoadedError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'HomeState<$T>.coursesByCategoryLoadedError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $CoursesByCategoryLoadedErrorCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $CoursesByCategoryLoadedErrorCopyWith(
          CoursesByCategoryLoadedError<T> value,
          $Res Function(CoursesByCategoryLoadedError<T>) _then) =
      _$CoursesByCategoryLoadedErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$CoursesByCategoryLoadedErrorCopyWithImpl<T, $Res>
    implements $CoursesByCategoryLoadedErrorCopyWith<T, $Res> {
  _$CoursesByCategoryLoadedErrorCopyWithImpl(this._self, this._then);

  final CoursesByCategoryLoadedError<T> _self;
  final $Res Function(CoursesByCategoryLoadedError<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(CoursesByCategoryLoadedError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class WeeklyProgressLoaded<T> implements HomeState<T> {
  const WeeklyProgressLoaded({required final Map<String, int> data})
      : _data = data;

  final Map<String, int> _data;
  Map<String, int> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeeklyProgressLoadedCopyWith<T, WeeklyProgressLoaded<T>> get copyWith =>
      _$WeeklyProgressLoadedCopyWithImpl<T, WeeklyProgressLoaded<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeeklyProgressLoaded<T> &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'HomeState<$T>.weeklyProgressLoaded(data: $data)';
  }
}

/// @nodoc
abstract mixin class $WeeklyProgressLoadedCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $WeeklyProgressLoadedCopyWith(WeeklyProgressLoaded<T> value,
          $Res Function(WeeklyProgressLoaded<T>) _then) =
      _$WeeklyProgressLoadedCopyWithImpl;
  @useResult
  $Res call({Map<String, int> data});
}

/// @nodoc
class _$WeeklyProgressLoadedCopyWithImpl<T, $Res>
    implements $WeeklyProgressLoadedCopyWith<T, $Res> {
  _$WeeklyProgressLoadedCopyWithImpl(this._self, this._then);

  final WeeklyProgressLoaded<T> _self;
  final $Res Function(WeeklyProgressLoaded<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(WeeklyProgressLoaded<T>(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc

class WeeklyProgressError<T> implements HomeState<T> {
  const WeeklyProgressError({required this.error});

  final String error;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeeklyProgressErrorCopyWith<T, WeeklyProgressError<T>> get copyWith =>
      _$WeeklyProgressErrorCopyWithImpl<T, WeeklyProgressError<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeeklyProgressError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'HomeState<$T>.weeklyProgressError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $WeeklyProgressErrorCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $WeeklyProgressErrorCopyWith(WeeklyProgressError<T> value,
          $Res Function(WeeklyProgressError<T>) _then) =
      _$WeeklyProgressErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$WeeklyProgressErrorCopyWithImpl<T, $Res>
    implements $WeeklyProgressErrorCopyWith<T, $Res> {
  _$WeeklyProgressErrorCopyWithImpl(this._self, this._then);

  final WeeklyProgressError<T> _self;
  final $Res Function(WeeklyProgressError<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(WeeklyProgressError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class GettingCategories<T> implements HomeState<T> {
  const GettingCategories();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GettingCategories<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeState<$T>.gettingCategories()';
  }
}

/// @nodoc

class CategoriesLoaded<T> implements HomeState<T> {
  const CategoriesLoaded({required final List<CategoryModel> categories})
      : _categories = categories;

  final List<CategoryModel> _categories;
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoriesLoadedCopyWith<T, CategoriesLoaded<T>> get copyWith =>
      _$CategoriesLoadedCopyWithImpl<T, CategoriesLoaded<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoriesLoaded<T> &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'HomeState<$T>.categoriesLoaded(categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $CategoriesLoadedCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $CategoriesLoadedCopyWith(
          CategoriesLoaded<T> value, $Res Function(CategoriesLoaded<T>) _then) =
      _$CategoriesLoadedCopyWithImpl;
  @useResult
  $Res call({List<CategoryModel> categories});
}

/// @nodoc
class _$CategoriesLoadedCopyWithImpl<T, $Res>
    implements $CategoriesLoadedCopyWith<T, $Res> {
  _$CategoriesLoadedCopyWithImpl(this._self, this._then);

  final CategoriesLoaded<T> _self;
  final $Res Function(CategoriesLoaded<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categories = null,
  }) {
    return _then(CategoriesLoaded<T>(
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

class CategoriesLoadedError<T> implements HomeState<T> {
  const CategoriesLoadedError({required this.error});

  final String error;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoriesLoadedErrorCopyWith<T, CategoriesLoadedError<T>> get copyWith =>
      _$CategoriesLoadedErrorCopyWithImpl<T, CategoriesLoadedError<T>>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoriesLoadedError<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'HomeState<$T>.categoriesLoadedError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $CategoriesLoadedErrorCopyWith<T, $Res>
    implements $HomeStateCopyWith<T, $Res> {
  factory $CategoriesLoadedErrorCopyWith(CategoriesLoadedError<T> value,
          $Res Function(CategoriesLoadedError<T>) _then) =
      _$CategoriesLoadedErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$CategoriesLoadedErrorCopyWithImpl<T, $Res>
    implements $CategoriesLoadedErrorCopyWith<T, $Res> {
  _$CategoriesLoadedErrorCopyWithImpl(this._self, this._then);

  final CategoriesLoadedError<T> _self;
  final $Res Function(CategoriesLoadedError<T>) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(CategoriesLoadedError<T>(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
