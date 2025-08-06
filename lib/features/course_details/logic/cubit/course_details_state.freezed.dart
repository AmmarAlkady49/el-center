// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseDetailsState implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'CourseDetailsState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CourseDetailsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState()';
  }
}

/// @nodoc
class $CourseDetailsStateCopyWith<$Res> {
  $CourseDetailsStateCopyWith(
      CourseDetailsState _, $Res Function(CourseDetailsState) __);
}

/// Adds pattern-matching-related methods to [CourseDetailsState].
extension CourseDetailsStatePatterns on CourseDetailsState {
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
    TResult Function(_Initial value)? initial,
    TResult Function(CourseDetailsLoading value)? courseDetailsLoading,
    TResult Function(CourseDetailsLoaded value)? courseDetailsLoaded,
    TResult Function(CourseDetailsLoadedError value)? courseDetailsLoadedError,
    TResult Function(PaymentLoading value)? paymentLoading,
    TResult Function(PaymentSuccess value)? paymentSuccess,
    TResult Function(FreePaymentSuccess value)? freePaymentSuccess,
    TResult Function(PaymentFailure value)? paymentFailure,
    TResult Function(PaymentRedirectUrl value)? paymentRedirectUrl,
    TResult Function(CourseReviewLoading value)? courseReviewLoading,
    TResult Function(CourseReviewSuccess value)? courseReviewSuccess,
    TResult Function(CourseReviewFailure value)? courseReviewFailure,
    TResult Function(CouponLoading value)? couponLoading,
    TResult Function(CouponSuccess value)? couponSuccess,
    TResult Function(CouponFailure value)? couponFailure,
    TResult Function(EnrollmentLoading value)? enrollmentLoading,
    TResult Function(EnrollmentSuccess value)? enrollmentSuccess,
    TResult Function(EnrollmentFailure value)? enrollmentFailure,
    TResult Function(UpdateCourseReviewSuccess value)?
        updateCourseReviewSuccess,
    TResult Function(UpdateCourseReviewFailure value)?
        updateCourseReviewFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case CourseDetailsLoading() when courseDetailsLoading != null:
        return courseDetailsLoading(_that);
      case CourseDetailsLoaded() when courseDetailsLoaded != null:
        return courseDetailsLoaded(_that);
      case CourseDetailsLoadedError() when courseDetailsLoadedError != null:
        return courseDetailsLoadedError(_that);
      case PaymentLoading() when paymentLoading != null:
        return paymentLoading(_that);
      case PaymentSuccess() when paymentSuccess != null:
        return paymentSuccess(_that);
      case FreePaymentSuccess() when freePaymentSuccess != null:
        return freePaymentSuccess(_that);
      case PaymentFailure() when paymentFailure != null:
        return paymentFailure(_that);
      case PaymentRedirectUrl() when paymentRedirectUrl != null:
        return paymentRedirectUrl(_that);
      case CourseReviewLoading() when courseReviewLoading != null:
        return courseReviewLoading(_that);
      case CourseReviewSuccess() when courseReviewSuccess != null:
        return courseReviewSuccess(_that);
      case CourseReviewFailure() when courseReviewFailure != null:
        return courseReviewFailure(_that);
      case CouponLoading() when couponLoading != null:
        return couponLoading(_that);
      case CouponSuccess() when couponSuccess != null:
        return couponSuccess(_that);
      case CouponFailure() when couponFailure != null:
        return couponFailure(_that);
      case EnrollmentLoading() when enrollmentLoading != null:
        return enrollmentLoading(_that);
      case EnrollmentSuccess() when enrollmentSuccess != null:
        return enrollmentSuccess(_that);
      case EnrollmentFailure() when enrollmentFailure != null:
        return enrollmentFailure(_that);
      case UpdateCourseReviewSuccess() when updateCourseReviewSuccess != null:
        return updateCourseReviewSuccess(_that);
      case UpdateCourseReviewFailure() when updateCourseReviewFailure != null:
        return updateCourseReviewFailure(_that);
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
    required TResult Function(_Initial value) initial,
    required TResult Function(CourseDetailsLoading value) courseDetailsLoading,
    required TResult Function(CourseDetailsLoaded value) courseDetailsLoaded,
    required TResult Function(CourseDetailsLoadedError value)
        courseDetailsLoadedError,
    required TResult Function(PaymentLoading value) paymentLoading,
    required TResult Function(PaymentSuccess value) paymentSuccess,
    required TResult Function(FreePaymentSuccess value) freePaymentSuccess,
    required TResult Function(PaymentFailure value) paymentFailure,
    required TResult Function(PaymentRedirectUrl value) paymentRedirectUrl,
    required TResult Function(CourseReviewLoading value) courseReviewLoading,
    required TResult Function(CourseReviewSuccess value) courseReviewSuccess,
    required TResult Function(CourseReviewFailure value) courseReviewFailure,
    required TResult Function(CouponLoading value) couponLoading,
    required TResult Function(CouponSuccess value) couponSuccess,
    required TResult Function(CouponFailure value) couponFailure,
    required TResult Function(EnrollmentLoading value) enrollmentLoading,
    required TResult Function(EnrollmentSuccess value) enrollmentSuccess,
    required TResult Function(EnrollmentFailure value) enrollmentFailure,
    required TResult Function(UpdateCourseReviewSuccess value)
        updateCourseReviewSuccess,
    required TResult Function(UpdateCourseReviewFailure value)
        updateCourseReviewFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case CourseDetailsLoading():
        return courseDetailsLoading(_that);
      case CourseDetailsLoaded():
        return courseDetailsLoaded(_that);
      case CourseDetailsLoadedError():
        return courseDetailsLoadedError(_that);
      case PaymentLoading():
        return paymentLoading(_that);
      case PaymentSuccess():
        return paymentSuccess(_that);
      case FreePaymentSuccess():
        return freePaymentSuccess(_that);
      case PaymentFailure():
        return paymentFailure(_that);
      case PaymentRedirectUrl():
        return paymentRedirectUrl(_that);
      case CourseReviewLoading():
        return courseReviewLoading(_that);
      case CourseReviewSuccess():
        return courseReviewSuccess(_that);
      case CourseReviewFailure():
        return courseReviewFailure(_that);
      case CouponLoading():
        return couponLoading(_that);
      case CouponSuccess():
        return couponSuccess(_that);
      case CouponFailure():
        return couponFailure(_that);
      case EnrollmentLoading():
        return enrollmentLoading(_that);
      case EnrollmentSuccess():
        return enrollmentSuccess(_that);
      case EnrollmentFailure():
        return enrollmentFailure(_that);
      case UpdateCourseReviewSuccess():
        return updateCourseReviewSuccess(_that);
      case UpdateCourseReviewFailure():
        return updateCourseReviewFailure(_that);
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(CourseDetailsLoading value)? courseDetailsLoading,
    TResult? Function(CourseDetailsLoaded value)? courseDetailsLoaded,
    TResult? Function(CourseDetailsLoadedError value)? courseDetailsLoadedError,
    TResult? Function(PaymentLoading value)? paymentLoading,
    TResult? Function(PaymentSuccess value)? paymentSuccess,
    TResult? Function(FreePaymentSuccess value)? freePaymentSuccess,
    TResult? Function(PaymentFailure value)? paymentFailure,
    TResult? Function(PaymentRedirectUrl value)? paymentRedirectUrl,
    TResult? Function(CourseReviewLoading value)? courseReviewLoading,
    TResult? Function(CourseReviewSuccess value)? courseReviewSuccess,
    TResult? Function(CourseReviewFailure value)? courseReviewFailure,
    TResult? Function(CouponLoading value)? couponLoading,
    TResult? Function(CouponSuccess value)? couponSuccess,
    TResult? Function(CouponFailure value)? couponFailure,
    TResult? Function(EnrollmentLoading value)? enrollmentLoading,
    TResult? Function(EnrollmentSuccess value)? enrollmentSuccess,
    TResult? Function(EnrollmentFailure value)? enrollmentFailure,
    TResult? Function(UpdateCourseReviewSuccess value)?
        updateCourseReviewSuccess,
    TResult? Function(UpdateCourseReviewFailure value)?
        updateCourseReviewFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case CourseDetailsLoading() when courseDetailsLoading != null:
        return courseDetailsLoading(_that);
      case CourseDetailsLoaded() when courseDetailsLoaded != null:
        return courseDetailsLoaded(_that);
      case CourseDetailsLoadedError() when courseDetailsLoadedError != null:
        return courseDetailsLoadedError(_that);
      case PaymentLoading() when paymentLoading != null:
        return paymentLoading(_that);
      case PaymentSuccess() when paymentSuccess != null:
        return paymentSuccess(_that);
      case FreePaymentSuccess() when freePaymentSuccess != null:
        return freePaymentSuccess(_that);
      case PaymentFailure() when paymentFailure != null:
        return paymentFailure(_that);
      case PaymentRedirectUrl() when paymentRedirectUrl != null:
        return paymentRedirectUrl(_that);
      case CourseReviewLoading() when courseReviewLoading != null:
        return courseReviewLoading(_that);
      case CourseReviewSuccess() when courseReviewSuccess != null:
        return courseReviewSuccess(_that);
      case CourseReviewFailure() when courseReviewFailure != null:
        return courseReviewFailure(_that);
      case CouponLoading() when couponLoading != null:
        return couponLoading(_that);
      case CouponSuccess() when couponSuccess != null:
        return couponSuccess(_that);
      case CouponFailure() when couponFailure != null:
        return couponFailure(_that);
      case EnrollmentLoading() when enrollmentLoading != null:
        return enrollmentLoading(_that);
      case EnrollmentSuccess() when enrollmentSuccess != null:
        return enrollmentSuccess(_that);
      case EnrollmentFailure() when enrollmentFailure != null:
        return enrollmentFailure(_that);
      case UpdateCourseReviewSuccess() when updateCourseReviewSuccess != null:
        return updateCourseReviewSuccess(_that);
      case UpdateCourseReviewFailure() when updateCourseReviewFailure != null:
        return updateCourseReviewFailure(_that);
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
    TResult Function()? courseDetailsLoading,
    TResult Function(
            bool isEnrolled,
            List<CourseModuleModel> courseModules,
            List<CourseModulesWithLessons> modulesWithLessons,
            List<CourseReviewModel> courseReviews)?
        courseDetailsLoaded,
    TResult Function(String error)? courseDetailsLoadedError,
    TResult Function()? paymentLoading,
    TResult Function(Map<String, String> redirectData)? paymentSuccess,
    TResult Function(String message)? freePaymentSuccess,
    TResult Function(String error)? paymentFailure,
    TResult Function(String url)? paymentRedirectUrl,
    TResult Function()? courseReviewLoading,
    TResult Function(String review)? courseReviewSuccess,
    TResult Function(String error)? courseReviewFailure,
    TResult Function()? couponLoading,
    TResult Function(String returnFinalPrice)? couponSuccess,
    TResult Function(String error)? couponFailure,
    TResult Function()? enrollmentLoading,
    TResult Function(String message)? enrollmentSuccess,
    TResult Function(String error)? enrollmentFailure,
    TResult Function(String message)? updateCourseReviewSuccess,
    TResult Function(String error)? updateCourseReviewFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case CourseDetailsLoading() when courseDetailsLoading != null:
        return courseDetailsLoading();
      case CourseDetailsLoaded() when courseDetailsLoaded != null:
        return courseDetailsLoaded(_that.isEnrolled, _that.courseModules,
            _that.modulesWithLessons, _that.courseReviews);
      case CourseDetailsLoadedError() when courseDetailsLoadedError != null:
        return courseDetailsLoadedError(_that.error);
      case PaymentLoading() when paymentLoading != null:
        return paymentLoading();
      case PaymentSuccess() when paymentSuccess != null:
        return paymentSuccess(_that.redirectData);
      case FreePaymentSuccess() when freePaymentSuccess != null:
        return freePaymentSuccess(_that.message);
      case PaymentFailure() when paymentFailure != null:
        return paymentFailure(_that.error);
      case PaymentRedirectUrl() when paymentRedirectUrl != null:
        return paymentRedirectUrl(_that.url);
      case CourseReviewLoading() when courseReviewLoading != null:
        return courseReviewLoading();
      case CourseReviewSuccess() when courseReviewSuccess != null:
        return courseReviewSuccess(_that.review);
      case CourseReviewFailure() when courseReviewFailure != null:
        return courseReviewFailure(_that.error);
      case CouponLoading() when couponLoading != null:
        return couponLoading();
      case CouponSuccess() when couponSuccess != null:
        return couponSuccess(_that.returnFinalPrice);
      case CouponFailure() when couponFailure != null:
        return couponFailure(_that.error);
      case EnrollmentLoading() when enrollmentLoading != null:
        return enrollmentLoading();
      case EnrollmentSuccess() when enrollmentSuccess != null:
        return enrollmentSuccess(_that.message);
      case EnrollmentFailure() when enrollmentFailure != null:
        return enrollmentFailure(_that.error);
      case UpdateCourseReviewSuccess() when updateCourseReviewSuccess != null:
        return updateCourseReviewSuccess(_that.message);
      case UpdateCourseReviewFailure() when updateCourseReviewFailure != null:
        return updateCourseReviewFailure(_that.error);
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
    required TResult Function() courseDetailsLoading,
    required TResult Function(
            bool isEnrolled,
            List<CourseModuleModel> courseModules,
            List<CourseModulesWithLessons> modulesWithLessons,
            List<CourseReviewModel> courseReviews)
        courseDetailsLoaded,
    required TResult Function(String error) courseDetailsLoadedError,
    required TResult Function() paymentLoading,
    required TResult Function(Map<String, String> redirectData) paymentSuccess,
    required TResult Function(String message) freePaymentSuccess,
    required TResult Function(String error) paymentFailure,
    required TResult Function(String url) paymentRedirectUrl,
    required TResult Function() courseReviewLoading,
    required TResult Function(String review) courseReviewSuccess,
    required TResult Function(String error) courseReviewFailure,
    required TResult Function() couponLoading,
    required TResult Function(String returnFinalPrice) couponSuccess,
    required TResult Function(String error) couponFailure,
    required TResult Function() enrollmentLoading,
    required TResult Function(String message) enrollmentSuccess,
    required TResult Function(String error) enrollmentFailure,
    required TResult Function(String message) updateCourseReviewSuccess,
    required TResult Function(String error) updateCourseReviewFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case CourseDetailsLoading():
        return courseDetailsLoading();
      case CourseDetailsLoaded():
        return courseDetailsLoaded(_that.isEnrolled, _that.courseModules,
            _that.modulesWithLessons, _that.courseReviews);
      case CourseDetailsLoadedError():
        return courseDetailsLoadedError(_that.error);
      case PaymentLoading():
        return paymentLoading();
      case PaymentSuccess():
        return paymentSuccess(_that.redirectData);
      case FreePaymentSuccess():
        return freePaymentSuccess(_that.message);
      case PaymentFailure():
        return paymentFailure(_that.error);
      case PaymentRedirectUrl():
        return paymentRedirectUrl(_that.url);
      case CourseReviewLoading():
        return courseReviewLoading();
      case CourseReviewSuccess():
        return courseReviewSuccess(_that.review);
      case CourseReviewFailure():
        return courseReviewFailure(_that.error);
      case CouponLoading():
        return couponLoading();
      case CouponSuccess():
        return couponSuccess(_that.returnFinalPrice);
      case CouponFailure():
        return couponFailure(_that.error);
      case EnrollmentLoading():
        return enrollmentLoading();
      case EnrollmentSuccess():
        return enrollmentSuccess(_that.message);
      case EnrollmentFailure():
        return enrollmentFailure(_that.error);
      case UpdateCourseReviewSuccess():
        return updateCourseReviewSuccess(_that.message);
      case UpdateCourseReviewFailure():
        return updateCourseReviewFailure(_that.error);
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
    TResult? Function()? courseDetailsLoading,
    TResult? Function(
            bool isEnrolled,
            List<CourseModuleModel> courseModules,
            List<CourseModulesWithLessons> modulesWithLessons,
            List<CourseReviewModel> courseReviews)?
        courseDetailsLoaded,
    TResult? Function(String error)? courseDetailsLoadedError,
    TResult? Function()? paymentLoading,
    TResult? Function(Map<String, String> redirectData)? paymentSuccess,
    TResult? Function(String message)? freePaymentSuccess,
    TResult? Function(String error)? paymentFailure,
    TResult? Function(String url)? paymentRedirectUrl,
    TResult? Function()? courseReviewLoading,
    TResult? Function(String review)? courseReviewSuccess,
    TResult? Function(String error)? courseReviewFailure,
    TResult? Function()? couponLoading,
    TResult? Function(String returnFinalPrice)? couponSuccess,
    TResult? Function(String error)? couponFailure,
    TResult? Function()? enrollmentLoading,
    TResult? Function(String message)? enrollmentSuccess,
    TResult? Function(String error)? enrollmentFailure,
    TResult? Function(String message)? updateCourseReviewSuccess,
    TResult? Function(String error)? updateCourseReviewFailure,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case CourseDetailsLoading() when courseDetailsLoading != null:
        return courseDetailsLoading();
      case CourseDetailsLoaded() when courseDetailsLoaded != null:
        return courseDetailsLoaded(_that.isEnrolled, _that.courseModules,
            _that.modulesWithLessons, _that.courseReviews);
      case CourseDetailsLoadedError() when courseDetailsLoadedError != null:
        return courseDetailsLoadedError(_that.error);
      case PaymentLoading() when paymentLoading != null:
        return paymentLoading();
      case PaymentSuccess() when paymentSuccess != null:
        return paymentSuccess(_that.redirectData);
      case FreePaymentSuccess() when freePaymentSuccess != null:
        return freePaymentSuccess(_that.message);
      case PaymentFailure() when paymentFailure != null:
        return paymentFailure(_that.error);
      case PaymentRedirectUrl() when paymentRedirectUrl != null:
        return paymentRedirectUrl(_that.url);
      case CourseReviewLoading() when courseReviewLoading != null:
        return courseReviewLoading();
      case CourseReviewSuccess() when courseReviewSuccess != null:
        return courseReviewSuccess(_that.review);
      case CourseReviewFailure() when courseReviewFailure != null:
        return courseReviewFailure(_that.error);
      case CouponLoading() when couponLoading != null:
        return couponLoading();
      case CouponSuccess() when couponSuccess != null:
        return couponSuccess(_that.returnFinalPrice);
      case CouponFailure() when couponFailure != null:
        return couponFailure(_that.error);
      case EnrollmentLoading() when enrollmentLoading != null:
        return enrollmentLoading();
      case EnrollmentSuccess() when enrollmentSuccess != null:
        return enrollmentSuccess(_that.message);
      case EnrollmentFailure() when enrollmentFailure != null:
        return enrollmentFailure(_that.error);
      case UpdateCourseReviewSuccess() when updateCourseReviewSuccess != null:
        return updateCourseReviewSuccess(_that.message);
      case UpdateCourseReviewFailure() when updateCourseReviewFailure != null:
        return updateCourseReviewFailure(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial with DiagnosticableTreeMixin implements CourseDetailsState {
  const _Initial();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'CourseDetailsState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.initial()';
  }
}

/// @nodoc

class CourseDetailsLoading
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const CourseDetailsLoading();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty(
          'type', 'CourseDetailsState.courseDetailsLoading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CourseDetailsLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.courseDetailsLoading()';
  }
}

/// @nodoc

class CourseDetailsLoaded
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const CourseDetailsLoaded(
      {required this.isEnrolled,
      required final List<CourseModuleModel> courseModules,
      required final List<CourseModulesWithLessons> modulesWithLessons,
      required final List<CourseReviewModel> courseReviews})
      : _courseModules = courseModules,
        _modulesWithLessons = modulesWithLessons,
        _courseReviews = courseReviews;

  final bool isEnrolled;
  final List<CourseModuleModel> _courseModules;
  List<CourseModuleModel> get courseModules {
    if (_courseModules is EqualUnmodifiableListView) return _courseModules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courseModules);
  }

  final List<CourseModulesWithLessons> _modulesWithLessons;
  List<CourseModulesWithLessons> get modulesWithLessons {
    if (_modulesWithLessons is EqualUnmodifiableListView)
      return _modulesWithLessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modulesWithLessons);
  }

  final List<CourseReviewModel> _courseReviews;
  List<CourseReviewModel> get courseReviews {
    if (_courseReviews is EqualUnmodifiableListView) return _courseReviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_courseReviews);
  }

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseDetailsLoadedCopyWith<CourseDetailsLoaded> get copyWith =>
      _$CourseDetailsLoadedCopyWithImpl<CourseDetailsLoaded>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'CourseDetailsState.courseDetailsLoaded'))
      ..add(DiagnosticsProperty('isEnrolled', isEnrolled))
      ..add(DiagnosticsProperty('courseModules', courseModules))
      ..add(DiagnosticsProperty('modulesWithLessons', modulesWithLessons))
      ..add(DiagnosticsProperty('courseReviews', courseReviews));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseDetailsLoaded &&
            (identical(other.isEnrolled, isEnrolled) ||
                other.isEnrolled == isEnrolled) &&
            const DeepCollectionEquality()
                .equals(other._courseModules, _courseModules) &&
            const DeepCollectionEquality()
                .equals(other._modulesWithLessons, _modulesWithLessons) &&
            const DeepCollectionEquality()
                .equals(other._courseReviews, _courseReviews));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isEnrolled,
      const DeepCollectionEquality().hash(_courseModules),
      const DeepCollectionEquality().hash(_modulesWithLessons),
      const DeepCollectionEquality().hash(_courseReviews));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.courseDetailsLoaded(isEnrolled: $isEnrolled, courseModules: $courseModules, modulesWithLessons: $modulesWithLessons, courseReviews: $courseReviews)';
  }
}

/// @nodoc
abstract mixin class $CourseDetailsLoadedCopyWith<$Res>
    implements $CourseDetailsStateCopyWith<$Res> {
  factory $CourseDetailsLoadedCopyWith(
          CourseDetailsLoaded value, $Res Function(CourseDetailsLoaded) _then) =
      _$CourseDetailsLoadedCopyWithImpl;
  @useResult
  $Res call(
      {bool isEnrolled,
      List<CourseModuleModel> courseModules,
      List<CourseModulesWithLessons> modulesWithLessons,
      List<CourseReviewModel> courseReviews});
}

/// @nodoc
class _$CourseDetailsLoadedCopyWithImpl<$Res>
    implements $CourseDetailsLoadedCopyWith<$Res> {
  _$CourseDetailsLoadedCopyWithImpl(this._self, this._then);

  final CourseDetailsLoaded _self;
  final $Res Function(CourseDetailsLoaded) _then;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isEnrolled = null,
    Object? courseModules = null,
    Object? modulesWithLessons = null,
    Object? courseReviews = null,
  }) {
    return _then(CourseDetailsLoaded(
      isEnrolled: null == isEnrolled
          ? _self.isEnrolled
          : isEnrolled // ignore: cast_nullable_to_non_nullable
              as bool,
      courseModules: null == courseModules
          ? _self._courseModules
          : courseModules // ignore: cast_nullable_to_non_nullable
              as List<CourseModuleModel>,
      modulesWithLessons: null == modulesWithLessons
          ? _self._modulesWithLessons
          : modulesWithLessons // ignore: cast_nullable_to_non_nullable
              as List<CourseModulesWithLessons>,
      courseReviews: null == courseReviews
          ? _self._courseReviews
          : courseReviews // ignore: cast_nullable_to_non_nullable
              as List<CourseReviewModel>,
    ));
  }
}

/// @nodoc

class CourseDetailsLoadedError
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const CourseDetailsLoadedError({required this.error});

  final String error;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseDetailsLoadedErrorCopyWith<CourseDetailsLoadedError> get copyWith =>
      _$CourseDetailsLoadedErrorCopyWithImpl<CourseDetailsLoadedError>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty(
          'type', 'CourseDetailsState.courseDetailsLoadedError'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseDetailsLoadedError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.courseDetailsLoadedError(error: $error)';
  }
}

/// @nodoc
abstract mixin class $CourseDetailsLoadedErrorCopyWith<$Res>
    implements $CourseDetailsStateCopyWith<$Res> {
  factory $CourseDetailsLoadedErrorCopyWith(CourseDetailsLoadedError value,
          $Res Function(CourseDetailsLoadedError) _then) =
      _$CourseDetailsLoadedErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$CourseDetailsLoadedErrorCopyWithImpl<$Res>
    implements $CourseDetailsLoadedErrorCopyWith<$Res> {
  _$CourseDetailsLoadedErrorCopyWithImpl(this._self, this._then);

  final CourseDetailsLoadedError _self;
  final $Res Function(CourseDetailsLoadedError) _then;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(CourseDetailsLoadedError(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class PaymentLoading
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const PaymentLoading();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CourseDetailsState.paymentLoading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PaymentLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.paymentLoading()';
  }
}

/// @nodoc

class PaymentSuccess
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const PaymentSuccess(final Map<String, String> redirectData)
      : _redirectData = redirectData;

  final Map<String, String> _redirectData;
  Map<String, String> get redirectData {
    if (_redirectData is EqualUnmodifiableMapView) return _redirectData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_redirectData);
  }

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentSuccessCopyWith<PaymentSuccess> get copyWith =>
      _$PaymentSuccessCopyWithImpl<PaymentSuccess>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CourseDetailsState.paymentSuccess'))
      ..add(DiagnosticsProperty('redirectData', redirectData));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentSuccess &&
            const DeepCollectionEquality()
                .equals(other._redirectData, _redirectData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_redirectData));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.paymentSuccess(redirectData: $redirectData)';
  }
}

/// @nodoc
abstract mixin class $PaymentSuccessCopyWith<$Res>
    implements $CourseDetailsStateCopyWith<$Res> {
  factory $PaymentSuccessCopyWith(
          PaymentSuccess value, $Res Function(PaymentSuccess) _then) =
      _$PaymentSuccessCopyWithImpl;
  @useResult
  $Res call({Map<String, String> redirectData});
}

/// @nodoc
class _$PaymentSuccessCopyWithImpl<$Res>
    implements $PaymentSuccessCopyWith<$Res> {
  _$PaymentSuccessCopyWithImpl(this._self, this._then);

  final PaymentSuccess _self;
  final $Res Function(PaymentSuccess) _then;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? redirectData = null,
  }) {
    return _then(PaymentSuccess(
      null == redirectData
          ? _self._redirectData
          : redirectData // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class FreePaymentSuccess
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const FreePaymentSuccess({required this.message});

  final String message;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FreePaymentSuccessCopyWith<FreePaymentSuccess> get copyWith =>
      _$FreePaymentSuccessCopyWithImpl<FreePaymentSuccess>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'CourseDetailsState.freePaymentSuccess'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FreePaymentSuccess &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.freePaymentSuccess(message: $message)';
  }
}

/// @nodoc
abstract mixin class $FreePaymentSuccessCopyWith<$Res>
    implements $CourseDetailsStateCopyWith<$Res> {
  factory $FreePaymentSuccessCopyWith(
          FreePaymentSuccess value, $Res Function(FreePaymentSuccess) _then) =
      _$FreePaymentSuccessCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FreePaymentSuccessCopyWithImpl<$Res>
    implements $FreePaymentSuccessCopyWith<$Res> {
  _$FreePaymentSuccessCopyWithImpl(this._self, this._then);

  final FreePaymentSuccess _self;
  final $Res Function(FreePaymentSuccess) _then;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(FreePaymentSuccess(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class PaymentFailure
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const PaymentFailure({required this.error});

  final String error;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentFailureCopyWith<PaymentFailure> get copyWith =>
      _$PaymentFailureCopyWithImpl<PaymentFailure>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CourseDetailsState.paymentFailure'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.paymentFailure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $PaymentFailureCopyWith<$Res>
    implements $CourseDetailsStateCopyWith<$Res> {
  factory $PaymentFailureCopyWith(
          PaymentFailure value, $Res Function(PaymentFailure) _then) =
      _$PaymentFailureCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$PaymentFailureCopyWithImpl<$Res>
    implements $PaymentFailureCopyWith<$Res> {
  _$PaymentFailureCopyWithImpl(this._self, this._then);

  final PaymentFailure _self;
  final $Res Function(PaymentFailure) _then;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(PaymentFailure(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class PaymentRedirectUrl
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const PaymentRedirectUrl(this.url);

  final String url;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentRedirectUrlCopyWith<PaymentRedirectUrl> get copyWith =>
      _$PaymentRedirectUrlCopyWithImpl<PaymentRedirectUrl>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'CourseDetailsState.paymentRedirectUrl'))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentRedirectUrl &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.paymentRedirectUrl(url: $url)';
  }
}

/// @nodoc
abstract mixin class $PaymentRedirectUrlCopyWith<$Res>
    implements $CourseDetailsStateCopyWith<$Res> {
  factory $PaymentRedirectUrlCopyWith(
          PaymentRedirectUrl value, $Res Function(PaymentRedirectUrl) _then) =
      _$PaymentRedirectUrlCopyWithImpl;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$PaymentRedirectUrlCopyWithImpl<$Res>
    implements $PaymentRedirectUrlCopyWith<$Res> {
  _$PaymentRedirectUrlCopyWithImpl(this._self, this._then);

  final PaymentRedirectUrl _self;
  final $Res Function(PaymentRedirectUrl) _then;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? url = null,
  }) {
    return _then(PaymentRedirectUrl(
      null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CourseReviewLoading
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const CourseReviewLoading();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty(
          'type', 'CourseDetailsState.courseReviewLoading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CourseReviewLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.courseReviewLoading()';
  }
}

/// @nodoc

class CourseReviewSuccess
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const CourseReviewSuccess(this.review);

  final String review;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseReviewSuccessCopyWith<CourseReviewSuccess> get copyWith =>
      _$CourseReviewSuccessCopyWithImpl<CourseReviewSuccess>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'CourseDetailsState.courseReviewSuccess'))
      ..add(DiagnosticsProperty('review', review));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseReviewSuccess &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode => Object.hash(runtimeType, review);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.courseReviewSuccess(review: $review)';
  }
}

/// @nodoc
abstract mixin class $CourseReviewSuccessCopyWith<$Res>
    implements $CourseDetailsStateCopyWith<$Res> {
  factory $CourseReviewSuccessCopyWith(
          CourseReviewSuccess value, $Res Function(CourseReviewSuccess) _then) =
      _$CourseReviewSuccessCopyWithImpl;
  @useResult
  $Res call({String review});
}

/// @nodoc
class _$CourseReviewSuccessCopyWithImpl<$Res>
    implements $CourseReviewSuccessCopyWith<$Res> {
  _$CourseReviewSuccessCopyWithImpl(this._self, this._then);

  final CourseReviewSuccess _self;
  final $Res Function(CourseReviewSuccess) _then;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? review = null,
  }) {
    return _then(CourseReviewSuccess(
      null == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CourseReviewFailure
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const CourseReviewFailure({required this.error});

  final String error;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CourseReviewFailureCopyWith<CourseReviewFailure> get copyWith =>
      _$CourseReviewFailureCopyWithImpl<CourseReviewFailure>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'CourseDetailsState.courseReviewFailure'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CourseReviewFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.courseReviewFailure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $CourseReviewFailureCopyWith<$Res>
    implements $CourseDetailsStateCopyWith<$Res> {
  factory $CourseReviewFailureCopyWith(
          CourseReviewFailure value, $Res Function(CourseReviewFailure) _then) =
      _$CourseReviewFailureCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$CourseReviewFailureCopyWithImpl<$Res>
    implements $CourseReviewFailureCopyWith<$Res> {
  _$CourseReviewFailureCopyWithImpl(this._self, this._then);

  final CourseReviewFailure _self;
  final $Res Function(CourseReviewFailure) _then;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(CourseReviewFailure(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CouponLoading with DiagnosticableTreeMixin implements CourseDetailsState {
  const CouponLoading();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CourseDetailsState.couponLoading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CouponLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.couponLoading()';
  }
}

/// @nodoc

class CouponSuccess with DiagnosticableTreeMixin implements CourseDetailsState {
  const CouponSuccess(this.returnFinalPrice);

  final String returnFinalPrice;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CouponSuccessCopyWith<CouponSuccess> get copyWith =>
      _$CouponSuccessCopyWithImpl<CouponSuccess>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CourseDetailsState.couponSuccess'))
      ..add(DiagnosticsProperty('returnFinalPrice', returnFinalPrice));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CouponSuccess &&
            (identical(other.returnFinalPrice, returnFinalPrice) ||
                other.returnFinalPrice == returnFinalPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, returnFinalPrice);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.couponSuccess(returnFinalPrice: $returnFinalPrice)';
  }
}

/// @nodoc
abstract mixin class $CouponSuccessCopyWith<$Res>
    implements $CourseDetailsStateCopyWith<$Res> {
  factory $CouponSuccessCopyWith(
          CouponSuccess value, $Res Function(CouponSuccess) _then) =
      _$CouponSuccessCopyWithImpl;
  @useResult
  $Res call({String returnFinalPrice});
}

/// @nodoc
class _$CouponSuccessCopyWithImpl<$Res>
    implements $CouponSuccessCopyWith<$Res> {
  _$CouponSuccessCopyWithImpl(this._self, this._then);

  final CouponSuccess _self;
  final $Res Function(CouponSuccess) _then;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? returnFinalPrice = null,
  }) {
    return _then(CouponSuccess(
      null == returnFinalPrice
          ? _self.returnFinalPrice
          : returnFinalPrice // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class CouponFailure with DiagnosticableTreeMixin implements CourseDetailsState {
  const CouponFailure({required this.error});

  final String error;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CouponFailureCopyWith<CouponFailure> get copyWith =>
      _$CouponFailureCopyWithImpl<CouponFailure>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CourseDetailsState.couponFailure'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CouponFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.couponFailure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $CouponFailureCopyWith<$Res>
    implements $CourseDetailsStateCopyWith<$Res> {
  factory $CouponFailureCopyWith(
          CouponFailure value, $Res Function(CouponFailure) _then) =
      _$CouponFailureCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$CouponFailureCopyWithImpl<$Res>
    implements $CouponFailureCopyWith<$Res> {
  _$CouponFailureCopyWithImpl(this._self, this._then);

  final CouponFailure _self;
  final $Res Function(CouponFailure) _then;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(CouponFailure(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class EnrollmentLoading
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const EnrollmentLoading();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(
          DiagnosticsProperty('type', 'CourseDetailsState.enrollmentLoading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EnrollmentLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.enrollmentLoading()';
  }
}

/// @nodoc

class EnrollmentSuccess
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const EnrollmentSuccess(this.message);

  final String message;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EnrollmentSuccessCopyWith<EnrollmentSuccess> get copyWith =>
      _$EnrollmentSuccessCopyWithImpl<EnrollmentSuccess>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CourseDetailsState.enrollmentSuccess'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EnrollmentSuccess &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.enrollmentSuccess(message: $message)';
  }
}

/// @nodoc
abstract mixin class $EnrollmentSuccessCopyWith<$Res>
    implements $CourseDetailsStateCopyWith<$Res> {
  factory $EnrollmentSuccessCopyWith(
          EnrollmentSuccess value, $Res Function(EnrollmentSuccess) _then) =
      _$EnrollmentSuccessCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$EnrollmentSuccessCopyWithImpl<$Res>
    implements $EnrollmentSuccessCopyWith<$Res> {
  _$EnrollmentSuccessCopyWithImpl(this._self, this._then);

  final EnrollmentSuccess _self;
  final $Res Function(EnrollmentSuccess) _then;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(EnrollmentSuccess(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class EnrollmentFailure
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const EnrollmentFailure({required this.error});

  final String error;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EnrollmentFailureCopyWith<EnrollmentFailure> get copyWith =>
      _$EnrollmentFailureCopyWithImpl<EnrollmentFailure>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'CourseDetailsState.enrollmentFailure'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EnrollmentFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.enrollmentFailure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $EnrollmentFailureCopyWith<$Res>
    implements $CourseDetailsStateCopyWith<$Res> {
  factory $EnrollmentFailureCopyWith(
          EnrollmentFailure value, $Res Function(EnrollmentFailure) _then) =
      _$EnrollmentFailureCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$EnrollmentFailureCopyWithImpl<$Res>
    implements $EnrollmentFailureCopyWith<$Res> {
  _$EnrollmentFailureCopyWithImpl(this._self, this._then);

  final EnrollmentFailure _self;
  final $Res Function(EnrollmentFailure) _then;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(EnrollmentFailure(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UpdateCourseReviewSuccess
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const UpdateCourseReviewSuccess(this.message);

  final String message;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateCourseReviewSuccessCopyWith<UpdateCourseReviewSuccess> get copyWith =>
      _$UpdateCourseReviewSuccessCopyWithImpl<UpdateCourseReviewSuccess>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty(
          'type', 'CourseDetailsState.updateCourseReviewSuccess'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateCourseReviewSuccess &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.updateCourseReviewSuccess(message: $message)';
  }
}

/// @nodoc
abstract mixin class $UpdateCourseReviewSuccessCopyWith<$Res>
    implements $CourseDetailsStateCopyWith<$Res> {
  factory $UpdateCourseReviewSuccessCopyWith(UpdateCourseReviewSuccess value,
          $Res Function(UpdateCourseReviewSuccess) _then) =
      _$UpdateCourseReviewSuccessCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$UpdateCourseReviewSuccessCopyWithImpl<$Res>
    implements $UpdateCourseReviewSuccessCopyWith<$Res> {
  _$UpdateCourseReviewSuccessCopyWithImpl(this._self, this._then);

  final UpdateCourseReviewSuccess _self;
  final $Res Function(UpdateCourseReviewSuccess) _then;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(UpdateCourseReviewSuccess(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class UpdateCourseReviewFailure
    with DiagnosticableTreeMixin
    implements CourseDetailsState {
  const UpdateCourseReviewFailure({required this.error});

  final String error;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateCourseReviewFailureCopyWith<UpdateCourseReviewFailure> get copyWith =>
      _$UpdateCourseReviewFailureCopyWithImpl<UpdateCourseReviewFailure>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty(
          'type', 'CourseDetailsState.updateCourseReviewFailure'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateCourseReviewFailure &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CourseDetailsState.updateCourseReviewFailure(error: $error)';
  }
}

/// @nodoc
abstract mixin class $UpdateCourseReviewFailureCopyWith<$Res>
    implements $CourseDetailsStateCopyWith<$Res> {
  factory $UpdateCourseReviewFailureCopyWith(UpdateCourseReviewFailure value,
          $Res Function(UpdateCourseReviewFailure) _then) =
      _$UpdateCourseReviewFailureCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class _$UpdateCourseReviewFailureCopyWithImpl<$Res>
    implements $UpdateCourseReviewFailureCopyWith<$Res> {
  _$UpdateCourseReviewFailureCopyWithImpl(this._self, this._then);

  final UpdateCourseReviewFailure _self;
  final $Res Function(UpdateCourseReviewFailure) _then;

  /// Create a copy of CourseDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(UpdateCourseReviewFailure(
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
