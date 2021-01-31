import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_content.dart';
import 'icon_content.dart';
import 'ResultsPage.dart';
import 'calculateBMI.dart';
import 'convertTobangla.dart';

const inactiveColour = Color(0xFFC70039);
const activeColour = Color(0xFFFFC300);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveColour;
  Color femaleCardColor = inactiveColour;
  int height = 180;
  int weight = 60;
  int age = 20;

  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColor == inactiveColour) {
        maleCardColor = activeColour;
        femaleCardColor = inactiveColour;
      } else {
        maleCardColor = inactiveColour;
      }
    } else {
      if (femaleCardColor == inactiveColour) {
        femaleCardColor = activeColour;
        maleCardColor = inactiveColour;
      } else {
        femaleCardColor = inactiveColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('শরীরের ভর সূচক')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(1);
                      });
                    },
                    child: ReusableCard(
                      colour: maleCardColor,
                      cardChild: cardReusable(
                        icon: FontAwesomeIcons.venus,
                        label: 'মেয়ে',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(2);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColor,
                      cardChild: cardReusable(
                          icon: FontAwesomeIcons.mars, label: 'ছেলে'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(

            child: ReusableCard(
              colour: inactiveColour,
              cardChild: Column(
                children: [
                  Text(
                    "উচ্চতা",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        Bangla(height),
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        ' সে.মি.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFFFC300),
                      overlayColor: Color(0x29FFC300),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      min: 120,
                      max: 240,
                      activeColor: Color(0xFFFFC300),
                      inactiveColor: Color(0xFFFF5733),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: inactiveColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ওজন',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        Text(
                        Bangla(weight),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: inactiveColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'বয়স',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        Text(
                          Bangla(age),
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              CalculateBMI bmi = CalculateBMI(height: height,weight: weight);

              Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: bmi.Calculate(),
                resultText: bmi.getResult(),
                interpretation: bmi.getInterpretention(),
              )));
            },
            child: Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Calculate',
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
String Bangla(int value)
{
  ConvertToBangla conv = ConvertToBangla(number: value);
  return conv.conversion();

}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        height: 50,
        width: 50,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      fillColor: Color(0xFFFF5733),
    );
  }
}
