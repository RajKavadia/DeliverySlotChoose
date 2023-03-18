// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:delivery_selection/app/modules/home_page_module/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:delivery_selection/main.dart';

void main() {
  void main() {
    test('''
Test the state of the reactive variable "name" across all of its lifecycles''',
        () {
      /// You can test the controller without the lifecycle,
      /// but it's not recommended unless you're not using
      ///  GetX dependency injection
      final controller = HomePageController();
    });
  }
}
