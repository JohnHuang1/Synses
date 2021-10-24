import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:synses/home_page.dart';

class hpage extends StatefulWidget {
  const hpage({Key? key}) : super(key: key);

  @override
  State<hpage> createState() => _hpageState();
}

class _hpageState extends State<hpage> {
  @override
  initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FittedBox(
      child: Image.asset('images/synsesLoading.png'),
      fit: BoxFit.fill,
    ));
  }
}
