import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:synses/data/IBSData.dart';
import 'package:synses/data/dietData.dart';
import 'package:synses/data/bathroomData.dart';
import 'package:synses/data/exerciseData.dart';
import 'package:synses/data/moodData.dart';
import 'package:synses/data/sleepData.dart';
import 'package:synses/data/weightingData.dart';
import 'package:synses/data/hydrationData.dart';
import 'package:synses/home_page.dart';
import 'package:synses/home_page_model.dart';
import 'package:synses/shared/boxes.dart';
import 'package:synses/shared/routes.dart';
import './data/entry.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(SleepDataAdapter());
  Hive.registerAdapter(BathroomDataAdapter());
  Hive.registerAdapter(MoodDataAdapter());
  Hive.registerAdapter(ExerciseDataAdapter());
  Hive.registerAdapter(WeightingDataAdapter());
  Hive.registerAdapter(DietDataAdapter());
  Hive.registerAdapter(HydrationDataAdapter());
  Hive.registerAdapter(IBSDataAdapter());

  await Hive.openBox<Entry>(Boxes.entryBoxString);

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