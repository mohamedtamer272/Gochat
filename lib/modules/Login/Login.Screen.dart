import 'package:chat/base.dart';
import 'package:chat/models/MyUser.dart';
import 'package:chat/modules/CreatAccount/CreatAccountScreen.dart';
import 'package:chat/modules/Home/HomeScreen.dart';
import 'package:chat/modules/Login/LoginNaviagtor.dart';
import 'package:chat/modules/Login/LoginVM.dart';
import 'package:chat/provider/UserProvider.dart';
import 'package:chat/shared/styles/MyTheme.dart';
import 'package:chat/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseView<LoginScreen, LoginViewModel>
    implements LogainNaviagtor {
  GlobalKey<FormState> FormKey = GlobalKey<FormState>();
  var EmailController = TextEditingController();

  var PasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModel,
      child: Stack(
        children: [
          Image.asset(
            "assets/image/background.png",
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0.0,
              title: Text(
                'Login',
                style: MyThemeData.LightTheme.textTheme.headline1,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 180, 20, 0),
              child: Form(
                key: FormKey,
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back!',
                        style: MyThemeData.LightTheme.textTheme.headline3,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Email',
                        style: MyThemeData.LightTheme.textTheme.headline2,
                      ),
                      TextFormField(
                        controller: EmailController,
                        validator: (Text) {
                          if (Text != null && Text.isEmpty) {
                            return 'please enter Email';
                          }
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(Text!);
                          if (!emailValid) {
                            return 'please enter valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Icon(
                                  Icons.check_circle,
                                  color: ColorBlue,
                                ))),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Password',
                        style: MyThemeData.LightTheme.textTheme.headline2,
                      ),
                      TextFormField(
                        controller: PasswordController,
                        obscureText: true,
                        validator: (Text) {
                          if (Text != null && Text.isEmpty) {
                            return 'please enter Password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text('Forgot password ?',
                          style: MyThemeData.LightTheme.textTheme.headline2),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorBlue,
                          ),
                          onPressed: () {
                            AccountCreat();
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  'Login',
                                  style: MyThemeData
                                      .LightTheme.textTheme.headline1
                                      ?.copyWith(fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                width: 170,
                              ),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: ColorWhite,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, CreatAccountScreen.routeName);
                        },
                        child: Text(
                          'Or Create My Account',
                          style: MyThemeData.LightTheme.textTheme.headline2
                              ?.copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void AccountCreat() {
    if (FormKey.currentState!.validate()) {
      ViewModel.Login(EmailController.text, PasswordController.text);
    }
  }

  @override
  LoginViewModel initViewModel() {
    // TODO: implement initViewModel
    return LoginViewModel();
  }

  @override
  void gotoHome(MyUser myUser) {
    var provider=Provider.of<UserProvider>(context,listen: false);
    provider.myUser=myUser;
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
