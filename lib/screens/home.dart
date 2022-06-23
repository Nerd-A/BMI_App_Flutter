import 'package:flutter/material.dart';
//import 'package:bmi/constants/app_constants.dart';
import 'package:bmi/widgets/leftbar.dart' as LeftBar;
import 'package:bmi/widgets/rightbar.dart' as RightBar;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightcontroller = TextEditingController();
  TextEditingController _weightcontroller = TextEditingController();
  double result = 0;
  String tresult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: 130,
                  child: TextField(
                    controller: _heightcontroller,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.blue),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                            color: Colors.blue)),
                  )),
              Container(
                  width: 130,
                  child: TextField(
                    controller: _weightcontroller,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                        color: Colors.blue),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                            color: Colors.blue)),
                  ))
            ],
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
              onTap: () {
                double h = double.parse(_heightcontroller.text);
                double w = double.parse(_weightcontroller.text);
                setState(() {
                  result = (w / (h * h));
                  if (result > 25) {
                    tresult = "Over Weight";
                  } else if (result > 18.5 && result <= 25) {
                    tresult = "Normal";
                  } else {
                    tresult = "Under Weight";
                  }
                });
              },
              child: Container(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              )),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
              result.toStringAsFixed(2),
              style: TextStyle(fontSize: 90, color: Colors.blue),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Visibility(
              visible: tresult.isNotEmpty,
              child: Container(
                  child: Text(
                tresult,
                style: TextStyle(fontSize: 50, color: Colors.blue),
              ))),
          const SizedBox(
            height: 10,
          ),
          const LeftBar.LeftBar(barWidth: 100),
          const SizedBox(
            height: 10,
          ),
          const RightBar.RightBar(
            barWidth: 180,
          ),
          const SizedBox(
            height: 10,
          ),
          const LeftBar.LeftBar(
            barWidth: 180,
          ),
          const SizedBox(
            height: 10,
          ),
          const RightBar.RightBar(
            barWidth: 100,
          )
        ]),
      ),
    );
  }
}
