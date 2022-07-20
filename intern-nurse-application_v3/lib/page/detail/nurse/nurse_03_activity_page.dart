import 'package:flutter/material.dart';
import 'package:intern_nurse_application_v3/data/result_state.dart';
import 'package:intern_nurse_application_v3/model/activity_model.dart';
import 'package:intern_nurse_application_v3/model/rest/composite_output.dart';
import 'package:intern_nurse_application_v3/model/view/activity_detail_view_model.dart';
import 'package:intern_nurse_application_v3/model/view/activity_view_model.dart';
import 'package:intern_nurse_application_v3/util/provider/nurse_activity_provider.dart';
import 'package:intern_nurse_application_v3/view/activity/activity_view.dart';
import 'package:intern_nurse_application_v3/view/provider/error_provider.dart';
import 'package:intern_nurse_application_v3/view/provider/loading_provider.dart';
import 'package:provider/provider.dart';

class NurseActivityPage extends StatelessWidget {
  const NurseActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NurseActivityProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.hasData) {
          List<CompositeResultList> compositeResultList = state.result;

          List<ActivityModel> activityList = compositeResultList.map((e) {
            return ActivityModel(
              userId: e.contentMap["userId"] ?? "",
              date: e.contentMap["date"] ?? "",
              monthYear: e.contentMap["monthYear"] ?? "",
              day: e.contentMap["day"] ?? "",
              time: e.contentMap["time"] ?? "",
              location: e.contentMap["location"] ?? "",
              description: e.contentMap["description"] ?? "",
            );
          }).toList();

          return _build(activityList);
        } else if (state.state == ResultState.loading) {
          return const LoadingProviderView();
        } else {
          return const ErrorProviderView();
        }
      },
    );
  }

  Widget _build(List<ActivityModel> rawActivityList) {
    List<ActivityViewModel> activityViewModelList = [];

    Map<String, ActivityViewModel> activityViewModelMap = {};
    List<String> dateList = [];

    for (ActivityModel element in rawActivityList) {
      if (!activityViewModelMap.containsKey(element.date)) {
        dateList.add(element.date);

        ActivityViewModel activityViewModel = ActivityViewModel(
          date: element.date,
          monthYear: element.monthYear,
          day: element.day,
          activityDetailList: [],
        );

        activityViewModelMap[element.date] = activityViewModel;
      }

      ActivityDetailModel activityDetailModel = ActivityDetailModel(
          time: element.time,
          location: element.location,
          description: element.description);

      activityViewModelMap[element.date]
          ?.activityDetailList
          .add(activityDetailModel);
    }

    for (String date in dateList) {
      ActivityViewModel? viewModel = activityViewModelMap[date];
      if (viewModel == null) {
        continue;
      }

      activityViewModelList.add(viewModel);
    }

    return Scaffold(
        drawer: const Drawer(),
        body: PageView.builder(
          controller: PageController(initialPage: 0, viewportFraction: 0.95),
          itemCount: activityViewModelList.length,
          itemBuilder: (context, i) {
            return ActivityView(activity: activityViewModelList[i]);
          },
        ));
  }
}
