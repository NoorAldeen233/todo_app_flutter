// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/shaer/cubit/app_cubit.dart';
import 'package:flutter_application_1/persentation/screen/drawer.dart';
import 'package:flutter_application_1/persentation/screen/login_screen/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'persentation/screen/login_screen/login.dart';

import 'package:intl/intl.dart';

class HomeLeout extends StatefulWidget {
  HomeLeout({Key key}) : super(key: key);

  @override
  _HomeLeoutState createState() => _HomeLeoutState();
}

class _HomeLeoutState extends State<HomeLeout> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  var titileController = TextEditingController();

  var timeController = TextEditingController();

  var deatController = TextEditingController();

  SnackBar snackBar = SnackBar(content: Text('تم اضافة المهام'));
  FirebaseAuth instansnce = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (BuildContext context, AppState state) {
          instansnce.authStateChanges().listen((User user) {
            
            if (user == null) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => UesrLoing()));
            } else {
              print('Uesr');
            }
          });
          if (state is AppInsertDateBeasState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppState state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            endDrawer: DrawerBody(),
            key: scaffoldKey,
            appBar: AppBar(
              centerTitle: true,
              title: Text(cubit.titleScreen[cubit.currentIndex]),
            ),
            bottomNavigationBar: BottomNavigationBar(
                elevation: 20.0,
                // backgroundColor: Colors.indigo,
                type: BottomNavigationBarType.fixed,
                onTap: (indext) {
                  cubit.changeIndext(indext);
                },
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                currentIndex: cubit.currentIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'الرئسية'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.check_circle), label: 'تم'),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.archive,
                      ),
                      label: 'الارشفة'),
                ]),
            body: ConditionalBuilder(
              condition: state is! AppGetLodingDateBeasState,
              builder: (context) => cubit.taskscreen[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(cubit.fabicon),
              onPressed: () {
                if (cubit.isBouttenSheed) {
                  if (formKey.currentState.validate()) {
                    cubit.inseartDatebase(
                        title: titileController.text,
                        date: deatController.text,
                        time: timeController.text);
                    titileController.text = '';
                    deatController.text = '';
                    timeController.text = '';
                  }
                } else {
                  scaffoldKey.currentState
                      .showBottomSheet(
                          (context) => Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(20.0),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextFormField(
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'The Task Titile Form is Empty ';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.text,
                                        controller: titileController,
                                        decoration: InputDecoration(
                                          prefix: Icon(
                                            Icons.title,
                                            color: Colors.blue,
                                          ),
                                          hintText: 'TaskTitle ',
                                          labelText: 'Title',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        onTap: () {
                                          showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime(2090 ))
                                              .then((value) {
                                            deatController.text =
                                                DateFormat.yMMMMd()
                                                    .format(value);
                                          });
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'The Task Date Form is Empty ';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.datetime,
                                        controller: deatController,
                                        decoration: InputDecoration(
                                          prefix: Icon(
                                            Icons.calendar_today,
                                            color: Colors.blue,
                                          ),
                                          labelText: 'Date',
                                          hintText: 'Task Date ',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        onTap: () {
                                          showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now())
                                              .then((value) {
                                            timeController.text =
                                                value.format(context);
                                            print(value.format(context));
                                          });
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'The Task Time Form is Empty ';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.datetime,
                                        controller: timeController,
                                        decoration: InputDecoration(
                                          prefix: Icon(
                                            Icons.watch_later,
                                            color: Colors.blue,
                                          ),
                                          labelText: 'Taim',
                                          hintText: 'Task Taime ',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          elevation: 20.0)
                      .closed
                      .then((value) {
                    cubit.changBouttonShet(isShow: false, icon: Icons.edit);
                  });
                  cubit.changBouttonShet(isShow: true, icon: Icons.add);
                  // isBouttenSheed =true;
                  // setState(() {
                  //   fabicon = Icons.add;
                  // });

                }
              },
            ),
          );
        },
      ),
    );
  }
}

// AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
//   if(isAllowed){
//     showDialog(context: context ,builder: (context)=>AlertDialog(
//       title: Text("السماح بستخدام الاشعارات"),
//       content: Text("هل ترغب برسال الاسعارات"),
//       actions: [
//         FlatButton(onPressed: (){
//           Navigator.pop(context);
//         }, child: Text('السماح',style: TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.blue,

//           fontSize:18 ,

//         ),),
//         ),
//            FlatButton(onPressed: ()=>AwesomeNotifications().requestPermissionToSendNotifications().then((_) => Navigator.pop(context)),

//          child: Text('عدم السماح',style: TextStyle(
//           color: Colors.blue,
//           fontSize:18 ,
//         ),),
//         ),
//       ],
//     ),);
//   }

// });
