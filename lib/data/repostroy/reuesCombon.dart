import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/shaer/cubit/app_cubit.dart';

Widget buildTasksItem(Map model, context) {
   return Dismissible(
    background: Container(
        color: Colors.black,
        child: Text(
          'حزف المهام',
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
    secondaryBackground: Container(
        color: Colors.black,
        child: Row(
          children: [
            Text(
              'حزف المهام',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        )),
    key: Key(model['id'].toString()),
    onDismissed: (direction) {
      AppCubit.get(context).deleteData(id: model['id']);
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 45.0,
            child: Text(
              '${model['time']}',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${model['title']}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${model['date']}',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          IconButton(
            icon: Icon(
              Icons.check_circle_outline,
              color: Colors.green,
            ),
            onPressed: () {
              AppCubit.get(context).updateData(status: 'done', id: model['id']);
            },
          ), 
          IconButton(
            icon: Icon(Icons.archive, color: Colors.black45),
            onPressed: () {
              AppCubit.get(context)
                  .updateData(status: 'archive', id: model['id']);
            },
          ),
        ],
      ),
    ),
  );
}


