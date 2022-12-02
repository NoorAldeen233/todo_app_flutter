import 'package:flutter/material.dart';
// import 'package:flutter_application_1/persentation/screen/lock.dart';

class Setting extends StatelessWidget {
  // const ({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Setting"),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            buildManuItem(
              text: 'عداد الاشعارات',
              onCalk: () {},
            ),
            SizedBox(
              height: 20,
            ),
            buildManuItem(
                text: 'عداد كلمة السر',
                onCalk: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => null,
                    ),
                  );
                }),
            // SizedBox(
            //   height: 20,
            // ),
            // buildManuItem(text: 'عداد كلمة السر', onCalk: () {}),
          ],
        ),
      ),
    );
  }

  Widget buildManuItem({@required String text, VoidCallback onCalk}) {
    final color = Colors.blue;
    final haveColor = Colors.blue;

    return ListTile(
      onTap: onCalk,
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: haveColor,
    );
  }
}
