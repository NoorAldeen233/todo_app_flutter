import 'package:flutter/material.dart';
import 'package:flutter_application_1/conest/siz_confing.dart';

class PupleBottem extends StatelessWidget {
  const PupleBottem({ Key key, this.texte, this.color,@required this.onTap }) : super(key: key);
  final String texte;
  final Color  color ;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: onTap,
          child: Container(
        height: 60,
        width: SizConfig.sizwidth,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(7)
        ),
        child: Center(
          child: Text(texte,style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
        ),
        
      ),
    );
  }
}