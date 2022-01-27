import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  static const routeName = '/splash';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.38),
          child: const Center(
            child: Text('Hello world')
            
            // const Image(
            //   image: const AssetImage("assets/images/logo.png"),
            //   fit: BoxFit.contain,
            // ),
          ),
        ),
      ),
    );
  }
}