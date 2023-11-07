import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result="";
  var bgColor = Colors.indigo.shade300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI'),
      ),
      backgroundColor: bgColor,
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            children: [
              Text('BMI',style: TextStyle(
                fontSize: 34,fontWeight: FontWeight.bold
              ),),
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Text('Enter your(in kgs)'),
                  prefixIcon: Icon(Icons.line_weight)
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 21),
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                    label: Text('Enter your(in Feet)'),
                    prefixIcon: Icon(Icons.height)
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 21),
              TextField(
                controller: inController,
                decoration: InputDecoration(
                    label: Text('Enter your(in Inch)'),
                    prefixIcon: Icon(Icons.height)
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 21),
              ElevatedButton(onPressed: (){
                var wt =wtController.text.toString();
                var ft =ftController.text.toString();
                var inch =inController.text.toString();
                if(wt!=""&& ft!=""&& inch!=""){
                  var iwt = int.parse(wt);
                  var ift = int.parse(ft);
                  var iInch = int.parse(inch);
                  var tInch = (ift*12) + iInch;
                  var tCm = tInch*2.54;
                  var tM = tCm/100;
                  var bmi = iwt/(tM*tM);
                 var msg = "";

                  if(bmi>25){
                    msg = "You'r OverWeight!!";
                    bgColor = Colors.orange.shade200;
                  }else if(bmi<18){
                    bgColor = Colors.red.shade200;
                    msg ="You'r UnderWeight!!";
                  }else{
                    bgColor = Colors.green.shade200;
                    msg = "You'r Healthy!!";
                  }
                  setState(() {
                    result ="$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                  });

                }else{
                  setState(() {
                    result = "Please fill all the required blanks !!";
                  });
                }
              },
                  child: Text('Calculate'),

              ),
              Text(result, style: TextStyle(fontSize: 16),)

            ],
          ),
        ),
      ),
    );
  }
}


