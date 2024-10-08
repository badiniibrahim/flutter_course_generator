// ignore_for_file: non_constant_identifier_names, constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static Future<String> get INITIAL async {
    /*bool onboardingIsCompleted = StorageService().appData.onboardingIsCompleted;
    bool hasSessionValid = await AuthService().hasSessionValid();

    if (onboardingIsCompleted && hasSessionValid) {
      return Routes.HOME;
    } else if (onboardingIsCompleted && !hasSessionValid) {
      return Routes.SIGN_IN;
    } else {
      return Routes.ONBOARDING;
    }*/
    return Routes.HOME;
  }

  static const HOME = _Paths.HOME;
  static const HISTORY = _Paths.HISTORY;
  static const ONBOARDING = _Paths.ONBOARDING;
  static const STORY = _Paths.STORY;
  static const STEP1 = _Paths.STEP1;
  static const LANGUAGE = _Paths.LANGUAGE;
  static const GENRE = _Paths.GENRE;
  static const ENDING = _Paths.ENDING;
  static const SHOP = _Paths.SHOP;
  static const SIGN_UP = _Paths.SIGN_UP;
  static const SIGN_IN = _Paths.SIGN_IN;
  static const FORGOT_PASSWORD = _Paths.FORGOT_PASSWORD;

  static const CREATE_STORY_LANGUAGE = _Paths.STORY + _Paths.LANGUAGE;
  static const CREATE_SIGN_UP = _Paths.SIGN_IN + _Paths.SIGN_UP;
  static const CREATE_FORGOT_PASSWORD = _Paths.SIGN_IN + _Paths.FORGOT_PASSWORD;

  static const CREATE_STORY_GENRE = _Paths.STORY + _Paths.GENRE;
  static const CREATE_STORY_ENDING = _Paths.STORY + _Paths.ENDING;
  static const TASK = _Paths.TASK;
  static const AUTH = _Paths.AUTH;
  static const PROFILE = _Paths.PROFILE;
  static const MAIN = _Paths.MAIN;
  static const CREATE_COURSE = _Paths.CREATE_COURSE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const HISTORY = '/history';
  static const ONBOARDING = '/onboarding';
  static const STORY = '/story';
  static const STEP1 = '/step_1';
  static const LANGUAGE = '/language';
  static const GENRE = '/genre';
  static const ENDING = '/ending';
  static const SHOP = '/shop';
  static const TASK = '/task';
  static const AUTH = '/auth';
  static const PROFILE = '/profile';
  static const SIGN_IN = '/sign-in';
  static const SIGN_UP = '/sign-up';
  static const FORGOT_PASSWORD = '/forgot-password';
  static const MAIN = '/main';
  static const CREATE_COURSE = '/create-course';
}
