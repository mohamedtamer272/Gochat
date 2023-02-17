import 'package:chat/DataBase/DataBase_Utilits.dart';
import 'package:chat/base.dart';
import 'package:chat/models/MyUser.dart';
import 'package:chat/modules/CreatAccount/CreatAccountNaviagtor.dart';
import 'package:chat/shared/components/FirebaseErrors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccountViewModel extends BaseViewModel<CreateAccountNavigator> {
  String? message;

  void AccountCreate(
      String fName, String lName, String email, String password) async {
    try {
      navigator!.showLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      MyUser myUser = MyUser(
          id: credential.user?.uid ?? "",
          fName: fName,
          lName: lName,
          email: email);
      DataBaseUtilits.addUserToFirebase(myUser);
      navigator!.gotoHome(myUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.weakPassword) {
        message = "The password provided is too weak.";
      } else if (e.code == FirebaseErrors.emailAlreadyInUse) {
        message = "The account already exists for that email.";
      }
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
