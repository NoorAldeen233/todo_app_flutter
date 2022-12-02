import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/data/shaer/cubit/app_cubit.dart';
import 'package:flutter_application_1/persentation/screen/aboutApp/about_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerBody extends StatefulWidget {
  @override
  State<DrawerBody> createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  FirebaseAuth instansnce = FirebaseAuth.instance;

  final controller = TextEditingController();

  final padding = EdgeInsets.symmetric(
    horizontal: 20,
  );

  Function function;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(),
      child: Drawer(
    
        child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            // AppCubit cubit = AppCubit.get(context);

            return Material(
              // color: Colors.blue,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView(
                  padding: padding,
                  children: [
                    const SizedBox(
                      height: 50.0,
                    ),
                    UserAccountsDrawerHeader(
                      onDetailsPressed: () {},
                      arrowColor: Colors.blue,
                      accountEmail: Text("nooo@gmail.com"),
                      accountName: Text("nooraldeen"),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                      ),
                      // decoration: BoxDecoration(
                      //   color: Colors.blue,

                      //   //       image: DecorationImage(
                      //   //  image: AssetImage(''), fit: BoxFit.fill),
                      // ),
                    ), // const SizedBox(
                    //   height: 50.0,
                    // ),
                    Badge(
                      badgeContent: Text(
                        "0",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      padding: EdgeInsets.only(top: 10),
                      child: buildManuItem(
                          icon: Icons.notifications_active,
                          text: 'الاشعارات',
                          onCalk: () => selectItem(context, 0)),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    buildManuItem(
                      icon: Icons.info_outline,
                      text: 'نبذة عن التطبيق',
                      onCalk: () => selectItem(context, 1),
                    ),

                    const SizedBox(
                      height: 24.0,
                    ),
                    Divider(
                      // height: 4,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    buildManuItem(
                      icon: Icons.exit_to_app,
                      text: 'تسجيل الخروج',
                      onCalk: () => selectItem(context, 2),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildManuItem(
      {@required String text, @required IconData icon, VoidCallback onCalk}) {
    final color = Colors.blue;
    final haveColor = Colors.blue;

    return ListTile(
      onTap: onCalk,
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style:
            TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      hoverColor: haveColor,
    );
  }

  selectItem(BuildContext context, int indext) {
    Navigator.of(context).pop();
    switch (indext) {
      case 0:
        showDialog(
          context: (context),
          builder: (context) => AlertDialog(
            title: Text("تشغيل الاشغارات"),
            content: Text('هل تريد تشغيل الاشعارات ؟'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "نعم",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  // CircularProgressIndicator();
                  Navigator.pop(context);
                },
                child: Text(
                  "لا",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        );

        // BouttomNavigat()

        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => About(),
        ));

        break;
      case 2:
        showDialog(
          context: (context),
          builder: (context) => AlertDialog(
            title: Text("تسجيل الخروج"),
            content: Text('هل تريد الخروج من التطبيق؟'),
            actions: [
              MaterialButton(
                onPressed: () {
                  instansnce.signOut();
                  SystemNavigator.pop();
                },
                child: Text(
                  "نعم",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "لا",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        );

        break;
    }
  }
}
