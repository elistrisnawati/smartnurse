import "package:flutter/material.dart";

// to make the standar bottom navigation
class RequestItem extends StatelessWidget {
  final String requestGroup;
  final String requestItem;

  const RequestItem({
    required this.requestGroup,
    required this.requestItem,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialColor color = Colors.grey;

    return GestureDetector(
      onTap: () {
        print("TAPPED " + requestItem);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              image:
                  AssetImage('assets/images/request/' + requestItem + '.jpeg'),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: color,
                offset: const Offset(1.5, 1.5),
                blurRadius: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
