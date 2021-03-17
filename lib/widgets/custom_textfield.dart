
import 'package:flutter/material.dart';

import '../constant.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onClick;
  
  String _errorMessage(String str)
  {
    switch(hint)
    {
      case 'Enter your name' : return 'Name is empty';
      case 'Enter your email' : return 'Email is empty';
      case 'Enter your password' : return 'Password is empty';
    }    
  }
  CustomTextField({
    @required this.onClick,
    @required this.hint,
     this.icon,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10, left:25,right: 25 ),
      child: TextFormField(
        validator: (Value)
        {
          if(Value.isEmpty)
          {
            return _errorMessage(hint);
          }
        },
        onSaved: onClick,
        obscureText: hint =='Enter your password' ? true: false,
        cursorColor: kMainColor,
        cursorWidth: 2,
        decoration:  InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color:Colors.lightBlueAccent,
          ),
          filled: true,
          fillColor: kSecondaryColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white
            ),
          ),
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
