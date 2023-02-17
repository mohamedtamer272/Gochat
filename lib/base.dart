import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseViewModel<T extends BaseNaviagtor> extends ChangeNotifier {
  T? navigator = null;
}

abstract class BaseNaviagtor {
  void showLoading({String massage});

  void showMassage(String massage);

  void hideDialog();
}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNaviagtor {
  late VM ViewModel;

  VM initViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewModel = initViewModel();
  }

  @override
  void hideDialog() {
    Navigator.pop(context);
  }

  @override
  void showLoading({String massage = 'Loading...'}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 20,
                ),
                Text(massage),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void showMassage(String massage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Center(child: Text(massage)));
      },
    );
  }
}
