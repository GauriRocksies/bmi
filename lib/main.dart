import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(63, 81, 181, 1),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('yourBMI'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in kgs'),
                    prefixIcon: Icon(Icons.scale),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 21),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter your height (feet)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 21),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your hright (inches)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 21),
                SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inc = inController.text.toString();

                    if (wt != "" && ft != "" && inc != "") {
                      //BMI calc

                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iinch = int.parse(inc);

                      var tInch = (ift * 12) + iinch;
                      var tm = (tInch * 2.54) / 100; // converted inchto metre

                      var bmi = iwt / (tm * tm);

                      var msg = "";

                      if (bmi > 25) {
                        msg = "You are overweight";
                        bgColor = Colors.red.shade200;
                      } else if (bmi < 18) {
                        msg = "You are underweight";
                        bgColor = Colors.purple.shade200;
                      } else {
                        msg = "You are healthy";
                        bgColor = Colors.green.shade200;
                      }
                      setState(() {
                        result = "$msg \nYour BMI is ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all required blanks!!";
                      });
                    }
                  },
                  child: Text("Calculate"),
                ),

                SizedBox(height: 11),

                Text(
                  result,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
