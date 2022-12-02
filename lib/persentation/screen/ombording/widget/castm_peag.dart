import 'package:flutter/material.dart';
import 'package:flutter_application_1/conest/siz_confing.dart';

class CastmPagview extends StatelessWidget {
  const CastmPagview({Key key, @required this.pageController})
      : super(key: key);
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageviewItem(
          title: "قوم بادارة مهامك",
          suptitle: ' قوم بادارة مهامك وواجباتك',
          images: 'assets/images/list.jpg',
        ),
        PageviewItem(
          title: "حدد مهامك",
          suptitle: 'حدد مهامك وكن مميزا',
          images: 'assets/images/promom.jpg',
        ),
        PageviewItem(
          title: "حقق اهدافك",
          suptitle: 'تتبع انشطاتك ودير مهامك بشكل اضمن',
          images: 'assets/images/splas.png',
        ),
      ],
    );
  }
}

class PageviewItem extends StatelessWidget {
  const PageviewItem(
      {Key key,
      @required this.title,
      @required this.suptitle,
      @required this.images})
      : super(key: key);
  final String title;
  final String suptitle;
  final String images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizConfig.defaultsize * 8,
        ),
        SizedBox(
          height: SizConfig.defaultsize *17,
          child: Image(image: ExactAssetImage(images))),
        SizedBox(
          height: SizConfig.defaultsize * 1,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            // fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: SizConfig.defaultsize * .5,
        ),
        Text(
          suptitle,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ],
    );
  }
}
