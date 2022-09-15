import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/services/notificaton_services.dart';
import 'package:task_manager/services/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    // notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: const [
          Text("Theme Data",
            style: TextStyle(
                fontSize: 30
            ),)
        ],
      ),
    );
  }

  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          ThemeServices().switchTheme();
          notifyHelper.displayNotification(
              title: "Theme changed",
              body: !Get.isDarkMode?"Activated Dark Theme":"Activated Light Theme"
          );
          notifyHelper.scheduledNotification();
        },
        child: const Icon(Icons.nightlight_round, size: 20,),
      ),
      actions: const [
        Icon(Icons.person, size: 20,),
        SizedBox(width: 20,)
      ],
    );
  }
}
