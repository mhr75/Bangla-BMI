class ConvertToBangla
{
  ConvertToBangla({this.number});
  int number;
  String conversion()
  {
    String banglaNumber="";
    for(int i = number;i>0;) {
      int digit = i % 10;
      if (digit == 0) banglaNumber = "০"+banglaNumber;
      if (digit == 1) banglaNumber = "১"+banglaNumber;
      if (digit == 2) banglaNumber = "২"+banglaNumber;
      if (digit == 3) banglaNumber = "৩"+banglaNumber;
      if (digit == 4) banglaNumber = "৪"+banglaNumber;
      if (digit == 5) banglaNumber = "৫"+banglaNumber;
      if (digit == 6) banglaNumber = "৬"+banglaNumber;
      if (digit == 7) banglaNumber = "৭"+banglaNumber;
      if (digit == 8) banglaNumber = "৮"+banglaNumber;
      if (digit == 9) banglaNumber = "৯"+banglaNumber;
      double ii = i/10;
      i= ii.floor();
      print(banglaNumber);
    }
    return banglaNumber;
  }
}