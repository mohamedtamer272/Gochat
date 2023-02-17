import 'package:chat/base.dart';
import 'package:chat/models/MyUser.dart';
import 'package:chat/modules/CreatAccount/CreatAccountNaviagtor.dart';
import 'package:chat/modules/CreatAccount/CreateAccountVM.dart';
import 'package:chat/modules/Home/HomeScreen.dart';
import 'package:chat/modules/Login/Login.Screen.dart';
import 'package:chat/provider/UserProvider.dart';
import 'package:chat/shared/styles/MyTheme.dart';
import 'package:chat/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatAccountScreen extends StatefulWidget {
  static const String routeName = 'CreatAccountScreen';

  @override
  State<CreatAccountScreen> createState() => _CreatAccountScreenState();
}

class _CreatAccountScreenState
    extends BaseView<CreatAccountScreen, CreateAccountViewModel>
    implements CreateAccountNavigator {
  GlobalKey<FormState> FormKey = GlobalKey<FormState>();

  var EmailController = TextEditingController();

  var PasswordController = TextEditingController();

  var fNameController = TextEditingController();

  var lNameController = TextEditingController();


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
              iconTheme: IconThemeData(color: ColorWhite, size: 30),
              title: Text(
                'Create Account',
                style: MyThemeData.LightTheme.textTheme.headline1,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(20, 180, 20, 0),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Form(
                  key: FormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'First name',
                        style: MyThemeData.LightTheme.textTheme.headline2,
                      ),
                      TextFormField(
                        controller: fNameController,
                        validator: (Text) {
                          if (Text != null && Text.isEmpty) {
                            return 'please enter first name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Last name',
                        style: MyThemeData.LightTheme.textTheme.headline2,
                      ),
                      TextFormField(
                        controller: lNameController,
                        validator: (Text) {
                          if (Text != null && Text.isEmpty) {
                            return 'please enter first name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'E-mail Adress',
                        style: MyThemeData.LightTheme.textTheme.headline2,
                      ),
                      TextFormField(
                        controller: EmailController,
                        validator: (Text) {
                          if (Text != null && Text.isEmpty) {
                            return 'please enter E-mail Adress';
                          }
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(Text!);
                          if (!emailValid) {
                            return 'please enter valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            'Password',
                            style: MyThemeData.LightTheme.textTheme.headline2,
                          ),
                        ],
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
                        decoration: InputDecoration(
                            suffixIcon: Padding(
                                padding: EdgeInsets.all(0.0),
                                child: Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: ColorGray,
                                ))),
                      ),
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
                                  'Create Account',
                                  style: MyThemeData
                                      .LightTheme.textTheme.headline1
                                      ?.copyWith(fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                width: 100,
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
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                        },
                        child: Text(
                          'I have an Account',
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

  void AccountCreat() async {
    if (FormKey.currentState!.validate()) {
      ViewModel.AccountCreate(
          fNameController.text,lNameController.text, EmailController.text, PasswordController.text);
    }
  }

  @override
  CreateAccountViewModel initViewModel() {
    // TODO: implement initViewModel
    return CreateAccountViewModel();
  }

  @override
  void gotoHome(MyUser user) {
    var provider=Provider.of<UserProvider>(context,listen: false);
    provider.myUser=user;
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
