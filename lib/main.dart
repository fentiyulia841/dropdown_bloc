import 'package:dropdown_bloc/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_bloc/pages/user_page.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "User List",
      debugShowCheckedModeBanner: false,
      home: UserPage(),
    );
  }
}
