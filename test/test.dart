import 'package:libld/libld.dart' as ld;
import 'package:streetlib/streetlib.dart';
import 'dart:html';


main() {
  
  Element canvas = querySelector('#canvas');

  canvas.parent.style
    ..position = 'absolute'
    ..left = '100px'
    ..top = '50px'
    ..width = '2000px'
    ..height = '900px'
    ..overflow= 'scroll'
    ..zoom = '50%'
  ;
  
  ld.Asset st = new ld.Asset('./test.street');
  Street s = new Street(st, canvas);    
}

