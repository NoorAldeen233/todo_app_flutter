import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/conest/list_map.dart';
import 'package:flutter_application_1/data/repostroy/reuesCombon.dart';
import 'package:flutter_application_1/data/shaer/cubit/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class New extends StatelessWidget {
  const New({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppState>(
       listener: (context, state) {} ,
        builder: (context, state) {
           var tasks = AppCubit.get(context).newtasks.reversed.toList();

    return  ConditionalBuilder(
      condition:tasks.length >0 ,
           fallback: (context)=>Center(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.menu,size: 100,),
              Text("لا توجد مهام رجاء قم باضافة بعض المهام ",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              ),
                
                
              ],
             ),
           ),
      builder: (context) => ListView.separated(
        
      itemBuilder: (context ,indext)=>buildTasksItem(tasks[ indext],context),
       separatorBuilder: (context ,indext) =>Padding(
         padding: const EdgeInsetsDirectional.only(
            start: 20
         ),
         child: Container(
            color: Colors.grey[300],
            height: 1.0,
            width: double.infinity,
         ),
       ),
        itemCount: tasks.length,
        ),
          );
        },
                
          
    );
  }
}