// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/persentation/screen/home_liout/homeliout.dart';

class NewPasswor extends StatefulWidget {
  @override
  State<NewPasswor> createState() => _NewPassworState();
}

class _NewPassworState extends State<NewPasswor> {
  FirebaseAuth inst = FirebaseAuth.instance;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var _scaffoldkey = GlobalKey<ScaffoldState>();
  SnackBar bar = SnackBar(content: Text('كلمة السر ضعيف'));
  SnackBar barp = SnackBar(content: Text('الاميل مسجل من قبل'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'enter email',
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: 'enter password',
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.blue,
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        UserCredential credential =
                            await inst.createUserWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        );
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomeLeout()));
                        print('sucsess');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'Weak-password') {
                        } else if (e.code == 'email-already-in-ues') {
                        }
                        // print('-------- $e------------------');
                      }
                    },
                    child: Text(' save '),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
