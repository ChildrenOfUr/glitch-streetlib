import 'package:libld/libld.dart';
import 'package:streetlib/streetlib.dart';

import 'dart:html';


main() {  
  jsonExtensions.add('street');
  new Asset('./test.street').load()
    .then((Asset a) {
    Street s = new Street(a.get());
    document.body.onMouseMove.listen((MouseEvent m) {
        s.camera(m.client.x, m.client.y);
      });
  });

}

