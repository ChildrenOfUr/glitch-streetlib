part of streetlib;

Deco _deco = new Deco._first();
class Deco {
  // Take a source Map from a layer and generate a new graphic.
  factory  Deco(Map source, Element container) {
    
    int x = source['x'] - source['w']~/2;
        int y = source['y'] - source['h'];
        //if(layer['name'] == 'middleground') {
            //middleground has different layout needs
        //    y += layer['h'];
        //    x += layer['w']~/2;
        //}
    
    ImageElement deco = container.append(ASSET[source['filename']].get().clone(true));
    deco.style
      ..position = 'absolute'
      ..width = source['w'].toString() + 'px'
      ..height = source['h'].toString() + 'px'
      ..zIndex = source['z'].toString() + 'px'
      ..left = x.toString() + 'px'
      ..top = y.toString() + 'px';
    
    if (source['h_flip'] == true)
         deco.style.transform += ' scale(-1,1)';
    
    return _deco;
  }
  Deco._first(); // Make the first deco object that gets reused.
}