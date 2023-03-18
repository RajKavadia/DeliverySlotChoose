import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class HomePageController extends GetxController {
  var selectedCollectionIndex = 0.obs;
  var selectedDeliveryIndex = 0.obs;
  var collectionTiming = "".obs;
  var deliveryTiming = "".obs;
  var isMorningForCollection = true.obs;
  var isMorningForDelivery = true.obs;
  var deliveryDate =
      DateTime.utc(DateTime.now().year).add(const Duration(days: 2)).obs;
  var collectionDate =
      DateTime.utc(DateTime.now().year).add(const Duration(days: 2)).obs;

  updateCollectionTime(int index) {
    selectedCollectionIndex.value = index;
    update();
  }

  updateCollectionDate(DateTime dateTime, int index) {
    if (index == 2) {
      chooseDate(collectionDate);
    } else {
      collectionDate.value = dateTime;
    }
  }

  void setCollectionDate(DateTime dateTime) {
    collectionDate.value = dateTime;
  }

  void updateDeliveryDate(DateTime dateTime, int index) {
    if (index == 2) {
      chooseDate(deliveryDate);
    }
    deliveryDate.value = dateTime;
  }

  updateDeliveryTime(int index) {
    selectedCollectionIndex.value = index;
    update();
  }

  void setcollectionTiming(String? s, bool isMorningValue, int index) {
    collectionTiming.value = s!;
    isMorningForCollection.value = isMorningValue;
    collectionDate.value = DateTime(
        collectionDate.value.year,
        collectionDate.value.month,
        collectionDate.value.day,
        !isMorningValue
            ? int.parse(getInitials(s))
            : int.parse(getInitials(s)) + 12);
    update();
  }

  void setDeliveryTiming(String? s, bool isMorningValue, int index) {
    deliveryTiming.value = s!;
    isMorningForDelivery.value = isMorningValue;
    deliveryDate.value = DateTime(
        deliveryDate.value.year,
        deliveryDate.value.month,
        deliveryDate.value.day,
        !isMorningValue
            ? int.parse(getInitials(s))
            : int.parse(getInitials(s)) + 12);
    update();
  }

  String getInitials(String string) {
    return string.split(":")[0];
  }

  bool areDatesValid() {
    if (deliveryDate.value.isAfter(collectionDate.value)) {
      return true;
    } else {
      return false;
    }
  }

  DateTime? pickedDate;
  chooseDate(Rx<DateTime> date) async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now().add(Duration(days: 2)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
      //initialEntryMode: DatePickerEntryMode.input,
      // initialDatePickerMode: DatePickerMode.year,
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != date.value) {
      date.value = pickedDate;
    }
  }
}
