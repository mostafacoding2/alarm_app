import 'package:flutter/material.dart';
class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    required this.onchange,
    required this.onSaved,
    required this.text,
    required this.typeinput
  });
 final void Function(String?) onchange;
final   void Function(String?)?onSaved;
  final String text;
final   TextInputType  typeinput;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value)
      {
        if(value?.isEmpty??true)
        {
          return 'Field is required ';
        }
        else{ return null;}
      },

      keyboardType:typeinput,

onSaved:onSaved ,
      onChanged: onchange,
      decoration: InputDecoration
        (
          //contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        hintText: text,
        border: OutlineInputBorder()
      ),

    );
  }
}
