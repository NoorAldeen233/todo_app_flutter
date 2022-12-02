import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizConfig{
  static double  sizwidth;
  static double sizheigh;
  static double  defaultsize;
  static Orientation  orientation;

  void init(BuildContext context){
    sizwidth = MediaQuery.of(context).size.width;
    sizheigh = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
    
    defaultsize = orientation == Orientation.landscape 
    ?sizwidth  * .024:sizheigh * .024;
    

  }
}