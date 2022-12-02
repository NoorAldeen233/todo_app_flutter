

import 'package:flutter/material.dart';
import 'package:flutter_application_1/persentation/screen/home_liout/navigatitem/archive_task.dart';
import 'package:flutter_application_1/persentation/screen/home_liout/navigatitem/done_task.dart';
import 'package:flutter_application_1/persentation/screen/home_liout/navigatitem/new_tasks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  // bool chikIcon= true ;

// void chikfavired(int i){
//    if(i)
//   chikIcon = !chikIcon;
//   emit(AppBottonFavState());
// }

  List<Widget> taskscreen = [New(), Done(), Archive()];
  List<String> titleScreen = ['Home', 'Done', 'Archive'];

  void changeIndext(int indext) {
    currentIndex = indext;
    emit(AppBottonNavState());
  }

  bool swihchi = true;
  void swhi(v) {
    swihchi = !v;
    emit(AppBottonswich());
  }

  int textin = 0;
  void addTaxt() {
    textin++;
    emit(AppAddTaxt());
  }

  Database database;
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivetasks = [];

  bool isBouttenSheed = false;
  IconData fabicon = Icons.edit;
  void changBouttonShet({
    @required bool isShow,
    @required IconData icon,
  }) {
    isBouttenSheed = isShow;
    fabicon = icon;
    emit(AppIsBouttonSheetState());
  }

  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('datebaseCreate');
        database
            .execute(
                'CREATE TABLE tasks(id INTEGER PRIMARY KEY ,title TEXT ,date TEXT , time TEXT ,status TEXT)')
            .then((value) {
          print('table Create');
        }).catchError((error) {
          print('Error when creat table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDatebaseform(database);
        print('datebaseOpen');
      },
    ).then((value) {
      database = value;
      emit(AppCreatDateBeasState());
    });
  }

  inseartDatebase({
    @required String title,
    @required String date,
    @required String time,
  }) async {
    await database.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO tasks(title,date,time,status)VALUES("$title","$date","$time","new") ')
          .then((value) {
        print('$value Insert seccessfelly');
        emit(AppInsertDateBeasState());
        getDatebaseform(database).then((value) {
          emit(AppGetDateBeasState());

          // value = value.reversed.toString();
          //           print(tasks);
        });
      });
      return null;
    }).catchError((error) {
      print('Error when Insert table ${error.toString()}');
    });
  }

  getDatebaseform(database) async {
    emit(AppGetLodingDateBeasState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      //  tasks = value ;
      // .reversed.toList();
      newtasks = [];
      donetasks = [];
      archivetasks = [];
      print(value);
      value.forEach((element) {
        if (element['status'] == 'new')
          newtasks.add(element);
        else if (element['status'] == 'done')
          donetasks.add(element);
        else
          archivetasks.add(element);
      });
      emit(AppGetDateBeasState());
    });
  }

  void updateData({
    @required String status,
    @required int id,
  }) {
    database.rawUpdate('UPDATE tasks SET  status = ?  WHERE id = ?',
        ['$status', id]).then((value) {
      getDatebaseform(database);
      emit(AppUpDateDateBeasState());
    });
  }

  void deleteData({
    @required int id,
  }) {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getDatebaseform(database);
      emit(AppDeleteDateBeasState());
    });
  }

}
