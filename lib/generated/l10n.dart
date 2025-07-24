// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Online Study is the`
  String get onboarding_thinTitle1 {
    return Intl.message(
      'Online Study is the',
      name: 'onboarding_thinTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Best platform for both`
  String get onboarding_thinTitle2 {
    return Intl.message(
      'Best platform for both',
      name: 'onboarding_thinTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Learn Anytime,`
  String get onboarding_thinTitle3 {
    return Intl.message(
      'Learn Anytime,',
      name: 'onboarding_thinTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Best choice for`
  String get onboarding_boldTitle1 {
    return Intl.message(
      'Best choice for',
      name: 'onboarding_boldTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Teachers & Learners`
  String get onboarding_boldTitle2 {
    return Intl.message(
      'Teachers & Learners',
      name: 'onboarding_boldTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Anywhere. Accelerate`
  String get onboarding_boldTitle3 {
    return Intl.message(
      'Anywhere. Accelerate',
      name: 'onboarding_boldTitle3',
      desc: '',
      args: [],
    );
  }

  /// `everyone.`
  String get onboarding_highlightedTitle1 {
    return Intl.message(
      'everyone.',
      name: 'onboarding_highlightedTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Teachers & Learners.`
  String get onboarding_highlightedTitle2 {
    return Intl.message(
      'Teachers & Learners.',
      name: 'onboarding_highlightedTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Your Future and beyond..`
  String get onboarding_highlightedTitle3 {
    return Intl.message(
      'Your Future and beyond..',
      name: 'onboarding_highlightedTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Start learning!`
  String get startLearning {
    return Intl.message(
      'Start learning!',
      name: 'startLearning',
      desc: '',
      args: [],
    );
  }

  /// `ع`
  String get changeLanguage {
    return Intl.message('ع', name: 'changeLanguage', desc: '', args: []);
  }

  /// `Sign in to your \nAccount`
  String get signinToYourAccount {
    return Intl.message(
      'Sign in to your \nAccount',
      name: 'signinToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signup {
    return Intl.message('Sign up', name: 'signup', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Type your email`
  String get typeYourEmail {
    return Intl.message(
      'Type your email',
      name: 'typeYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Type your password`
  String get typeYourPassword {
    return Intl.message(
      'Type your password',
      name: 'typeYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Sign in`
  String get signin {
    return Intl.message('Sign in', name: 'signin', desc: '', args: []);
  }

  /// `Or login with`
  String get orLoginWith {
    return Intl.message(
      'Or login with',
      name: 'orLoginWith',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please enter your email',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get pleaseEnterYourPassword {
    return Intl.message(
      'Please enter your password',
      name: 'pleaseEnterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get pleaseEnterAvalidEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'pleaseEnterAvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid password`
  String get pleaseEnterAvalidPassword {
    return Intl.message(
      'Please enter a valid password',
      name: 'pleaseEnterAvalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Type your first name`
  String get typeYourFirstName {
    return Intl.message(
      'Type your first name',
      name: 'typeYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Type your last name`
  String get typeYourLastName {
    return Intl.message(
      'Type your last name',
      name: 'typeYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get selectCountry {
    return Intl.message(
      'Select Country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `No country found`
  String get noCountryFound {
    return Intl.message(
      'No country found',
      name: 'noCountryFound',
      desc: '',
      args: [],
    );
  }

  /// `Student`
  String get student {
    return Intl.message('Student', name: 'student', desc: '', args: []);
  }

  /// `Teacher`
  String get teacher {
    return Intl.message('Teacher', name: 'teacher', desc: '', args: []);
  }

  /// `Please enter your phone number`
  String get pleaseEnterYourPhoneNumber {
    return Intl.message(
      'Please enter your phone number',
      name: 'pleaseEnterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get pleaseEnterAvalidPhoneNumber {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'pleaseEnterAvalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your first name`
  String get pleaseEnterYourFirstName {
    return Intl.message(
      'Please enter your first name',
      name: 'pleaseEnterYourFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get pleaseEnterYourLastName {
    return Intl.message(
      'Please enter your last name',
      name: 'pleaseEnterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your confirm password`
  String get pleaseEnterYourConfirmPassword {
    return Intl.message(
      'Please enter your confirm password',
      name: 'pleaseEnterYourConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Password too weak`
  String get passwordTooWeak {
    return Intl.message(
      'Password too weak',
      name: 'passwordTooWeak',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message('Try again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Email Verification`
  String get emailVerification {
    return Intl.message(
      'Email Verification',
      name: 'emailVerification',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email to verify your account`
  String get emailVerificationMessage {
    return Intl.message(
      'Please check your email to verify your account',
      name: 'emailVerificationMessage',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `OTP Verification`
  String get otpVerification {
    return Intl.message(
      'OTP Verification',
      name: 'otpVerification',
      desc: '',
      args: [],
    );
  }

  /// `Enter the OTP sent to `
  String get otpVerificationMessage {
    return Intl.message(
      'Enter the OTP sent to ',
      name: 'otpVerificationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP`
  String get resendOTP {
    return Intl.message('Resend OTP', name: 'resendOTP', desc: '', args: []);
  }

  /// `Verified`
  String get verified {
    return Intl.message('Verified', name: 'verified', desc: '', args: []);
  }

  /// `Your account has been verified successfully`
  String get verifiedMessage {
    return Intl.message(
      'Your account has been verified successfully',
      name: 'verifiedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Verification failed`
  String get verificationFailed {
    return Intl.message(
      'Verification failed',
      name: 'verificationFailed',
      desc: '',
      args: [],
    );
  }

  /// `The verification code is incorrect, please try again.`
  String get verificationFailedMessage {
    return Intl.message(
      'The verification code is incorrect, please try again.',
      name: 'verificationFailedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Resend`
  String get resend {
    return Intl.message('Resend', name: 'resend', desc: '', args: []);
  }

  /// `Please enter OTP code`
  String get pleaseEnterOtpCode {
    return Intl.message(
      'Please enter OTP code',
      name: 'pleaseEnterOtpCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid OTP code`
  String get pleaseEnterAvalidOtpCode {
    return Intl.message(
      'Please enter a valid OTP code',
      name: 'pleaseEnterAvalidOtpCode',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive code?`
  String get didnotReceiveCode {
    return Intl.message(
      'Didn\'t receive code?',
      name: 'didnotReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning`
  String get good_morning {
    return Intl.message(
      'Good Morning',
      name: 'good_morning',
      desc: '',
      args: [],
    );
  }

  /// `Good Afternoon`
  String get good_afternoon {
    return Intl.message(
      'Good Afternoon',
      name: 'good_afternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening`
  String get good_evening {
    return Intl.message(
      'Good Evening',
      name: 'good_evening',
      desc: '',
      args: [],
    );
  }

  /// `Discover Your Learning Path with ElCentre`
  String get discover_your_learning {
    return Intl.message(
      'Discover Your Learning Path with ElCentre',
      name: 'discover_your_learning',
      desc: '',
      args: [],
    );
  }

  /// `Popular Courses`
  String get popular_courses {
    return Intl.message(
      'Popular Courses',
      name: 'popular_courses',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get see_all {
    return Intl.message('See All', name: 'see_all', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `My Courses`
  String get my_courses {
    return Intl.message('My Courses', name: 'my_courses', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Sign out`
  String get sign_out {
    return Intl.message('Sign out', name: 'sign_out', desc: '', args: []);
  }

  /// `My Profile`
  String get my_profile {
    return Intl.message('My Profile', name: 'my_profile', desc: '', args: []);
  }

  /// `My Learning`
  String get my_learning {
    return Intl.message('My Learning', name: 'my_learning', desc: '', args: []);
  }

  /// `All Categories`
  String get all_categories {
    return Intl.message(
      'All Categories',
      name: 'all_categories',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Join Now`
  String get join_now {
    return Intl.message('Join Now', name: 'join_now', desc: '', args: []);
  }

  /// `No Courses Available`
  String get no_courses_available_title {
    return Intl.message(
      'No Courses Available',
      name: 'no_courses_available_title',
      desc: '',
      args: [],
    );
  }

  /// `we're working hard to bring you amazing courses is this category. check back soon or expolre other categories!`
  String get no_courses_available_body {
    return Intl.message(
      'we\'re working hard to bring you amazing courses is this category. check back soon or expolre other categories!',
      name: 'no_courses_available_body',
      desc: '',
      args: [],
    );
  }

  /// `Browse Categories`
  String get browse_categories {
    return Intl.message(
      'Browse Categories',
      name: 'browse_categories',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get something_went_wrong {
    return Intl.message(
      'Something went wrong',
      name: 'something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Go Back`
  String get go_back {
    return Intl.message('Go Back', name: 'go_back', desc: '', args: []);
  }

  /// `EGP`
  String get egp_currency {
    return Intl.message('EGP', name: 'egp_currency', desc: '', args: []);
  }

  /// `Courses`
  String get courses {
    return Intl.message('Courses', name: 'courses', desc: '', args: []);
  }

  /// `Course`
  String get course {
    return Intl.message('Course', name: 'course', desc: '', args: []);
  }

  /// `Instructor`
  String get instructor {
    return Intl.message('Instructor', name: 'instructor', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Requirements`
  String get requirements {
    return Intl.message(
      'Requirements',
      name: 'requirements',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message('Reviews', name: 'reviews', desc: '', args: []);
  }

  /// `Enroll Now`
  String get enroll_now {
    return Intl.message('Enroll Now', name: 'enroll_now', desc: '', args: []);
  }

  /// `Overview`
  String get overView {
    return Intl.message('Overview', name: 'overView', desc: '', args: []);
  }

  /// `Curriculum`
  String get curriculum {
    return Intl.message('Curriculum', name: 'curriculum', desc: '', args: []);
  }

  /// `About This Course`
  String get about_this_course {
    return Intl.message(
      'About This Course',
      name: 'about_this_course',
      desc: '',
      args: [],
    );
  }

  /// `modules`
  String get modules {
    return Intl.message('modules', name: 'modules', desc: '', args: []);
  }

  /// `lessons`
  String get lessons {
    return Intl.message('lessons', name: 'lessons', desc: '', args: []);
  }

  /// `total length`
  String get total_length {
    return Intl.message(
      'total length',
      name: 'total_length',
      desc: '',
      args: [],
    );
  }

  /// `Continue Learning`
  String get continue_learning {
    return Intl.message(
      'Continue Learning',
      name: 'continue_learning',
      desc: '',
      args: [],
    );
  }

  /// `No lessons available for this module.`
  String get no_lessons_available_for_this_module {
    return Intl.message(
      'No lessons available for this module.',
      name: 'no_lessons_available_for_this_module',
      desc: '',
      args: [],
    );
  }

  /// `Choose Payment Method`
  String get choose_payment_method {
    return Intl.message(
      'Choose Payment Method',
      name: 'choose_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Complete your enrollment for`
  String get complete_your_enrollment_for {
    return Intl.message(
      'Complete your enrollment for',
      name: 'complete_your_enrollment_for',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get cridet_card {
    return Intl.message('Credit Card', name: 'cridet_card', desc: '', args: []);
  }

  /// `Credit/Debit Card`
  String get cridet_card_or_debit {
    return Intl.message(
      'Credit/Debit Card',
      name: 'cridet_card_or_debit',
      desc: '',
      args: [],
    );
  }

  /// `Pay with your credit or debit card`
  String get pay_with_your_cridet_card {
    return Intl.message(
      'Pay with your credit or debit card',
      name: 'pay_with_your_cridet_card',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Wallet`
  String get mobile_wallet {
    return Intl.message(
      'Mobile Wallet',
      name: 'mobile_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Pay with your mobile wallet`
  String get pay_with_your_mobile_wallet {
    return Intl.message(
      'Pay with your mobile wallet',
      name: 'pay_with_your_mobile_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Pay Now`
  String get pay_now {
    return Intl.message('Pay Now', name: 'pay_now', desc: '', args: []);
  }

  /// `Payment completed successfully`
  String get payment_success {
    return Intl.message(
      'Payment completed successfully',
      name: 'payment_success',
      desc: '',
      args: [],
    );
  }

  /// `Payment failed: `
  String get payment_failed {
    return Intl.message(
      'Payment failed: ',
      name: 'payment_failed',
      desc: '',
      args: [],
    );
  }

  /// `Browse by Category`
  String get browse_by_category {
    return Intl.message(
      'Browse by Category',
      name: 'browse_by_category',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get view_all {
    return Intl.message('View All', name: 'view_all', desc: '', args: []);
  }

  /// `View Course`
  String get view_course {
    return Intl.message('View Course', name: 'view_course', desc: '', args: []);
  }

  /// `review`
  String get review {
    return Intl.message('review', name: 'review', desc: '', args: []);
  }

  /// `No reviews yet.`
  String get no_reviews_yet {
    return Intl.message(
      'No reviews yet.',
      name: 'no_reviews_yet',
      desc: '',
      args: [],
    );
  }

  /// `Be the first to share your thoughts\nabout this course!`
  String get be_the_first_one_to_review {
    return Intl.message(
      'Be the first to share your thoughts\nabout this course!',
      name: 'be_the_first_one_to_review',
      desc: '',
      args: [],
    );
  }

  /// `Write a Review`
  String get write_a_review {
    return Intl.message(
      'Write a Review',
      name: 'write_a_review',
      desc: '',
      args: [],
    );
  }

  /// `You're reviewing'`
  String get you_are_reviewing {
    return Intl.message(
      'You\'re reviewing\'',
      name: 'you_are_reviewing',
      desc: '',
      args: [],
    );
  }

  /// `How would you rate this course?`
  String get how_would_you_rate_this_course {
    return Intl.message(
      'How would you rate this course?',
      name: 'how_would_you_rate_this_course',
      desc: '',
      args: [],
    );
  }

  /// `Tap the stars to rate your experience with this course.`
  String get tap_the_stars_to_rate_your_experience {
    return Intl.message(
      'Tap the stars to rate your experience with this course.',
      name: 'tap_the_stars_to_rate_your_experience',
      desc: '',
      args: [],
    );
  }

  /// `Share your thoughts`
  String get share_your_thoughts {
    return Intl.message(
      'Share your thoughts',
      name: 'share_your_thoughts',
      desc: '',
      args: [],
    );
  }

  /// `Tell others about your experience with this course.`
  String get tell_others_about_your_experience_with_this_course {
    return Intl.message(
      'Tell others about your experience with this course.',
      name: 'tell_others_about_your_experience_with_this_course',
      desc: '',
      args: [],
    );
  }

  /// `Poor`
  String get poor {
    return Intl.message('Poor', name: 'poor', desc: '', args: []);
  }

  /// `Fair`
  String get fair {
    return Intl.message('Fair', name: 'fair', desc: '', args: []);
  }

  /// `Good`
  String get good {
    return Intl.message('Good', name: 'good', desc: '', args: []);
  }

  /// `Very Good`
  String get very_good {
    return Intl.message('Very Good', name: 'very_good', desc: '', args: []);
  }

  /// `Excellent`
  String get excellent {
    return Intl.message('Excellent', name: 'excellent', desc: '', args: []);
  }

  /// `Submit Review`
  String get submit_review {
    return Intl.message(
      'Submit Review',
      name: 'submit_review',
      desc: '',
      args: [],
    );
  }

  /// `Write your review here...`
  String get write_your_review_here {
    return Intl.message(
      'Write your review here...',
      name: 'write_your_review_here',
      desc: '',
      args: [],
    );
  }

  /// `Tips for a helpful review`
  String get tips_for_a_helpful_review {
    return Intl.message(
      'Tips for a helpful review',
      name: 'tips_for_a_helpful_review',
      desc: '',
      args: [],
    );
  }

  /// `• Be specific about what you liked or didn't like`
  String get be_specific {
    return Intl.message(
      '• Be specific about what you liked or didn\'t like',
      name: 'be_specific',
      desc: '',
      args: [],
    );
  }

  /// `• Mention the course content, instructor, and difficulty level`
  String get mention_the_course_content {
    return Intl.message(
      '• Mention the course content, instructor, and difficulty level',
      name: 'mention_the_course_content',
      desc: '',
      args: [],
    );
  }

  /// `• Help others understand if this course is right for them`
  String get help_others_understand {
    return Intl.message(
      '• Help others understand if this course is right for them',
      name: 'help_others_understand',
      desc: '',
      args: [],
    );
  }

  /// `• Keep it constructive and honest`
  String get keep_it_constructive {
    return Intl.message(
      '• Keep it constructive and honest',
      name: 'keep_it_constructive',
      desc: '',
      args: [],
    );
  }

  /// `Please provide a rating and write a review`
  String get please_provide_a_rating {
    return Intl.message(
      'Please provide a rating and write a review',
      name: 'please_provide_a_rating',
      desc: '',
      args: [],
    );
  }

  /// `Review submitted successfully!`
  String get review_submitted {
    return Intl.message(
      'Review submitted successfully!',
      name: 'review_submitted',
      desc: '',
      args: [],
    );
  }

  /// `Failed to submit review. Please try again.`
  String get failed_to_submit {
    return Intl.message(
      'Failed to submit review. Please try again.',
      name: 'failed_to_submit',
      desc: '',
      args: [],
    );
  }

  /// `Course Content`
  String get course_content {
    return Intl.message(
      'Course Content',
      name: 'course_content',
      desc: '',
      args: [],
    );
  }

  /// `Quizzes`
  String get quizzes {
    return Intl.message('Quizzes', name: 'quizzes', desc: '', args: []);
  }

  /// `Q&A`
  String get q_and_a {
    return Intl.message('Q&A', name: 'q_and_a', desc: '', args: []);
  }

  /// `Ratings`
  String get ratings {
    return Intl.message('Ratings', name: 'ratings', desc: '', args: []);
  }

  /// `hours`
  String get hours {
    return Intl.message('hours', name: 'hours', desc: '', args: []);
  }

  /// `Total`
  String get total {
    return Intl.message('Total', name: 'total', desc: '', args: []);
  }

  /// `Course Description`
  String get course_description {
    return Intl.message(
      'Course Description',
      name: 'course_description',
      desc: '',
      args: [],
    );
  }

  /// `Remaining`
  String get remaining {
    return Intl.message('Remaining', name: 'remaining', desc: '', args: []);
  }

  /// `Lessons Completed`
  String get lessons_completed {
    return Intl.message(
      'Lessons Completed',
      name: 'lessons_completed',
      desc: '',
      args: [],
    );
  }

  /// `Your Progress`
  String get your_progress {
    return Intl.message(
      'Your Progress',
      name: 'your_progress',
      desc: '',
      args: [],
    );
  }

  /// `Course Details`
  String get course_details {
    return Intl.message(
      'Course Details',
      name: 'course_details',
      desc: '',
      args: [],
    );
  }

  /// `Created`
  String get created {
    return Intl.message('Created', name: 'created', desc: '', args: []);
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `of`
  String get of_of {
    return Intl.message('of', name: 'of_of', desc: '', args: []);
  }

  /// `Free`
  String get free {
    return Intl.message('Free', name: 'free', desc: '', args: []);
  }

  /// `Complete lessons to unlock their quizzes and test your knowledge.`
  String get complete_lessons_to_unlock {
    return Intl.message(
      'Complete lessons to unlock their quizzes and test your knowledge.',
      name: 'complete_lessons_to_unlock',
      desc: '',
      args: [],
    );
  }

  /// `Loading quizzes...`
  String get loading_quizzes {
    return Intl.message(
      'Loading quizzes...',
      name: 'loading_quizzes',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load quizzes. Please try again.`
  String get failed_to_load_quizzes {
    return Intl.message(
      'Failed to load quizzes. Please try again.',
      name: 'failed_to_load_quizzes',
      desc: '',
      args: [],
    );
  }

  /// `No quizzes available`
  String get no_quizzes_available {
    return Intl.message(
      'No quizzes available',
      name: 'no_quizzes_available',
      desc: '',
      args: [],
    );
  }

  /// `Complete lessons to unlock quizzes`
  String get complete_lessons_to_unlock_quizzes {
    return Intl.message(
      'Complete lessons to unlock quizzes',
      name: 'complete_lessons_to_unlock_quizzes',
      desc: '',
      args: [],
    );
  }

  /// `Questions`
  String get questions {
    return Intl.message('Questions', name: 'questions', desc: '', args: []);
  }

  /// `Question`
  String get question {
    return Intl.message('Question', name: 'question', desc: '', args: []);
  }

  /// `Answer`
  String get answer {
    return Intl.message('Answer', name: 'answer', desc: '', args: []);
  }

  /// `Answered`
  String get answered {
    return Intl.message('Answered', name: 'answered', desc: '', args: []);
  }

  /// `Total Quizzes`
  String get total_quizzes {
    return Intl.message(
      'Total Quizzes',
      name: 'total_quizzes',
      desc: '',
      args: [],
    );
  }

  /// `previous`
  String get previous {
    return Intl.message('previous', name: 'previous', desc: '', args: []);
  }

  /// `next`
  String get next {
    return Intl.message('next', name: 'next', desc: '', args: []);
  }

  /// `Choose the correct answer:`
  String get choose_the_correct_answer {
    return Intl.message(
      'Choose the correct answer:',
      name: 'choose_the_correct_answer',
      desc: '',
      args: [],
    );
  }

  /// `Explanation`
  String get explanation {
    return Intl.message('Explanation', name: 'explanation', desc: '', args: []);
  }

  /// `Correct Answer`
  String get correct_answer {
    return Intl.message(
      'Correct Answer',
      name: 'correct_answer',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect. Correct answer is`
  String get incorrect_correct_answer_is {
    return Intl.message(
      'Incorrect. Correct answer is',
      name: 'incorrect_correct_answer_is',
      desc: '',
      args: [],
    );
  }

  /// `lectures`
  String get lectures {
    return Intl.message('lectures', name: 'lectures', desc: '', args: []);
  }

  /// `Loading video...`
  String get loading_video {
    return Intl.message(
      'Loading video...',
      name: 'loading_video',
      desc: '',
      args: [],
    );
  }

  /// `'Failed to load video`
  String get failed_to_load_video {
    return Intl.message(
      '\'Failed to load video',
      name: 'failed_to_load_video',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message('Video', name: 'video', desc: '', args: []);
  }

  /// `Audio`
  String get audio {
    return Intl.message('Audio', name: 'audio', desc: '', args: []);
  }

  /// `Text`
  String get text {
    return Intl.message('Text', name: 'text', desc: '', args: []);
  }

  /// `Start Quiz`
  String get start_quiz {
    return Intl.message('Start Quiz', name: 'start_quiz', desc: '', args: []);
  }

  /// `Quiz is ready!`
  String get quiz_ready {
    return Intl.message(
      'Quiz is ready!',
      name: 'quiz_ready',
      desc: '',
      args: [],
    );
  }

  /// `Quiz is available for this lesson.`
  String get quiz_available_for_this_lesson {
    return Intl.message(
      'Quiz is available for this lesson.',
      name: 'quiz_available_for_this_lesson',
      desc: '',
      args: [],
    );
  }

  /// `There is a quiz for this lesson.`
  String get there_is_quiz_for_this_lesson {
    return Intl.message(
      'There is a quiz for this lesson.',
      name: 'there_is_quiz_for_this_lesson',
      desc: '',
      args: [],
    );
  }

  /// `Submit Quiz`
  String get submit_quiz {
    return Intl.message('Submit Quiz', name: 'submit_quiz', desc: '', args: []);
  }

  /// `Next Question`
  String get next_question {
    return Intl.message(
      'Next Question',
      name: 'next_question',
      desc: '',
      args: [],
    );
  }

  /// `Excellent`
  String get Excellent {
    return Intl.message('Excellent', name: 'Excellent', desc: '', args: []);
  }

  /// `Good Job`
  String get Good_Job {
    return Intl.message('Good Job', name: 'Good_Job', desc: '', args: []);
  }

  /// `Keep Practicing`
  String get Keep_Practicing {
    return Intl.message(
      'Keep Practicing',
      name: 'Keep_Practicing',
      desc: '',
      args: [],
    );
  }

  /// `You scored`
  String get You_scored {
    return Intl.message('You scored', name: 'You_scored', desc: '', args: []);
  }

  /// `out of`
  String get out_of {
    return Intl.message('out of', name: 'out_of', desc: '', args: []);
  }

  /// `Retake Quiz`
  String get retake_quiz {
    return Intl.message('Retake Quiz', name: 'retake_quiz', desc: '', args: []);
  }

  /// `Score`
  String get Score {
    return Intl.message('Score', name: 'Score', desc: '', args: []);
  }

  /// `Correct`
  String get Correct {
    return Intl.message('Correct', name: 'Correct', desc: '', args: []);
  }

  /// `Wrong`
  String get Wrong {
    return Intl.message('Wrong', name: 'Wrong', desc: '', args: []);
  }

  /// `AI Assistant`
  String get ai_assistant {
    return Intl.message(
      'AI Assistant',
      name: 'ai_assistant',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
