
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Ios"),centerTitle: true,),
      body: Center(child:Text("Hi,Ali")) ,
    );
  }
}
