import 'package:flutter/material.dart';


class UesrAcount extends StatelessWidget {
  const UesrAcount({ Key key,@required this.email,@required this.name,@required this.image }) : super(key: key);
  final String email ;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(image: ExactAssetImage(image)),
    );
  }
}