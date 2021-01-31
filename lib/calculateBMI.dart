import 'package:flutter/material.dart';
import 'dart:math';

class CalculateBMI {

  CalculateBMI({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi;
  String Calculate()
  {
    _bmi = weight/ pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult()
  {
    if(_bmi>=25)
      {
        return 'মোটা';
      }
    else if (_bmi > 18.5)
      {

        return 'স্বাভাবিক';

      }
    else
      {
        return 'চিকন';
      }
  }
  String getInterpretention()
  {
    if(_bmi>=25)
    {
      return 'নরমাল শরীরের ওজন থেকে বেশি আছে, আপনার ব্যায়াম করা উচ্চিত।';
    }
    else if (_bmi > 18.5)
    {

      return 'মা শা আল্লাহ্!‌ আপনার শরিরের ওজন একদম ঠিক আছে।';

    }
    else
    {
      return 'আপনার আরও খাওয়া দাওয়া করা উচ্চিত, ওজন বেশ কম আছে।';
    }
  }

}
