import 'package:flutter/material.dart';
import 'package:flutter_application_1/conest/castme_indicator.dart';
import 'package:flutter_application_1/conest/garel_bottem.dart';
import 'package:flutter_application_1/conest/siz_confing.dart';
import 'package:flutter_application_1/persentation/screen/home_liout/homeliout.dart';
// import 'package:flutter_application_1/persentation/screen/login_screen/login_screen.dart';
import 'package:flutter_application_1/persentation/screen/ombording/widget/castm_peag.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OmbordinBody extends StatefulWidget {
  const OmbordinBody({Key key}) : super(key: key);

  @override
  _OmbordinBodyState createState() => _OmbordinBodyState();
}

class _OmbordinBodyState extends State<OmbordinBody> {
  ParametricCurve<double> parametricCurve;
  PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CastmPagview(
        pageController: pageController,
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: SizConfig.defaultsize * 8,
        child: IndicatorCastm(
          inIndicat: pageController.hasClients ? pageController.page : 0,
        ),
      ),
      Visibility(
        visible: pageController.hasClients
            ? (pageController.page == 2 ? false : true)
            : true,
        child: Positioned(
          top: SizConfig.defaultsize * 5,
          right: SizConfig.defaultsize * 3,
          child: Text(
            "Skip",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Positioned(
        left: SizConfig.defaultsize * 4,
        right: SizConfig.defaultsize * 4,
        bottom: SizConfig.defaultsize * 3,
        child: PupleBottem(
          onTap: () async {
            if (pageController.page < 2) {
              pageController.nextPage(
                duration: Duration(microseconds: 500),
                curve: Curves.easeIn,
              );
            } else {
              final pr = await SharedPreferences.getInstance();
              await pr.setBool('om_BORADING', false);

              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomeLeout()),
                  (route) => false);
            }
          },
          texte: pageController.hasClients
              ? (pageController.page == 2 ? 'Get Started' : 'Next')
              : "Next",
          color: Colors.blue,
        ),
      ),
    ]);
  }
}
