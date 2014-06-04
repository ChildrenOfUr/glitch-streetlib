import 'package:libld/libld.dart';
import 'package:streetlib/streetlib.dart';
import 'package:okeyee/okeyee.dart';
import 'dart:html';

int x = 0;
int y = 0;

main() {
  Keyboard k = new Keyboard();
  
  jsonExtensions.add('street');
  new Asset('./test.street').load()
    .then((Asset a) {
    Street s = new Street(a.get());
    k.register('d', (_) {x+=5;print(x);s.camera.set(x, y);s.update();});
    k.register('a', (_) {x-=5;print(x);s.camera.set(x, y);s.update();});
    document.body.onKeyDown.listen(k.press);
  });
}


