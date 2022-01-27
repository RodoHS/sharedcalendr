import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sharedcalendr/models/auth_model.dart';
import 'package:sharedcalendr/models/main_model.dart';
import 'package:sharedcalendr/pages/home_page.dart';
import 'package:sharedcalendr/pages/loading_page.dart';
import 'package:sharedcalendr/utils/functions.dart';

void main() async {
  // Need to ensureInitialized before calling Firebase.initializeApp, 
  // since the initializeApp function requires platform channels to work 
  // correctly.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthModel>(create: (_) => AuthModel()),
        ChangeNotifierProxyProvider<AuthModel, MainModel>(
          create: (BuildContext context) =>
              MainModel(context.read<AuthModel>()),
          update: (_, authModel, mainRegime) =>
              mainRegime!..update(authModel),
        ),
      ],
      child: App(),
    ),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  static const String _flavor = String.fromEnvironment('app.flavor');

  @override
  Widget build(BuildContext context) {
    AuthModel _authModel = context.watch<AuthModel>();

    if (_authModel.isBootLoading) {
      return _buildMaterialApp(LoadingPage(), ValueKey('loadingpagekey'));
    } else if (_authModel.user.userMainDataPresent()) {
      return _buildMaterialApp(HomePage(), ValueKey('homepagekey'));
    } else {
      return _buildMaterialApp(HomePage(), ValueKey('homepagekey'));
    }
  }

  MaterialApp _buildMaterialApp(Widget page, ValueKey key) {
    return MaterialApp(
      key: key,
      debugShowCheckedModeBanner: false,
      title: 'SharedCalendr',
      theme: ThemeData(
        canvasColor: Colors.white,
        splashColor: Colors.transparent,
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
        primarySwatch: Colors.grey,
      ),
      home: page,
      routes: routes,
      onGenerateRoute: (settings) {
        /// Call Functions.pushNamedWithSlideUpTransition
        //print('main.dart - onGenerateRoute - ${settings.name}');
        return Functions.slideUpPageRouteBuilder(
            routes[settings.name!.replaceFirst('slide', '')]!(context),
            settings: settings);
      },
    );
  }

  var routes = {
    HomePage.routeName: (context) => HomePage(),
    LoadingPage.routeName: (context) => LoadingPage(),
  };
}
