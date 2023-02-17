import 'package:chat/base.dart';
import 'package:chat/models/MyUser.dart';

abstract class CreateAccountNavigator extends BaseNaviagtor {
  void gotoHome(MyUser user);
}
