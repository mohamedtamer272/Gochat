import 'package:chat/DataBase/DataBase_Utilits.dart';
import 'package:chat/models/MyUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class UserProvider extends ChangeNotifier{
  MyUser? myUser;
  User? UserAuth;

  UserProvider(){
    UserAuth=FirebaseAuth.instance.currentUser;
    initMyUser();
  }

  void initMyUser() async{
    if(UserAuth != null){
      myUser = await DataBaseUtilits.getUserFromFirebase(UserAuth?.uid??"");
  }
  }
}