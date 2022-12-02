
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/persentation/screen/splashview/widget/splash_boday.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'persentation/screen/login_screen/login.dart';

bool show = true;
void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final pr = await SharedPreferences.getInstance();
  show = pr.getBool('om_BORADING') ?? true;
  
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {   

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: show ? Spladhview() : UesrLoing(),
      // UesrLoing() ,
    );
  }
  
}
