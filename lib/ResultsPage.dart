import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card_content.dart';
import 'input_page.dart';
class ResultsPage extends StatelessWidget {

  ResultsPage({this.interpretation,this.resultText,this.bmiResult});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('শরীরের ভর সূচক')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            child: Text('আপনার রেজাল্ট',
            style: TextStyle(
              fontSize:30,
              fontWeight: FontWeight.bold,
            ),)
          ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(colour: Color(0xFFC70039),
              cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFC300),
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
              ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('RE-Calculate',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFFFFC300),
                borderRadius: BorderRadiusDirectional.circular(5),
              ),
              height: 70,
              width: double.infinity,
              padding: EdgeInsets.only(
                bottom: 12,
              ),
              // 0xFFFF5733
              //0xFFFFC300
            ),
          ),
        ],
      ),
    );
  }
}
