import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/shaer/cubit/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NavigatorU extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text("الاشعارات")),
        body: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Switch(value: cubit.swihchi, onChanged: (v) {
                  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
                  //  FlutterLocalNotificationsPlugin();


                }))
              ],
            );
          },
        ),
      ),
    );
  }
}
