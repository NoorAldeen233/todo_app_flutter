import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/persentation/screen/home_liout/homeliout.dart';
import 'package:flutter_application_1/persentation/screen/login_screen/creat_passwor.dart';

class UesrLoing extends StatefulWidget {
  UesrLoing({Key key}) : super(key: key);

  @override
  _UesrLoingState createState() => _UesrLoingState();
}

class _UesrLoingState extends State<UesrLoing> {
  bool scure = true;
  var forkey = GlobalKey<FormState>();
  FirebaseAuth instansnce = FirebaseAuth.instance;
  var _scaffoldKeyd = GlobalKey<ScaffoldState>();
  TextEditingController emileController = TextEditingController();
  TextEditingController passwordeController = TextEditingController();
  SnackBar bar = SnackBar(content: Text('خطاء'));
  SnackBar barsn = SnackBar(content: Text('خطاء'));

  @override
  void dispose() {
    super.dispose();
    emileController.dispose();
    passwordeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKeyd,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: forkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'الحقل فارف';
                      }
                      return null;
                    },
                    controller: emileController,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (values) {
                      print(values);
                    },
                    decoration: InputDecoration(
                      labelText: 'Entr Your Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'الحقل فارف';
                      }
                      return null;
                    },
                    controller: passwordeController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: scure,
                    onFieldSubmitted: (values) {
                      print(values);
                    },
                    decoration: InputDecoration(
                      labelText: 'Entr Your Password',
                      prefix: Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                          icon: scure
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              scure = !scure;
                            });
                          }),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.blue,
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () async {
                        
                        if (forkey.currentState.validate()) {
                          try {
                            // ignore: unused_local_variable
                            UserCredential credential =
                                await instansnce.signInWithEmailAndPassword(
                              email: emileController.text,
                              password: passwordeController.text,
                            );
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context)=>HomeLeout())
                            );
                            print('sucsess');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'uesr-not-found') {

                            } else if (e.code == 'worng-password') {}
                            print('-------- $e------------------');
                          }
                        } else {
                        }
                      },
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      MaterialButton(
                        // color: Colors.blue,
                        child: Text('انشاء حساب'),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NewPasswor()));
                        },
                      ),
                      // FlatButton(onPressed: null, child: Text("هل نسيت كلمة السر"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
