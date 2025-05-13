import 'package:flutter/material.dart';
import 'package:shopmanager_mobile_app/features/auth/firebase/bloc/auth_bloc.dart';
import 'package:shopmanager_mobile_app/features/auth/presentation/sign_in/views/sign_in_page.dart';
import 'package:shopmanager_mobile_app/home_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AuthStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AuthStatus.authenticated:
      return [HomePage.page()];
    case AuthStatus.unauthenticated:
      return [SignInPage.page()];
  }
}
