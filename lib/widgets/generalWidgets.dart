

import 'package:ephysicsapp/globals/colors.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';

Widget themeAppBar(String title){
  return  AppBar(
        title: Text(title), 
        backgroundColor: color5,
  );
}

//about us page slide

 newSlide({String imgPath,String discription,String title}){

  return Slide(
        title: title,
        styleTitle: TextStyle(
           color: color5,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            ),
        description:discription,
        styleDescription: TextStyle(
              color: color5,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            ),
        pathImage: imgPath,
      );
}