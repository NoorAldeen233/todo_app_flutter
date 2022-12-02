import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("نبذة عن التطبيق"),
      ),
      body: Directionality(
           textDirection: TextDirection.rtl,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        RichText(
        
          text: TextSpan(
            style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black
            ),
            children: [
        TextSpan(
          text: 'عبارة عن طبيق لادارة المهام اليومية '
        ),
        TextSpan(
          text: 'تم تطويره من بواسطة مطورين مستقلين '
        ),
            TextSpan(
         style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue
            ),
            text: 'هو مجان ومفتوح المصدر',
            
            ),
          
        TextSpan(
             style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue
            ),
          text: 'الادوات   المتخدمة: '
        ),
        TextSpan(
          text: 'فلوتر لغة دارت اسكيوليت  '
        )
            ]
        )),
        
          ],
        ),
              ),
      ),
    );
  }
}