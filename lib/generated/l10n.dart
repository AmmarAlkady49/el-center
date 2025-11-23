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

  /// `Enter your email`
  String get typeYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'typeYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get typeYourPassword {
    return Intl.message(
      'Enter your password',
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

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
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

  /// `Share your thoughts...`
  String get share_your_thoughts {
    return Intl.message(
      'Share your thoughts...',
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

  /// `Monday`
  String get Monday {
    return Intl.message('Monday', name: 'Monday', desc: '', args: []);
  }

  /// `Tuesday`
  String get Tuesday {
    return Intl.message('Tuesday', name: 'Tuesday', desc: '', args: []);
  }

  /// `Wednesday`
  String get Wednesday {
    return Intl.message('Wednesday', name: 'Wednesday', desc: '', args: []);
  }

  /// `Thursday`
  String get Thursday {
    return Intl.message('Thursday', name: 'Thursday', desc: '', args: []);
  }

  /// `Friday`
  String get Friday {
    return Intl.message('Friday', name: 'Friday', desc: '', args: []);
  }

  /// `Saturday`
  String get Saturday {
    return Intl.message('Saturday', name: 'Saturday', desc: '', args: []);
  }

  /// `Sunday`
  String get Sunday {
    return Intl.message('Sunday', name: 'Sunday', desc: '', args: []);
  }

  /// `Sun`
  String get sun {
    return Intl.message('Sun', name: 'sun', desc: '', args: []);
  }

  /// `Mon`
  String get mon {
    return Intl.message('Mon', name: 'mon', desc: '', args: []);
  }

  /// `Tue`
  String get tue {
    return Intl.message('Tue', name: 'tue', desc: '', args: []);
  }

  /// `Wed`
  String get wed {
    return Intl.message('Wed', name: 'wed', desc: '', args: []);
  }

  /// `Thu`
  String get thu {
    return Intl.message('Thu', name: 'thu', desc: '', args: []);
  }

  /// `Fri`
  String get fri {
    return Intl.message('Fri', name: 'fri', desc: '', args: []);
  }

  /// `Sat`
  String get sat {
    return Intl.message('Sat', name: 'sat', desc: '', args: []);
  }

  /// `No enrolled courses`
  String get no_enrolled_courses {
    return Intl.message(
      'No enrolled courses',
      name: 'no_enrolled_courses',
      desc: '',
      args: [],
    );
  }

  /// `Start learning today`
  String get start_learning_today {
    return Intl.message(
      'Start learning today',
      name: 'start_learning_today',
      desc: '',
      args: [],
    );
  }

  /// `Browse Courses`
  String get browse_courses {
    return Intl.message(
      'Browse Courses',
      name: 'browse_courses',
      desc: '',
      args: [],
    );
  }

  /// `My Learning Journey`
  String get my_learning_journey {
    return Intl.message(
      'My Learning Journey',
      name: 'my_learning_journey',
      desc: '',
      args: [],
    );
  }

  /// `Enrolled Courses`
  String get enrolled_courses {
    return Intl.message(
      'Enrolled Courses',
      name: 'enrolled_courses',
      desc: '',
      args: [],
    );
  }

  /// `Enrolled`
  String get enrolled {
    return Intl.message('Enrolled', name: 'enrolled', desc: '', args: []);
  }

  /// `Your Courses`
  String get your_courses {
    return Intl.message(
      'Your Courses',
      name: 'your_courses',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `In Progress`
  String get in_progress {
    return Intl.message('In Progress', name: 'in_progress', desc: '', args: []);
  }

  /// `Progress`
  String get progress {
    return Intl.message('Progress', name: 'progress', desc: '', args: []);
  }

  /// `Review Course`
  String get review_course {
    return Intl.message(
      'Review Course',
      name: 'review_course',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Personal Information`
  String get personal_information {
    return Intl.message(
      'Personal Information',
      name: 'personal_information',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get change_language {
    return Intl.message(
      'Change Language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Loading your profile...`
  String get loading_your_profile {
    return Intl.message(
      'Loading your profile...',
      name: 'loading_your_profile',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get account_settings {
    return Intl.message(
      'Account Settings',
      name: 'account_settings',
      desc: '',
      args: [],
    );
  }

  /// `Manage your personal information`
  String get manage_your_personal_information {
    return Intl.message(
      'Manage your personal information',
      name: 'manage_your_personal_information',
      desc: '',
      args: [],
    );
  }

  /// `Update your password`
  String get update_your_password {
    return Intl.message(
      'Update your password',
      name: 'update_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Choose your preferred language`
  String get choose_your_preferred_language {
    return Intl.message(
      'Choose your preferred language',
      name: 'choose_your_preferred_language',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `Sign out of your account`
  String get sign_out_of_your_account {
    return Intl.message(
      'Sign out of your account',
      name: 'sign_out_of_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Weekly Progress`
  String get weekly_progess {
    return Intl.message(
      'Weekly Progress',
      name: 'weekly_progess',
      desc: '',
      args: [],
    );
  }

  /// `Lessons completed this week`
  String get lessons_completed_this_week {
    return Intl.message(
      'Lessons completed this week',
      name: 'lessons_completed_this_week',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get date_of_birth {
    return Intl.message(
      'Date of Birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Bio`
  String get bio {
    return Intl.message('Bio', name: 'bio', desc: '', args: []);
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `No bio provided`
  String get no_bio_provided {
    return Intl.message(
      'No bio provided',
      name: 'no_bio_provided',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message('Enter', name: 'enter', desc: '', args: []);
  }

  /// `Language Settings`
  String get language_settings {
    return Intl.message(
      'Language Settings',
      name: 'language_settings',
      desc: '',
      args: [],
    );
  }

  /// `Available Languages`
  String get available_languages {
    return Intl.message(
      'Available Languages',
      name: 'available_languages',
      desc: '',
      args: [],
    );
  }

  /// `Language changed successfully`
  String get language_changed_successfully {
    return Intl.message(
      'Language changed successfully',
      name: 'language_changed_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Search for courses`
  String get search_for_courses {
    return Intl.message(
      'Search for courses',
      name: 'search_for_courses',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Code`
  String get coupon_code {
    return Intl.message('Coupon Code', name: 'coupon_code', desc: '', args: []);
  }

  /// `Apply`
  String get apply {
    return Intl.message('Apply', name: 'apply', desc: '', args: []);
  }

  /// `Have a coupon code?`
  String get have_a_coupon_code {
    return Intl.message(
      'Have a coupon code?',
      name: 'have_a_coupon_code',
      desc: '',
      args: [],
    );
  }

  /// `Coupon applied`
  String get coupon_applied {
    return Intl.message(
      'Coupon applied',
      name: 'coupon_applied',
      desc: '',
      args: [],
    );
  }

  /// `Coupon code is invalid`
  String get coupon_code_is_invalid {
    return Intl.message(
      'Coupon code is invalid',
      name: 'coupon_code_is_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Found`
  String get found {
    return Intl.message('Found', name: 'found', desc: '', args: []);
  }

  /// `No courses found`
  String get no_courses_found {
    return Intl.message(
      'No courses found',
      name: 'no_courses_found',
      desc: '',
      args: [],
    );
  }

  /// `Try adjusting your search terms\nor explore our categories below`
  String get try_adjusting_your_search {
    return Intl.message(
      'Try adjusting your search terms\nor explore our categories below',
      name: 'try_adjusting_your_search',
      desc: '',
      args: [],
    );
  }

  /// `Popular Categories`
  String get popular_categories {
    return Intl.message(
      'Popular Categories',
      name: 'popular_categories',
      desc: '',
      args: [],
    );
  }

  /// `Explore courses in trending categories`
  String get explore_courses_in_trending_categories {
    return Intl.message(
      'Explore courses in trending categories',
      name: 'explore_courses_in_trending_categories',
      desc: '',
      args: [],
    );
  }

  /// `Data Science`
  String get data_science {
    return Intl.message(
      'Data Science',
      name: 'data_science',
      desc: '',
      args: [],
    );
  }

  /// `Web Development`
  String get web_development {
    return Intl.message(
      'Web Development',
      name: 'web_development',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Development`
  String get mobile_development {
    return Intl.message(
      'Mobile Development',
      name: 'mobile_development',
      desc: '',
      args: [],
    );
  }

  /// `IT and Software`
  String get it_and_software {
    return Intl.message(
      'IT and Software',
      name: 'it_and_software',
      desc: '',
      args: [],
    );
  }

  /// `Learn data analysis, ML, and AI`
  String get learn_data_analysis {
    return Intl.message(
      'Learn data analysis, ML, and AI',
      name: 'learn_data_analysis',
      desc: '',
      args: [],
    );
  }

  /// `Frontend, backend, and full-stack`
  String get frontend_and_backend {
    return Intl.message(
      'Frontend, backend, and full-stack',
      name: 'frontend_and_backend',
      desc: '',
      args: [],
    );
  }

  /// `iOS, Android, and cross-platform`
  String get iso_android_cross_platform {
    return Intl.message(
      'iOS, Android, and cross-platform',
      name: 'iso_android_cross_platform',
      desc: '',
      args: [],
    );
  }

  /// `Networking, DevOps, and more`
  String get network_devops {
    return Intl.message(
      'Networking, DevOps, and more',
      name: 'network_devops',
      desc: '',
      args: [],
    );
  }

  /// `by`
  String get by {
    return Intl.message('by', name: 'by', desc: '', args: []);
  }

  /// `was`
  String get was {
    return Intl.message('was', name: 'was', desc: '', args: []);
  }

  /// `now`
  String get now {
    return Intl.message('now', name: 'now', desc: '', args: []);
  }

  /// `you save`
  String get you_save {
    return Intl.message('you save', name: 'you_save', desc: '', args: []);
  }

  /// `Cybersecurity`
  String get cybersecurity {
    return Intl.message(
      'Cybersecurity',
      name: 'cybersecurity',
      desc: '',
      args: [],
    );
  }

  /// `Learn cybersecurity, network security, and web security`
  String get learn_cybersecurity {
    return Intl.message(
      'Learn cybersecurity, network security, and web security',
      name: 'learn_cybersecurity',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Explore`
  String get explore {
    return Intl.message('Explore', name: 'explore', desc: '', args: []);
  }

  /// `All Courses`
  String get all_courses {
    return Intl.message('All Courses', name: 'all_courses', desc: '', args: []);
  }

  /// `Start your free course`
  String get start_your_free_course {
    return Intl.message(
      'Start your free course',
      name: 'start_your_free_course',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message('Details', name: 'details', desc: '', args: []);
  }

  /// `More Details`
  String get more_details {
    return Intl.message(
      'More Details',
      name: 'more_details',
      desc: '',
      args: [],
    );
  }

  /// `Unsupported content type`
  String get unsupported_content_type {
    return Intl.message(
      'Unsupported content type',
      name: 'unsupported_content_type',
      desc: '',
      args: [],
    );
  }

  /// `This lesson is an article`
  String get this_lesson_is_an_article {
    return Intl.message(
      'This lesson is an article',
      name: 'this_lesson_is_an_article',
      desc: '',
      args: [],
    );
  }

  /// `min`
  String get min {
    return Intl.message('min', name: 'min', desc: '', args: []);
  }

  /// `Read Article`
  String get read_article {
    return Intl.message(
      'Read Article',
      name: 'read_article',
      desc: '',
      args: [],
    );
  }

  /// `Article`
  String get article {
    return Intl.message('Article', name: 'article', desc: '', args: []);
  }

  /// `Reading`
  String get reading {
    return Intl.message('Reading', name: 'reading', desc: '', args: []);
  }

  /// `Article Completed`
  String get article_completed {
    return Intl.message(
      'Article Completed',
      name: 'article_completed',
      desc: '',
      args: [],
    );
  }

  /// `Great job reading through this article. You can now continue to the next lesson.`
  String get greadt_job_reading {
    return Intl.message(
      'Great job reading through this article. You can now continue to the next lesson.',
      name: 'greadt_job_reading',
      desc: '',
      args: [],
    );
  }

  /// `Loading content...`
  String get loading_content {
    return Intl.message(
      'Loading content...',
      name: 'loading_content',
      desc: '',
      args: [],
    );
  }

  /// `Start a message with AI`
  String get start_message_with_ai {
    return Intl.message(
      'Start a message with AI',
      name: 'start_message_with_ai',
      desc: '',
      args: [],
    );
  }

  /// `Start Conversation`
  String get start_conversation {
    return Intl.message(
      'Start Conversation',
      name: 'start_conversation',
      desc: '',
      args: [],
    );
  }

  /// `Ask questions about the lesson content and get intelligent responses`
  String get ask_question_about_the_lesson_content {
    return Intl.message(
      'Ask questions about the lesson content and get intelligent responses',
      name: 'ask_question_about_the_lesson_content',
      desc: '',
      args: [],
    );
  }

  /// `Typing...`
  String get typing {
    return Intl.message('Typing...', name: 'typing', desc: '', args: []);
  }

  /// `online`
  String get online {
    return Intl.message('online', name: 'online', desc: '', args: []);
  }

  /// `Start a conversation with AI`
  String get start_conversation_ai {
    return Intl.message(
      'Start a conversation with AI',
      name: 'start_conversation_ai',
      desc: '',
      args: [],
    );
  }

  /// `This AI assistant can make mistakes. Always verify important information and use critical thinking when applying the responses to your learning.`
  String get ai_help_description {
    return Intl.message(
      'This AI assistant can make mistakes. Always verify important information and use critical thinking when applying the responses to your learning.',
      name: 'ai_help_description',
      desc: '',
      args: [],
    );
  }

  /// `Explain this lesson to me`
  String get explain_this_lesson {
    return Intl.message(
      'Explain this lesson to me',
      name: 'explain_this_lesson',
      desc: '',
      args: [],
    );
  }

  /// `Practice Questions`
  String get practice_questions {
    return Intl.message(
      'Practice Questions',
      name: 'practice_questions',
      desc: '',
      args: [],
    );
  }

  /// `Summarize the content for me`
  String get summarize_content {
    return Intl.message(
      'Summarize the content for me',
      name: 'summarize_content',
      desc: '',
      args: [],
    );
  }

  /// `Type Message`
  String get type_message {
    return Intl.message(
      'Type Message',
      name: 'type_message',
      desc: '',
      args: [],
    );
  }

  /// `Please note`
  String get please_note {
    return Intl.message('Please note', name: 'please_note', desc: '', args: []);
  }

  /// `Chat Cleared`
  String get chat_cleared {
    return Intl.message(
      'Chat Cleared',
      name: 'chat_cleared',
      desc: '',
      args: [],
    );
  }

  /// `Loading lesson content for AI assistant...`
  String get loading_lesson_content_for_ai_assistant {
    return Intl.message(
      'Loading lesson content for AI assistant...',
      name: 'loading_lesson_content_for_ai_assistant',
      desc: '',
      args: [],
    );
  }

  /// `Please wait for lesson content to load...`
  String get please_wait_for_lesson_content {
    return Intl.message(
      'Please wait for lesson content to load...',
      name: 'please_wait_for_lesson_content',
      desc: '',
      args: [],
    );
  }

  /// `Lesson`
  String get lesson {
    return Intl.message('Lesson', name: 'lesson', desc: '', args: []);
  }

  /// `Edited`
  String get edited {
    return Intl.message('Edited', name: 'edited', desc: '', args: []);
  }

  /// `No response`
  String get no_response {
    return Intl.message('No response', name: 'no_response', desc: '', args: []);
  }

  /// `answers`
  String get answers {
    return Intl.message('answers', name: 'answers', desc: '', args: []);
  }

  /// `report`
  String get report {
    return Intl.message('report', name: 'report', desc: '', args: []);
  }

  /// `delete`
  String get delete {
    return Intl.message('delete', name: 'delete', desc: '', args: []);
  }

  /// `Report Question`
  String get report_question {
    return Intl.message(
      'Report Question',
      name: 'report_question',
      desc: '',
      args: [],
    );
  }

  /// `Report Answer`
  String get report_answer {
    return Intl.message(
      'Report Answer',
      name: 'report_answer',
      desc: '',
      args: [],
    );
  }

  /// `Report Content`
  String get report_content {
    return Intl.message(
      'Report Content',
      name: 'report_content',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to report this content? This action will notify the moderators.`
  String get report_description {
    return Intl.message(
      'Are you sure you want to report this content? This action will notify the moderators.',
      name: 'report_description',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this content? This action cannot be undone.`
  String get delete_description {
    return Intl.message(
      'Are you sure you want to delete this content? This action cannot be undone.',
      name: 'delete_description',
      desc: '',
      args: [],
    );
  }

  /// `Report sent successfully`
  String get report_sent_successfully {
    return Intl.message(
      'Report sent successfully',
      name: 'report_sent_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Helpful`
  String get helpful {
    return Intl.message('Helpful', name: 'helpful', desc: '', args: []);
  }

  /// `Delete Answer`
  String get delete_answer {
    return Intl.message(
      'Delete Answer',
      name: 'delete_answer',
      desc: '',
      args: [],
    );
  }

  /// `Reply`
  String get reply {
    return Intl.message('Reply', name: 'reply', desc: '', args: []);
  }

  /// `Reply to question`
  String get reply_to_question {
    return Intl.message(
      'Reply to question',
      name: 'reply_to_question',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Edit Answer`
  String get edit_answer {
    return Intl.message('Edit Answer', name: 'edit_answer', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Delete Question`
  String get delete_question {
    return Intl.message(
      'Delete Question',
      name: 'delete_question',
      desc: '',
      args: [],
    );
  }

  /// `Ask Question`
  String get ask_question {
    return Intl.message(
      'Ask Question',
      name: 'ask_question',
      desc: '',
      args: [],
    );
  }

  /// `Be the first to ask a question`
  String get be_first_to_ask_question {
    return Intl.message(
      'Be the first to ask a question',
      name: 'be_first_to_ask_question',
      desc: '',
      args: [],
    );
  }

  /// `No questions yet`
  String get no_questions_yet {
    return Intl.message(
      'No questions yet',
      name: 'no_questions_yet',
      desc: '',
      args: [],
    );
  }

  /// `Ask your question here`
  String get ask_your_question_here {
    return Intl.message(
      'Ask your question here',
      name: 'ask_your_question_here',
      desc: '',
      args: [],
    );
  }

  /// `No curriculum available`
  String get no_curriculum_availables {
    return Intl.message(
      'No curriculum available',
      name: 'no_curriculum_availables',
      desc: '',
      args: [],
    );
  }

  /// `Delete Review`
  String get delete_review {
    return Intl.message(
      'Delete Review',
      name: 'delete_review',
      desc: '',
      args: [],
    );
  }

  /// `Update Review`
  String get update_review {
    return Intl.message(
      'Update Review',
      name: 'update_review',
      desc: '',
      args: [],
    );
  }

  /// `Edit Review`
  String get edit_review {
    return Intl.message('Edit Review', name: 'edit_review', desc: '', args: []);
  }

  /// `Preview`
  String get preview {
    return Intl.message('Preview', name: 'preview', desc: '', args: []);
  }

  /// `Full access benefits`
  String get full_access_benefits {
    return Intl.message(
      'Full access benefits',
      name: 'full_access_benefits',
      desc: '',
      args: [],
    );
  }

  /// `Continue Browsing`
  String get continue_browsing {
    return Intl.message(
      'Continue Browsing',
      name: 'continue_browsing',
      desc: '',
      args: [],
    );
  }

  /// `Get access to all lessons, quizzes, and exclusive content by enrolling in the full course.`
  String get get_access_to_full_course {
    return Intl.message(
      'Get access to all lessons, quizzes, and exclusive content by enrolling in the full course.',
      name: 'get_access_to_full_course',
      desc: '',
      args: [],
    );
  }

  /// `Enjoyed this preview?`
  String get enjoyed_this_preview {
    return Intl.message(
      'Enjoyed this preview?',
      name: 'enjoyed_this_preview',
      desc: '',
      args: [],
    );
  }

  /// `User Profile`
  String get user_profile {
    return Intl.message(
      'User Profile',
      name: 'user_profile',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Sign in again`
  String get reSignin {
    return Intl.message('Sign in again', name: 'reSignin', desc: '', args: []);
  }

  /// `Hi`
  String get hi {
    return Intl.message('Hi', name: 'hi', desc: '', args: []);
  }

  /// `Ready to inspire minds today?`
  String get ready_to_inspire {
    return Intl.message(
      'Ready to inspire minds today?',
      name: 'ready_to_inspire',
      desc: '',
      args: [],
    );
  }

  /// `Your Teaching Overview`
  String get your_teaching_overView {
    return Intl.message(
      'Your Teaching Overview',
      name: 'your_teaching_overView',
      desc: '',
      args: [],
    );
  }

  /// `Total Courses`
  String get total_courses {
    return Intl.message(
      'Total Courses',
      name: 'total_courses',
      desc: '',
      args: [],
    );
  }

  /// `Total Students`
  String get total_students {
    return Intl.message(
      'Total Students',
      name: 'total_students',
      desc: '',
      args: [],
    );
  }

  /// `Avg. Completion Rate`
  String get avg_completion_rate {
    return Intl.message(
      'Avg. Completion Rate',
      name: 'avg_completion_rate',
      desc: '',
      args: [],
    );
  }

  /// `Quick Actions`
  String get quick_actions {
    return Intl.message(
      'Quick Actions',
      name: 'quick_actions',
      desc: '',
      args: [],
    );
  }

  /// `Create Course`
  String get create_course {
    return Intl.message(
      'Create Course',
      name: 'create_course',
      desc: '',
      args: [],
    );
  }

  /// `View Analytics`
  String get view_analytics {
    return Intl.message(
      'View Analytics',
      name: 'view_analytics',
      desc: '',
      args: [],
    );
  }

  /// `students enrolled`
  String get student_enrolled {
    return Intl.message(
      'students enrolled',
      name: 'student_enrolled',
      desc: '',
      args: [],
    );
  }

  /// `Completion`
  String get completion {
    return Intl.message('Completion', name: 'completion', desc: '', args: []);
  }

  /// `View Details`
  String get view_details {
    return Intl.message(
      'View Details',
      name: 'view_details',
      desc: '',
      args: [],
    );
  }

  /// `Edit Course`
  String get edit_course {
    return Intl.message('Edit Course', name: 'edit_course', desc: '', args: []);
  }

  /// `Completion Rate`
  String get completion_rate {
    return Intl.message(
      'Completion Rate',
      name: 'completion_rate',
      desc: '',
      args: [],
    );
  }

  /// `Course Avaliable`
  String get course_available {
    return Intl.message(
      'Course Avaliable',
      name: 'course_available',
      desc: '',
      args: [],
    );
  }

  /// `No Courses Yet`
  String get no_courses_yet {
    return Intl.message(
      'No Courses Yet',
      name: 'no_courses_yet',
      desc: '',
      args: [],
    );
  }

  /// `Start creating courses and share your knowledge with the world.`
  String get start_creating_courses_message {
    return Intl.message(
      'Start creating courses and share your knowledge with the world.',
      name: 'start_creating_courses_message',
      desc: '',
      args: [],
    );
  }

  /// `Create your first course`
  String get create_your_first_course {
    return Intl.message(
      'Create your first course',
      name: 'create_your_first_course',
      desc: '',
      args: [],
    );
  }

  /// `Need help getting started?`
  String get need_help_getting_started {
    return Intl.message(
      'Need help getting started?',
      name: 'need_help_getting_started',
      desc: '',
      args: [],
    );
  }

  /// `Students`
  String get students {
    return Intl.message('Students', name: 'students', desc: '', args: []);
  }

  /// `Duration`
  String get duration {
    return Intl.message('Duration', name: 'duration', desc: '', args: []);
  }

  /// `Modify`
  String get modify {
    return Intl.message('Modify', name: 'modify', desc: '', args: []);
  }

  /// `Keep going! You're`
  String get keep_going_you_are {
    return Intl.message(
      'Keep going! You\'re',
      name: 'keep_going_you_are',
      desc: '',
      args: [],
    );
  }

  /// `away from completion`
  String get away_from_completion {
    return Intl.message(
      'away from completion',
      name: 'away_from_completion',
      desc: '',
      args: [],
    );
  }

  /// `Course Settings`
  String get course_settings {
    return Intl.message(
      'Course Settings',
      name: 'course_settings',
      desc: '',
      args: [],
    );
  }

  /// `Published`
  String get published {
    return Intl.message('Published', name: 'published', desc: '', args: []);
  }

  /// `Make this course visible to students`
  String get make_this_course_visible_to_students {
    return Intl.message(
      'Make this course visible to students',
      name: 'make_this_course_visible_to_students',
      desc: '',
      args: [],
    );
  }

  /// `Enable AI Assistant`
  String get enable_ai_assistant {
    return Intl.message(
      'Enable AI Assistant',
      name: 'enable_ai_assistant',
      desc: '',
      args: [],
    );
  }

  /// `Provide AI-powered help to students`
  String get provide_ai_powerd_help_to_students {
    return Intl.message(
      'Provide AI-powered help to students',
      name: 'provide_ai_powerd_help_to_students',
      desc: '',
      args: [],
    );
  }

  /// `Course Title`
  String get course_title {
    return Intl.message(
      'Course Title',
      name: 'course_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter course title`
  String get Enter_course_title {
    return Intl.message(
      'Enter course title',
      name: 'Enter_course_title',
      desc: '',
      args: [],
    );
  }

  /// `Describe what students will learn in this course`
  String get describe_what_student_will_learn_in_this_course {
    return Intl.message(
      'Describe what students will learn in this course',
      name: 'describe_what_student_will_learn_in_this_course',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message('Category', name: 'category', desc: '', args: []);
  }

  /// `Choose the best category for your course`
  String get choose_the_best_category_for_your_course {
    return Intl.message(
      'Choose the best category for your course',
      name: 'choose_the_best_category_for_your_course',
      desc: '',
      args: [],
    );
  }

  /// `Course Language`
  String get course_language {
    return Intl.message(
      'Course Language',
      name: 'course_language',
      desc: '',
      args: [],
    );
  }

  /// `Select the primary language for instruction`
  String get select_the_primary_language_for_instruction {
    return Intl.message(
      'Select the primary language for instruction',
      name: 'select_the_primary_language_for_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Enter course price (e.g., 299 EGP)`
  String get enter_course_price {
    return Intl.message(
      'Enter course price (e.g., 299 EGP)',
      name: 'enter_course_price',
      desc: '',
      args: [],
    );
  }

  /// `Enter course duration (e.g., 15h)`
  String get enter_total_course_duration {
    return Intl.message(
      'Enter course duration (e.g., 15h)',
      name: 'enter_total_course_duration',
      desc: '',
      args: [],
    );
  }

  /// `Course Requirements`
  String get course_requirements {
    return Intl.message(
      'Course Requirements',
      name: 'course_requirements',
      desc: '',
      args: [],
    );
  }

  /// `List prerequisites or requirements for students`
  String get list_prerequisites_or_requirements_for_students {
    return Intl.message(
      'List prerequisites or requirements for students',
      name: 'list_prerequisites_or_requirements_for_students',
      desc: '',
      args: [],
    );
  }

  /// `Select Course Language`
  String get select_course_language {
    return Intl.message(
      'Select Course Language',
      name: 'select_course_language',
      desc: '',
      args: [],
    );
  }

  /// `Select Category`
  String get select_category {
    return Intl.message(
      'Select Category',
      name: 'select_category',
      desc: '',
      args: [],
    );
  }

  /// `Select Image Source`
  String get select_image_source {
    return Intl.message(
      'Select Image Source',
      name: 'select_image_source',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Gallery`
  String get gallery {
    return Intl.message('Gallery', name: 'gallery', desc: '', args: []);
  }

  /// `Take a new photo`
  String get take_a_new_photo {
    return Intl.message(
      'Take a new photo',
      name: 'take_a_new_photo',
      desc: '',
      args: [],
    );
  }

  /// `Choose from four gallery`
  String get choose_from_gallery {
    return Intl.message(
      'Choose from four gallery',
      name: 'choose_from_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Remove Image`
  String get remove_image {
    return Intl.message(
      'Remove Image',
      name: 'remove_image',
      desc: '',
      args: [],
    );
  }

  /// `Clear current selection`
  String get clear_current_selection {
    return Intl.message(
      'Clear current selection',
      name: 'clear_current_selection',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Error while uploading image`
  String get error_while_uploading_image {
    return Intl.message(
      'Error while uploading image',
      name: 'error_while_uploading_image',
      desc: '',
      args: [],
    );
  }

  /// `Add Image`
  String get add_image {
    return Intl.message('Add Image', name: 'add_image', desc: '', args: []);
  }

  /// `Tap to select an image from camera or gallery`
  String get tap_to_select_an_image_from_camera_or_gallery {
    return Intl.message(
      'Tap to select an image from camera or gallery',
      name: 'tap_to_select_an_image_from_camera_or_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Thumbnail`
  String get thumbnail {
    return Intl.message('Thumbnail', name: 'thumbnail', desc: '', args: []);
  }

  /// `Please enter course title`
  String get please_enter_course_title {
    return Intl.message(
      'Please enter course title',
      name: 'please_enter_course_title',
      desc: '',
      args: [],
    );
  }

  /// `Please select a category`
  String get please_select_a_category {
    return Intl.message(
      'Please select a category',
      name: 'please_select_a_category',
      desc: '',
      args: [],
    );
  }

  /// `Please select a language`
  String get please_select_a_language {
    return Intl.message(
      'Please select a language',
      name: 'please_select_a_language',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `course created successfully`
  String get course_created_successfully {
    return Intl.message(
      'course created successfully',
      name: 'course_created_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Please select a thumbnail`
  String get please_select_a_thumbnail {
    return Intl.message(
      'Please select a thumbnail',
      name: 'please_select_a_thumbnail',
      desc: '',
      args: [],
    );
  }

  /// `Update Course`
  String get update_course {
    return Intl.message(
      'Update Course',
      name: 'update_course',
      desc: '',
      args: [],
    );
  }

  /// `Manage Content`
  String get manage_content {
    return Intl.message(
      'Manage Content',
      name: 'manage_content',
      desc: '',
      args: [],
    );
  }

  /// `Unable to Load Content`
  String get unable_to_load_content {
    return Intl.message(
      'Unable to Load Content',
      name: 'unable_to_load_content',
      desc: '',
      args: [],
    );
  }

  /// `We're having trouble loading your learning materials. Check your connection and try again.`
  String get unable_to_load_content_desc {
    return Intl.message(
      'We\'re having trouble loading your learning materials. Check your connection and try again.',
      name: 'unable_to_load_content_desc',
      desc: '',
      args: [],
    );
  }

  /// `Logging out...`
  String get logging_out {
    return Intl.message(
      'Logging out...',
      name: 'logging_out',
      desc: '',
      args: [],
    );
  }

  /// `Login failed`
  String get loginFailed {
    return Intl.message(
      'Login failed',
      name: 'loginFailed',
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
