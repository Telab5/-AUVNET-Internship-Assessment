import 'package:auvnet_internship/consts/colors.dart';
import 'package:flutter/material.dart';

class defultBtn extends StatelessWidget {
  defultBtn({super.key, required this.Txt, this.width = 130, required this.fn});
  double width;
  String Txt;
  VoidCallback fn;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fn,
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: appColor, borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Center(
            child: Text(
              Txt,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
