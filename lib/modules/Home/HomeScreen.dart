import 'package:chat/base.dart';
import 'package:chat/modules/Drawer.dart';
import 'package:chat/modules/Home/HomeNavigator.dart';
import 'package:chat/modules/Home/HomeVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../shared/styles/MyTheme.dart';
import '../../shared/styles/colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeViewModel>
    implements HomeNaviagtor {
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/image/background.png",
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            iconTheme: IconThemeData(color: ColorWhite, size: 40),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Row(
              children: [
                SizedBox(width: 100,),
                Text(
                  'Chat',
                  style: MyThemeData.LightTheme.textTheme.headline1,
                ),
              ],
            ),
          ),
          drawer: SideDrawer(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.add,
              color: ColorWhite,
              size: 40,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'My Rooms',
                      style: MyThemeData.LightTheme.textTheme.headline1
                          ?.copyWith(fontSize: 14),
                    ),
                    Text(
                      'Browse',
                      style: MyThemeData.LightTheme.textTheme.headline1
                          ?.copyWith(fontSize: 14),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 300),
                  child: Center(
                    child: Text(
                      'No rooms joined yet',
                      style: MyThemeData.LightTheme.textTheme.headline2
                          ?.copyWith(fontSize: 14),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  HomeViewModel initViewModel() {
    // TODO: implement initViewModel
    return HomeViewModel();
  }
}
