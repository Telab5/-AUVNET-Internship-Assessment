import 'package:auvnet_internship/consts/colors.dart';
import 'package:flutter/material.dart';

class Input_fireld extends StatelessWidget {
  Input_fireld(
      {required,
      super.key,
      required this.label,
      required this.prficon,
      required this.type,
      this.secure = false,
      this.control,
      this.saficon});
  var label;
  var type;
  var saficon;
  var prficon;
  var secure;
  var control;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
          controller: control,
          obscureText: secure,
          keyboardType: type,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(19),
                  borderSide: BorderSide(color: appColor)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(19)),
              prefixIcon: prficon,
              suffixIcon: saficon,
              // iconColor: appColor
              prefixIconColor: appColor,
              label: Text(label),
              labelStyle:
                  TextStyle(color: appColor, fontWeight: FontWeight.w700))),
    );
  }
}
