import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ubenwa_kelvin/constants/color_constants.dart';
import 'package:ubenwa_kelvin/features/widget/custom_button.dart';

class CustomAlarmContainer extends StatefulWidget {
  const CustomAlarmContainer({
    super.key,
  });

  @override
  State<CustomAlarmContainer> createState() => _CustomAlarmContainerState();
}

class _CustomAlarmContainerState extends State<CustomAlarmContainer> {
  DateTime? dateTime = DateTime.now();
  Duration initialtimer = new Duration();
  var time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, bottom: 20, top: 10),
      child: Container(
        width: 194.w,
        height: 194.h,
        decoration: BoxDecoration(
          color: kPrimaryBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
                flex: 2, child: Image.asset("assets/images/timer_image.png")),
            Text(
              "Next Predicted Cry",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11.66.sp,
                  color: Color(0xffF9F9F9)),
            ),
            Text(
              "12:40 - 14:30",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 21.33.sp,
                  color: Color(0xffFFBA18)),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: CustomButton(
                  width: 99.13,
                  borderRadius: 5.0,
                  onPressed: () {
                    showCupertinoModalPopup<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return _buildCupertinoPicker();
                        });
                  },
                  text: "Set Alarm",
                  textColor: Color(0xff2250C5),
                  textSize: 9.7.sp,
                  color: Color(0xffFFFFFF).withOpacity(0.71),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCupertinoPicker() {
    return Container(
      height: 800.0,
      color: CupertinoColors.black,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: CupertinoColors.activeOrange),
                  ),
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: Text(
                    "Edith Alarm",
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    // Perform save action
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(color: CupertinoColors.activeOrange),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: timePicker(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 370,
              height: 280,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade700.withOpacity(0.4)),
              child: Column(
                children: [
                  CustomAlarmWidget(
                    title: "Repeat",
                    trailing: "Never",
                  ),
                  AlarmLine(),
                  CustomAlarmWidget(
                    title: "Label",
                    trailing: "Alarm",
                  ),
                  AlarmLine(),
                  CustomAlarmWidget(
                    title: "Sound",
                    trailing: "Circuit",
                  ),
                  AlarmLine(),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CupertinoButton(
                          onPressed: () {},
                          child: Text(
                            "Snooze",
                            style: TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Transform.scale(
                          scale: 1.4,
                          child: CupertinoSwitch(
                              value: true, onChanged: (value) {}),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width:  370,
              child: CupertinoButton(
                color: Colors.grey.shade700.withOpacity(0.4),
                onPressed: () {},
                child: Text(
                  "Delete Alarm",
                  style: TextStyle(
                    color: CupertinoColors.systemRed.withOpacity(0.7),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }

  Widget timePicker() {
    return CupertinoTheme(
      data: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          dateTimePickerTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.time,
        use24hFormat: true,
        minuteInterval: 1,
        onDateTimeChanged: (DateTime value) {},
      ),
    );
  }
}

class AlarmLine extends StatelessWidget {
  const AlarmLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        width: double.infinity,
        height: 0.1,
        color: CupertinoColors.systemGrey,
      ),
    );
  }
}

class CustomAlarmWidget extends StatelessWidget {
  final String title;
  final String trailing;
  const CustomAlarmWidget({
    super.key,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoButton(
            onPressed: () {},
            child: Text(
              title,
              style: TextStyle(
                color: CupertinoColors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Spacer(),
        CupertinoButton(
          onPressed: () {},
          child: Text(
            trailing,
            style: TextStyle(color: CupertinoColors.systemGrey, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            color: CupertinoColors.systemGrey,
          ),
        ),
      ],
    );
  }
}
