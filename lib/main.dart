import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:synses/home_page.dart';
import 'package:synses/home_page_model.dart';
import 'package:synses/shared/routes.dart';

void main() {
  runApp(SynsesApp());
}

class SynsesApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageModel>(create: (context) => HomePageModel()),
      ],
      child: MaterialApp(
        onGenerateRoute: _routeFactory(),
        theme: _theme(),
      ),
    );
  }
  RouteFactory _routeFactory(){
    return (settings){
      Map<String, dynamic>? arguments = settings.arguments as Map<String, dynamic>?;
      Widget screen;
      switch (settings.name) {
        case HomePageRoute:
          screen = HomePage();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (context) => screen);
    };
  }

  ThemeData _theme(){
    return ThemeData(
    );
  }

}