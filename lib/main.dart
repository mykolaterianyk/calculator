import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(

      child: ElevatedButton(onPressed: (){
       //code
      },

        child: Text(btntxt,
          style: TextStyle(
              fontSize: 30,
              color: txtcolor,
              fontWeight: FontWeight.w500
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: btncolor,
          padding: EdgeInsets.all(20),
          shape: CircleBorder(),
        ),

      ),
    );
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.only(right: 40,bottom: 20),
                child: Text('0',
                  style: TextStyle(color: Colors.black),
                ),
              )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              children: [
                calcbutton('C', Colors.white70, Colors.red),
                calcbutton('( )', Colors.white70, Colors.green),
                calcbutton('%', Colors.white70, Colors.green),
                calcbutton('/', Colors.white70, Colors.green),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              children: [

                calcbutton('7', Colors.white70, Colors.black),
                calcbutton('8', Colors.white70, Colors.black),
                calcbutton('9', Colors.white70, Colors.black),
                calcbutton('x', Colors.white70, Colors.green),
              ],
            ),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              children: [

                calcbutton('4', Colors.white70, Colors.black),
                calcbutton('5', Colors.white70, Colors.black),
                calcbutton('6', Colors.white70, Colors.black),
                calcbutton('-', Colors.white70, Colors.green),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              children: [

                calcbutton('1', Colors.white70, Colors.black),
                calcbutton('2', Colors.white70, Colors.black),
                calcbutton('3', Colors.white70, Colors.black),
                calcbutton('+', Colors.white70, Colors.green),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              children: [

                calcbutton('+/-', Colors.white70, Colors.black),
                calcbutton('0', Colors.white70, Colors.black),
                calcbutton(',', Colors.white70, Colors.black),
                calcbutton('=', Colors.green, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}