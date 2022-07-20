import "package:flutter/material.dart";
import 'package:intern_nurse_application_v2/model/user_model.dart';
import 'package:intern_nurse_application_v2/util/shared_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserView extends StatelessWidget {
  final UserModel user;
  final Function() goToFunction;

  const UserView({
    required this.user,
    required this.goToFunction,
    Key? key,
  }) : super(key: key);

  Future<void> save() async {
    print("SAVE USER: " + user.name);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", user.name);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              await save();
              goToFunction();
            },
            child: CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage(user.imageUrl),
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            user.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
