part of streetlib;

DecoManager decoManager = new DecoManager();
class DecoManager {
  spawn(Map source, Map layer, Element layerElement, num ground_y) {
    ImageElement decoElement = layerElement.append(new ImageElement());
    decoElement.src = 'http://childrenofur.com/locodarto/scenery/' + source['filename'] + '.png';
            
    int x = source['x'] - source['w']~/2;
    int y = source['y'] - source['h'] + ground_y;
    if(layer['name'] == 'middleground') {
        //middleground has different layout needs
        y += layer['h'];
        x += layer['w']~/2;
    }
    int w = source['w'];
    int h = source['h'];
    int z = source['z'];

    decoElement.style
      ..position = 'absolute'
      ..left = x.toString() + 'px'
      ..top = y.toString() + 'px'
      ..width = w.toString() + 'px'
      ..height = h.toString() + 'px'
      ..zIndex = z.toString()
      ..transform = 'translateZ(' + z.toString() + 'px)';
          
    if (source['h_flip'] == true)
     decoElement.style.transform += ' scale(-1,1)';
  } 
}