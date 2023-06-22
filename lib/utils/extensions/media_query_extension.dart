import 'package:flutter/cupertino.dart';


///
/// Instead of Media Query we can use this extension on BuildContext
///
extension MediaQueryValues on BuildContext{
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

