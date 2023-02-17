import 'package:chat/DataBase/DataBase_Utilits.dart';
import 'package:chat/base.dart';
import 'package:chat/models/MyUser.dart';
import 'package:chat/modules/Login/LoginNaviagtor.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginViewModel extends BaseViewModel<LogainNaviagtor> {
  String? message;

  void Login(String email, String password) async {
    try {
      navigator!.showLoading();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      MyUser? myUser =
          await DataBaseUtilits.getUserFromFirebase(credential.user?.uid ?? "");
      if( myUser!=null){
        navigator!.gotoHome(myUser);
      }else {
        message = "No account for this email";
      }

    } on FirebaseAuthException catch (e) {
      message = "Wrong email or password";
    } catch (e) {
      message = "Something went wrong";
      print(e);
    }
    if (message != null) {
      navigator!.hideDialog();
      navigator!.showMassage(message!);
    }
  }
}
