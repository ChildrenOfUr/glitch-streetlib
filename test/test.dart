import 'package:libld/libld.dart' as ld;
import 'package:streetlib/streetlib.dart';

import 'package:okeyee/okeyee.dart';
import 'dart:html';
import 'dart:async';



main() {
  
  int x = 0;
  int y = 0;
  
  Keyboard k = new Keyboard();
  k.register('d', (_) => x+=5);
  k.register('a', (_) => x-=5);
  k.register('s', (_) => y+=5);
  k.register('w', (_) => y-=5);
  querySelector("body").onKeyDown.listen(k.press);
  
  Element canvas = querySelector('#street-canvas');

  canvas.parent.style
    ..position = 'absolute'
    ..left = '200px'
    ..top = '200px'
    ..width = '2000px'
    ..height = '900px'
    ..overflow = 'scroll'
    ..zoom = '50%'
  ;
  
  ld.Asset st = new ld.Asset('./test.street');
  Street s = new Street(st);
  
  document.body.onKeyDown.listen((event) => k.press);
  

  

  

  
  
  Timer t = new Timer.periodic(new Duration(milliseconds: 1), (_) {s.camera(x,y);});

}

