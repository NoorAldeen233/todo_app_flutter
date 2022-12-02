import 'package:flutter/material.dart';
import 'package:flutter_application_1/conest/castme_textform.dart';

class InpoutForm extends StatefulWidget {
  @override
  State<InpoutForm> createState() => _InpoutFormState();
}

class _InpoutFormState extends State<InpoutForm> {
  // const InpoutForm({ Key key, this.controller }) : super(key: key);
   TextEditingController nameController;

    TextEditingController emilController;

    TextEditingController pinController;

    TextEditingController phoneController;

   var keyScaffald = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Careat Accont"),
      ),
      body: Form(
        key: keyScaffald,
              child: ListView(
          children: [
          const SizedBox(
              height: 10,
            ),
           Padding(
             padding: const EdgeInsets.only(
                left: 10,
                right: 10
             ),
             child: CastamTextFormFild(
              //  validator: (){},
               onChanged: (value){
                 print(nameController);
               },
               textInputType: TextInputType.name,
              color: Colors.black,
              text: 'Enter your firest name',
               textEditingController:nameController ,
             ),
           ),
            const SizedBox(
              height: 10,
            ),
                    Padding(
             padding: const EdgeInsets.only(
                left: 10,
                right: 10
             ),
             child: CastamTextFormFild(
              //  validator: (){},
               onChanged: (value){
                 print(nameController);
               },
               textInputType: TextInputType.name,
              color: Colors.black,
              text: 'Enter your Scane name',
               textEditingController:nameController ,
             ),
           ),
            const SizedBox(
              height: 10,
            ),
                    Padding(
             padding: const EdgeInsets.only(
                left: 10,
                right: 10
             ),
             child: CastamTextFormFild(
              //  validator: (){},
               onChanged: (value){
                 print(emilController);
               },
               textInputType: TextInputType.emailAddress,
              color: Colors.black,
              text: 'Enter your EmailAdress',
               textEditingController:emilController  ,
             ),
           ),
            const SizedBox(
              height: 10,
            ),
                       Padding(
             padding: const EdgeInsets.only(
                left: 10,
                right: 10
             ),
             child: CastamTextFormFild(
              //  validator: (){},
               onChanged: (value){
                 print(emilController);
               },
               textInputType: TextInputType.number,
              color: Colors.black,
              text: 'Enter your PiN',
               textEditingController:pinController ,
             ),
           ),
           SizedBox(
             height: 10,
           ),
                      Padding(
             padding: const EdgeInsets.only(
                left: 10,
                right: 10
             ),
             child: CastamTextFormFild(
              //  validator: (){},
               onChanged: (value){
                 print(pinController);
               },
               textInputType: TextInputType.number,
              color: Colors.black,
              text: 'Enter your PiN',
               textEditingController:pinController ,
             ),
           ),
                      SizedBox(
             height: 10,
           ),
                      Padding(
             padding: const EdgeInsets.only(
                left: 10,
                right: 10
             ),
             child: CastamTextFormFild(
              //  validator: (){},
               onChanged: (value){
                 print(phoneController);
               },
               textInputType: TextInputType.phone,
              color: Colors.black,
              text: 'Enter your phoneNnumber',
               textEditingController: phoneController,
             ),
           ),
           SizedBox(
             
             height: 20,
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               MaterialButton(
               color: Colors.blue,
               onPressed: (){
                
                 
                 
                 
               }, child: Text("Save",style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.bold,
               color: Colors.white,
             ),)),
                MaterialButton(
               color: Colors.blue,
               onPressed: (){}, child: Text("Cansel",style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.bold,
               color: Colors.white,
             ),)),
             ],
           ),
       
          
           
            
          ],
        ),
      ),
    );
  }
}