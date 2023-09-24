import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/database/user_database.dart';
import '../../models/entities/user_model.dart';



class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MyUser? user;

  getUser() async {
    user = await UserDatabase.getUser(FirebaseAuth.instance.currentUser!.uid)
        as MyUser;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: user == null
          ? const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 76, 229, 177),
              ),
            )
          : Text(user!.username),
    );
  }
}
