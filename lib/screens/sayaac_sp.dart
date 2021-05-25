import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SayacPage extends StatefulWidget {
  
  @override
  _SayacPageState createState() => _SayacPageState();
}

class _SayacPageState extends State<SayacPage> {
  late int _counter;

  Future<void> sharedPreferencesHazirla() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    _counter = sharedPreferences.getInt("sayac") ?? 0;
    setState(() {});
  }

  Future<void> veriKaydet() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    _counter += 1;
    sharedPreferences.setInt("sayac", _counter);
  }

  @override
  void initState() {
    super.initState();
    sharedPreferencesHazirla();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("$_counter" , style: TextStyle(
            fontSize: 32,
          ),),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState(() {
              veriKaydet();
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}