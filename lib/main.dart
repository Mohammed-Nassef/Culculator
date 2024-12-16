import 'package:flutter/material.dart';
import 'package:flutter_calculator/button.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String resultText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffa2bbcf),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  resultText,
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 48,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Button(
                              click: clear,
                              text: "Ac",
                              back: Color.fromARGB(0, 32, 91, 122),
                              fore: Color(0xff1d3849)),
                          Button(
                              click: backSpace,
                              text: "<=",
                              back: Color.fromARGB(0, 32, 91, 122),
                              fore: Color(0xff1d3849))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Button(
                              click: onClickDigit,
                              text: "7",
                              back: Color.fromRGBO(255, 0, 0, 0),
                              fore: Color(0xff024383)),
                          Button(
                              click: onClickDigit,
                              text: "8",
                              back: Color.fromRGBO(255, 0, 0, 0),
                              fore: Color(0xff024383)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Button(
                              click: onClickDigit,
                              text: "4",
                              back: Color.fromRGBO(255, 0, 0, 0),
                              fore: Color(0xff024383)),
                          Button(
                              click: onClickDigit,
                              text: "5",
                              back: Color.fromRGBO(255, 0, 0, 0),
                              fore: Color(0xff024383)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Button(
                              click: onClickDigit,
                              text: "1",
                              back: Color.fromRGBO(255, 0, 0, 0),
                              fore: Color(0xff024383)),
                          Button(
                              click: onClickDigit,
                              text: "2",
                              back: Color.fromRGBO(255, 0, 0, 0),
                              fore: Color(0xff024383)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Button(
                                  click: onClickDigit,
                                  text: "0",
                                  back: Color.fromRGBO(255, 0, 0, 0),
                                  fore: Color(0xff024383)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                          click: onCLickOperator,
                          text: "/",
                          back: Color.fromRGBO(255, 0, 0, 0),
                          fore: Color(0xff024383)),
                      Button(
                          click: onClickDigit,
                          text: "9",
                          back: Color.fromRGBO(255, 0, 0, 0),
                          fore: Color(0xff024383)),
                      Button(
                          click: onClickDigit,
                          text: "6",
                          back: Color.fromRGBO(255, 0, 0, 0),
                          fore: Color(0xff024383)),
                      Button(
                          click: onClickDigit,
                          text: "3",
                          back: Color.fromRGBO(255, 0, 0, 0),
                          fore: Color(0xff024383)),
                      Button(
                          click: dotOPerator,
                          text: ".",
                          back: Color.fromRGBO(255, 0, 0, 0),
                          fore: Color(0xff024383)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 22),
                          child: Button(
                              click: onCLickOperator,
                              text: "*",
                              back: Color.fromRGBO(255, 0, 0, 0),
                              fore: Color(0xff024383)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 15),
                          child: Button(
                              click: onCLickOperator,
                              text: "-",
                              back: Color.fromRGBO(255, 0, 0, 0),
                              fore: Color(0xff024383)),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 10),
                          child: Button(
                              click: onCLickOperator,
                              text: "+",
                              back: Color.fromRGBO(255, 0, 0, 0),
                              fore: Color(0xff024383)),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Button(
                              click: onEqualdigit,
                              text: "=",
                              back: Color.fromRGBO(255, 0, 0, 0),
                              fore: Color(0xff024383)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ))
          ]),
        ),
      ),
    );
  }

  String savedNamber = "";
  String savedOPerator = "";

  void onClickDigit(String text) {
    resultText += text;
    // print(resultText);
    setState(() {});
  }

  // String resulttext = "";
  void onCLickOperator(String operator) {
    if (resultText.isEmpty) return;
    if (savedNamber.isEmpty) {
      savedNamber = resultText;
    } else {
      savedNamber = calculate(savedNamber, savedOPerator, resultText);
    }
    savedOPerator = operator;
    resultText = "";

    setState(() {});
  }

  String calculate(String left, String operator, String right) {
    double num1 = double.parse(left);
    double num2 = double.parse(right);
    late double resulte;
    switch (operator) {
      case "+":
        resulte = num1 + num2;
        break;
      case "-":
        resulte = num1 - num2;
        break;
      case "*":
        resulte = num1 * num2;
        break;
      case "/":
        resulte = num1 / num2;
        break;
    }
    return resulte.toString();
  }

  void onEqualdigit(String _) {
    if (resultText.isEmpty || savedNamber.isEmpty) return;
    resultText = calculate(savedNamber, savedOPerator, resultText);
    savedNamber = "";
    savedOPerator = "";
    setState(() {});
  }

  void clear(String _) {
    savedNamber = "";
    resultText = "";
    savedOPerator = "";
    setState(() {});
  }

  void backSpace(String _) {
    if (resultText.isEmpty) return;
    resultText = resultText.substring(0, resultText.length - 1);
    setState(() {});
  }

  void dotOPerator(String _) {
    if (resultText.contains(".")) {
      return;
    }
    resultText += ".";
    setState(() {});
  }
}
