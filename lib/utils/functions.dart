import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Functions {
  // /// This function takes a phone number as a string
  // /// and tries to launch the users default phone app.
  // /// This doesn't work on simulators.
  // static void launchURL(String phone) async {
  //   String url = 'tel:$phone';
  //   try {
  //     if (await canLaunch(url)) {
  //       await launch(url);
  //     } else {
  //       throw 'Could not launch $url';
  //     }
  //   } catch (e) {
  //     Clipboard.setData(ClipboardData(text: phone));
  //     showToast("Could not launch your phone app, we've copied the number to your clipboard instead");
  //   }
  // }

  static void vibrate(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        HapticFeedback.vibrate();
        break;
      default:
        break;
    }
  }

  static void hapticFeeback(BuildContext context) {
    HapticFeedback.lightImpact();
  }

  static void safePop<T extends Object>(BuildContext context, [T? result]) {
    if (Navigator.canPop(context)) {
      Navigator.of(context).pop<T>(result);
    }
  }

  static PageRouteBuilder slideUpPageRouteBuilder(Widget page,
      {RouteSettings? settings}) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) {
        return page;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static void printMsg(
    String file, [
    String? function,
    String? msg,
  ]) {
    String log = '\n  \n*** File: $file\n';
    if (function != null) log += '*** Function: $function\n';
    if (msg != null) log += '*** Message: $msg';
    print(log);
  }

  static void showLoadingDialog(BuildContext context,
      [bool? mounted, String? timeoutMsg, bool? timeoutActive]) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.1),
      // barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(
              strokeWidth: 1.2,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueGrey)),
        );
      },
    ).timeout(Duration(seconds: 15), onTimeout: () {
      try {
        if (timeoutActive != false) {
          // Close the loading indicator
          Functions.safePop(context);
          Functions.showToast(timeoutMsg ?? 'We encountered a problem. :( Please try again later.');
        }
      } catch (e) {
        printMsg('Functions', 'showLoadingDialog', 'catch error in timeout');
      }
    });
  }

  /// Appends 'slide' to the end of the route name so that it will bypass routes and
  /// instead go to onGenerateRoute where the slide up transition will be used.
  static Future pushNamedWithSlideUpTransition<T extends Object>(
      BuildContext context, String routeName,
      {Object? arguments}) async {
    //printMsg('functions', 'pushNamedWithSlideUpTransition', 'route: $routeName');
    return await Navigator.pushNamed(context, routeName + 'slide',
        arguments: arguments);
  }

  /// Appends 'slide' to the end of the route name so that it will bypass routes and
  /// instead go to onGenerateRoute where the slide up transition will be used.
  static Future popAndPushNamedWithSlideUpTransition<T extends Object>(
      BuildContext context, String routeName,
      {Object? arguments}) async {
    printMsg('functions', 'popAndPushNamedWithSlideUpTransition',
        'route: $routeName');
    return await Navigator.popAndPushNamed(context, routeName + 'slide',
        arguments: arguments);
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}
