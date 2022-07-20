import "package:flutter/material.dart";
import "package:intern_nurse_application_v3/data/constant_data.dart";
import 'package:intern_nurse_application_v3/model/view/activity_view_model.dart';

/// The Activity View for Nurse Activity
class ActivityView extends StatelessWidget {
  final ActivityViewModel activity;

  const ActivityView({required this.activity, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: size.height * 0.2,
              width: double.infinity,
              child: Image.asset("assets/images/background.jpeg",
                  fit: BoxFit.fitWidth),
            ),
            Positioned(
              top: 40,
              left: 30,
              child: Row(children: <Widget>[
                Text(activity.date.substring(0, 2),
                    style: ConstantData.styleActivity.copyWith(fontSize: 80.0)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(activity.day,
                          style: ConstantData.styleActivity
                              .copyWith(fontSize: 40.0)),
                      Text(activity.monthYear.toUpperCase(),
                          style: ConstantData.styleActivity
                              .copyWith(fontSize: 20.0)),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
        Flexible(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: activity.activityDetailList.length,
              itemBuilder: (context, i) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: size.width * 0.08),
                          SizedBox(
                            width: size.width * 0.15,
                            child: Text(
                              activity.activityDetailList[i].time,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  activity.activityDetailList[i].location,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                Text(
                                  activity.activityDetailList[i].description,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: 30,
                      child: Container(
                        height: size.height * 0.3,
                        width: 1.0,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Positioned(
                      bottom: 23,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: BoxDecoration(
                            color: ConstantData.colorActivityBullet,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
