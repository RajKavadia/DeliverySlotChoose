import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery_selection/app/modules/home_page_module/home_page_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../utils/strings.dart';
class HomePagePage extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey[300],
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    "Select"+"Collection Date and Time",
                    style: GoogleFonts.poppins(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => InkWell(
                          onTap: () {
                            controller.selectedCollectionIndex.value = index;
                            controller.updateCollectionDate(
                                getDate(index), index);
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3 - 10,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: index ==
                                      controller.selectedCollectionIndex.value
                                  ? Colors.blue
                                  : Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: GetCollectionDayText(index),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(
                                      index < 2
                                          ? getDateInTextFormatWithIndex(index)
                                          : GetCustomDate(index,
                                              controller.collectionDate.value),
                                      style: GoogleFonts.poppins(
                                          color: index ==
                                                  controller
                                                      .selectedCollectionIndex
                                                      .value
                                              ? Colors.white
                                              : Colors.black87,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 3,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Morning",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      Text("Afternoon",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Obx(
                        () => SizedBox(
                          width: 200,
                          child: Container(
                            child: DecoratedBox(
                              decoration: const ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                              child: DropdownButton<String>(
                                  items: getMorningTime().map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {
                                    controller.setcollectionTiming(
                                        _, false, getMorningTime().indexOf(_!));
                                  },
                                  underline: SizedBox(),
                                  iconSize: 0.0,
                                  hint: !controller.isMorningForCollection.value
                                      ? Container(
                                          margin: EdgeInsets.all(15),
                                          child: Text(controller
                                              .collectionTiming.value),
                                        )
                                      : Text("")),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => SizedBox(
                          width: 200,
                          child: DecoratedBox(
                            decoration: const ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                            child: DropdownButton<String>(
                                items:
                                    getAfternoonTimings().map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (_) {
                                  controller.setcollectionTiming(_, true,
                                      getAfternoonTimings().indexOf(_!));
                                },
                                iconSize: 0.0,
                                underline: SizedBox(),
                                hint: controller.isMorningForCollection.value
                                    ? Container(
                                        margin: EdgeInsets.all(10),
                                        child: Text(
                                            controller.collectionTiming.value))
                                    : Text("")),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    "Select Delivery Date and Time",
                    style: GoogleFonts.poppins(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => InkWell(
                          onTap: () {
                            controller.selectedDeliveryIndex.value = index;
                            controller.updateDeliveryDate(
                                getDate(index), index);
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3 - 10,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: index ==
                                      controller.selectedDeliveryIndex.value
                                  ? Colors.blue
                                  : Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: GetDeliveryDayText(index),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Text(
                                        index < 2
                                            ? getDateInTextFormatWithIndex(
                                                index)
                                            : GetCustomDate(index,
                                                controller.deliveryDate.value),
                                        style: GoogleFonts.poppins(
                                            color: index ==
                                                    controller
                                                        .selectedDeliveryIndex
                                                        .value
                                                ? Colors.white
                                                : Colors.black87,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 3,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Morning",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text("Afternoon",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Obx(
                          () => SizedBox(
                            width: 200,
                            child: DecoratedBox(
                              decoration: const ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                              child: DropdownButton<String>(
                                  items: getMorningTime().map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {
                                    controller.setDeliveryTiming(
                                        _, false, getMorningTime().indexOf(_!));
                                  },
                                  iconSize: 0,
                                  underline: SizedBox(),
                                  hint: !controller.isMorningForDelivery.value
                                      ? Container(
                                          child: Text(controller
                                                  .deliveryTiming.value)
                                              .marginAll(10))
                                      : Text("")),
                            ),
                          ),
                        ),
                        Obx(
                          () => SizedBox(
                            width: 200,
                            child: DecoratedBox(
                              decoration: const ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                              child: DropdownButton<String>(
                                  items:
                                      getAfternoonTimings().map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {
                                    controller.setDeliveryTiming(_, true,
                                        getAfternoonTimings().indexOf(_!));
                                  },
                                  iconSize: 0,
                                  underline: SizedBox(),
                                  hint: controller.isMorningForDelivery.value
                                      ? Container(
                                          child: Text(
                                              controller.deliveryTiming.value),
                                          margin: EdgeInsets.all(10),
                                        )
                                      : Text("")),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(controller.areDatesValid()
                                  ? "Your Timing is submitted"
                                  : "Timings are invalid"),
                            ));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.blue,
                          ),
                          margin: EdgeInsets.only(top: 60),
                          height: 60,
                          width: 200,
                          child: Center(
                            child: Text("Submit",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24)),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }

  Widget GetCollectionDayText(int index) {
    switch (index) {
      case 0:
        return Text(
          "Today",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: index == controller.selectedCollectionIndex.value
                ? Colors.white
                : Colors.black87,
          ),
        );
      case 1:
        return Text(
          "Tomorrow",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: index == controller.selectedCollectionIndex.value
                ? Colors.white
                : Colors.black87,
          ),
        );
      case 2:
        return Text("Select Date",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: index == controller.selectedCollectionIndex.value
                  ? Colors.white
                  : Colors.black87,
            ));
      default:
        return Text(
          "Select Date",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
        );
    }
  }

  Widget GetDeliveryDayText(int index) {
    switch (index) {
      case 0:
        return Text(
          "Today",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: index == controller.selectedDeliveryIndex.value
                ? Colors.white
                : Colors.black87,
          ),
        );
      case 1:
        return Text(
          "Tomorrow",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: index == controller.selectedDeliveryIndex.value
                ? Colors.white
                : Colors.black87,
          ),
        );
      case 2:
        return Text("Select Date",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: index == controller.selectedDeliveryIndex.value
                  ? Colors.white
                  : Colors.black87,
            ));
      default:
        return Text(
          "Select Date",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
        );
    }
  }

  DateTime getDate(int index) {
    var now = DateTime.now().add(Duration(days: index));
    return now;
  }
}
