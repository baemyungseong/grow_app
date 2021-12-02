import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//colors used in this app

const Color white = Colors.white;
const Color whiteLight = Color(0xFFF5F5F5);

const Color black = Colors.black;

// const Color purple_first = Color(0xFFFFFFFF);
const Color purpleDark = Color(0xFF9857CB);
const Color purpleLight = Color(0xFFF1E9F6);

const Color greyDark = Color(0xFF6F7175);
const Color greyLight = Color(0xFFAAAAAA);
const Color greyUltralight = Color(0xFFC4C4C4);

const Color red = Color(0xFFCB356B);
const Color green = Color(0xFF159957);

final Shader redGradient = LinearGradient(
  colors: <Color>[Color(0xFFCB356B), Color(0xFFBD3F32)],
).createShader(
  Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
);
