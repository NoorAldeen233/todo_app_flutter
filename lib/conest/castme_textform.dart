import 'package:flutter/material.dart';

class CastamTextFormFild extends StatelessWidget {

  const CastamTextFormFild({Key key, 
    @required this.color,
     this.text,
      this.textEditingController,
      @required this.textInputType
      ,@required this.onChanged, this.validator,
       this.iconData, this.lable, this.onTap
       })
      : super(key: key);
  final Color color;
  final String text;
  final  TextEditingController textEditingController;
  final TextInputType textInputType;
  final Function onChanged;
  final Function validator;
  final IconData iconData;
  final String lable;
  final Function onTap;
   
 

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      
      onTap: onTap,
      validator:validator ,
      keyboardType:textInputType ,
      // controller:textEditingController ,
      onChanged: onChanged,
      style: TextStyle(
        color: color,
      ),
      decoration: InputDecoration(
      
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        hintText: text,
        labelText: text,
        hintStyle: TextStyle(
          color: color,
        ),
        prefixIcon: Icon(iconData,color: Colors.blue),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: color.withOpacity(0.7),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: color.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
