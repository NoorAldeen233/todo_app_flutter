import 'package:flutter/material.dart';
import 'package:flutter_application_1/conest/siz_confing.dart';
import 'package:flutter_application_1/persentation/screen/ombording/widget/ombording_boday.dart';

class Ombording extends StatelessWidget {
  // const Ombording({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: OmbordinBody(),
    );
  }
}
