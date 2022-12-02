import 'package:flutter/material.dart';
import 'package:flutter_application_1/persentation/screen/ombording/ombording_screen.dart';


class Spladhview extends StatefulWidget {  
  @override
  _SpladhviewState createState() => _SpladhviewState();
}

class _SpladhviewState extends State<Spladhview> with SingleTickerProviderStateMixin {
  Animation<double> splashAnimation;
   AnimationController animationController;
   @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this,duration: Duration(
      // minutes: 2,
      microseconds: 600, 
      // seconds: 60,
     
    ));
  splashAnimation = Tween<double>(
    end: 2,
    begin: .2
  ).animate(animationController);
  animationController.repeat(
    reverse: true,
  );
  _openNextPage(context);
     
      
      
  
      
    }
    @override
    void dispose() {
      super.dispose();
      animationController.dispose();
    }
  
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 180,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 0.0
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 15,
                  end: 20
                ),
                child: FadeTransition(
                    opacity: splashAnimation,
                      child: Text(
                    "ادارة المهام",
                    style: TextStyle(color: Colors.blue,
                      fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            // Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                 bottom: 0.0
              ),
              child: Image.asset("assets/images/task3.png"),
            )
          ],
        ),
      ),
      );
    }
  
   Future _openNextPage(BuildContext context)async {
   await Future.delayed(Duration(seconds: 2),).then((value) {
     return     Navigator.of(context).push(
       MaterialPageRoute(builder: (context)=>Ombording()),
     );
   });
  
   }
}
