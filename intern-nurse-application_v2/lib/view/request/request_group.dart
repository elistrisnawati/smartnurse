import "package:flutter/material.dart";
import 'package:intern_nurse_application_v2/view/request/request_item.dart';
import 'package:intern_nurse_application_v2/view/util/title_text.dart';

// to make the standar bottom navigation
class RequestGroup extends StatelessWidget {
  final String requestId;

  final List<String> requestContentList;

  const RequestGroup({
    required this.requestId,
    required this.requestContentList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<RequestItem> requestItemList = requestContentList
        .map((e) => RequestItem(
              requestGroup: requestId,
              requestItem: e,
            ))
        .toList();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleText(text: requestId),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: requestItemList,
          ),
        ),
      ],
    );
  }
}
