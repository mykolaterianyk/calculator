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

  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor,) {
    return Container(

      child: ElevatedButton(onPressed: (){
       calculation(btntxt);
      },

        child: Text(btntxt,
          style: TextStyle(
              fontSize: 40,
              color: txtcolor,
              fontWeight: FontWeight.w500
          ),
        ),

        style: ElevatedButton.styleFrom(
          backgroundColor: btncolor,
          shape: CircleBorder(),
        ),
      ),

    );
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(padding: EdgeInsets.only(right: 20,bottom: 20),
                child: Text(text,
                  style: TextStyle(color: Colors.black,fontSize: 150),
                ),
              )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              children: [
                SizedBox(width: 80, height: 80,
                child: calcbutton('C', Colors.white70, Colors.red),
                ),
                SizedBox(width: 80, height: 80,
                  child:calcbutton('( )', Colors.white70, Colors.green),
                ),
                SizedBox(width: 80, height: 80,
                  child:calcbutton('%', Colors.white70, Colors.green),
                ),
                SizedBox(width: 80, height: 80,
                  child:calcbutton('/', Colors.white70, Colors.green),
                ),


              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              children: [
                SizedBox(width: 80, height: 80,
                  child: calcbutton('7', Colors.white70, Colors.black),
                ),
                SizedBox(width: 80, height: 80,
                  child:calcbutton('8', Colors.white70, Colors.black),
                ),
                SizedBox(width: 80, height: 80,
                  child:calcbutton('9', Colors.white70, Colors.black),
                ),
                SizedBox(width: 80, height: 80,
                  child:calcbutton('x', Colors.white70, Colors.green),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              children: [
                SizedBox(width: 80, height: 80,
                  child: calcbutton('4', Colors.white70, Colors.black),
                ),
                SizedBox(width: 80, height: 80,
                  child:calcbutton('5', Colors.white70, Colors.black),
                ),
                SizedBox(width: 80, height: 80,
                  child:calcbutton('6', Colors.white70, Colors.black),
                ),
                SizedBox(width: 80, height: 80,
                  child:calcbutton('-', Colors.white70, Colors.green),
                ),




              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              children: [
                SizedBox(width: 80, height: 80,
                  child: calcbutton('1', Colors.white70, Colors.black),
                ),
                SizedBox(width: 80, height: 80,
                  child:calcbutton('2', Colors.white70, Colors.black),
                ),
                SizedBox(width: 80, height: 80,
                  child:calcbutton('3', Colors.white70, Colors.black),
                ),
                SizedBox(width: 80, height: 80,
                  child:calcbutton('+', Colors.white70, Colors.green),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround ,
              children: [
                SizedBox(width: 80, height: 80,
                  child: calcbutton('+/-', Colors.white70, Colors.black),
                ),
                SizedBox(width: 80, height: 80,
                  child:calcbutton('0', Colors.white70, Colors.black),
                ),
                SizedBox(width: 80, height: 80,
                  child: calcbutton(',', Colors.white70, Colors.black),
                ),
                SizedBox(width: 80, height: 80,
                  child:calcbutton('=', Colors.green, Colors.white),
                ),




              ],
            ),
          ],
        ),
      ),
    );
  }
  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {


    if(btnText  == 'C') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';

    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
        finalResult = add();
      } else if( preOpr == '-') {
        finalResult = sub();
      } else if( preOpr == 'x') {
        finalResult = mul();
      } else if( preOpr == '/') {
        finalResult = div();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if(opr == '+') {
        finalResult = add();
      } else if( opr == '-') {
        finalResult = sub();
      } else if( opr == 'x') {
        finalResult = mul();
      } else if( opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }

    else if(btnText == '+/-') {
      result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
      finalResult = result;

    }

    else {
      result = result + btnText;
      finalResult = result;
    }


    setState(() {
      text = finalResult;
    });

  }


  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {

    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }
}

