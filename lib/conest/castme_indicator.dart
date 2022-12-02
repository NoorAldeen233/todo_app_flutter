import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class IndicatorCastm extends StatelessWidget {
  const IndicatorCastm({ Key key,@required this.inIndicat }) : super(key: key);
  final double inIndicat ;

  @override
  Widget build(BuildContext context) {
    return   DotsIndicator(
          decorator: DotsDecorator(
            color: Colors.transparent,
            activeColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
              side: BorderSide(color: Colors.blue), 
            ),
          ),
          position: inIndicat,
          dotsCount: 3,
        );
  }
}