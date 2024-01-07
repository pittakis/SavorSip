import 'package:savorsip_app_v1/Models/User.dart';
import 'package:savorsip_app_v1/Screens/authenticate/authenticate.dart';
import 'package:savorsip_app_v1/Screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }
    
  }
}