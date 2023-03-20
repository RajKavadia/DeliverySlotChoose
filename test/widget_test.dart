// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:math';

import 'package:delivery_selection/app/modules/home_page_module/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:delivery_selection/main.dart';

void main() {
  group("description", () {
    var controller = HomePageController();
    test('update collection time', () {
      var index = 2;
      controller.updateCollectionTime(index);
      expect(controller.selectedCollectionIndex.value, equals(index));
    });
    test('update collection date', () {
      var dateTime = DateTime.now().add(Duration(days: 3));
      var index = 1;
      controller.updateCollectionDate(dateTime, index);
      expect(controller.collectionDate.value, equals(dateTime));
    });
    test('set collection date', () {
      var dateTime = DateTime.now().add(Duration(days: 4));
      controller.setCollectionDate(dateTime);
      expect(controller.collectionDate.value, equals(dateTime));
    });
    test('update delivery date', () {
      var dateTime = DateTime.now().add(Duration(days: 5));
      var index = 0;
      controller.updateDeliveryDate(dateTime, index);
      expect(controller.deliveryDate.value, equals(dateTime));
    });
    test('update delivery time', () {
      var index = 1;
      controller.updateDeliveryTime(index);
      expect(controller.selectedCollectionIndex.value, equals(index));
    });
    test('set collection timing', () {
      var s = "10:00 AM";
      var isMorningValue = true;
      var index = 0;
      controller.setcollectionTiming(s, isMorningValue, index);
      expect(controller.collectionTiming.value, equals(s));
      expect(controller.isMorningForCollection.value, equals(isMorningValue));
      expect(controller.collectionDate.value.hour, equals(10));
    });
    test('set delivery timing', () {
      var s = "02:00 PM";
      var isMorningValue = false;
      var index = 1;
      controller.setDeliveryTiming(s, isMorningValue, index);
      expect(controller.deliveryTiming.value, equals(s));
      expect(controller.isMorningForDelivery.value, equals(isMorningValue));
      expect(controller.deliveryDate.value.hour, equals(14));
    });
    test('get initials from string', () {
      var string = "12:30 PM";
      var initials = controller.getInitials(string);
      expect(initials, equals("12"));
    });
    test('check if dates are valid', () {
      controller.collectionDate.value = DateTime.now().add(Duration(days: 2));
      controller.deliveryDate.value = DateTime.now().add(Duration(days: 3));
      var result = controller.areDatesValid();
      expect(result, equals(true));
    });
    test('choose date', () async {
      // var date = DateTime.now().add(Duration(days: 5)).value;
      // await controller.chooseDate(date);
      // expect(date.value, isNotNull);
    });
  });
}
