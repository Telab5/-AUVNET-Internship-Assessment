import 'package:flutter/material.dart';

BorderRadius InputRadious() => BorderRadius.all(Radius.circular(19));

void NavigateTo(context, screen) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
