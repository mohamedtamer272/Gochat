import 'package:chat/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Expanded(
          flex: 0,
          child: ListView(
      children: [
          SizedBox(
            height: 200,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: ColorWhite,
              ),
              child: Image.asset("assets/image/logo.png"),
            ),
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorBlue,
                ),
                child: Icon(
                  Icons.group,
                  size: 50,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorBlue,
                ),
                child: Icon(
                  Icons.search,
                  size: 50,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorWhite,
                ),
                child: Icon(
                  Icons.settings,
                  size: 50,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: ColorBlue,
                ),
                child: Icon(
                  Icons.logout,
                  size: 50,
                ),
              ),
            ),
          )
      ],
    ),
        ));
  }
}
