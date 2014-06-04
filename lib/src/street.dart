part of streetlib;


final Element _street_canvas = querySelector('#street');
final Element _street_loadbar = querySelector('#newLocation .bar .percent');

class Street {
  Street(Map source) {
    // Prepare the loading splash
    querySelector('#streetLoading')
      ..style.opacity = '1'
      ..style.transition = 'opacity 0.5s'
      ..hidden = false
      ..querySelector('#location').text = source['label'];
    
    // Gather up all the image assets
    List decos = [];
    for (Map layer in source['dynamic']['layers'].values)
      for (Map deco in layer['decos'])
        decos.add(new Asset('http://childrenofur.com/locodarto/scenery/' + deco['filename'] + '.png'));
    
    Batch decoBatch = new Batch(decos);
    
    // Load the images and remove the loader.
    decoBatch.load((num percent) => querySelector('#streetLoading .percent').style.width = percent.toString() + '%').then( (_) {
    
    // Color, and position the street
    String gt = source['gradient']['top'];
    String gb = source['gradient']['bottom'];
    clear();
    _street_canvas.style
      ..position = 'absolute'
      ..top = '0' ..left = '0'
      ..zIndex = '-5'
      ..overflow = 'hidden'
      ..width = (source['dynamic']['r'] + source['dynamic']['l'].abs()).toString() + 'px' // set width
      ..height = (source['dynamic']['b'] + source['dynamic']['t'].abs()).toString() + 'px' // set height
      ..background = '-webkit-linear-gradient(#$gt, #$gb)'
      ..background = '-moz-linear-gradient(#$gt, #$gb)'
      ..background = 'linear-gradient(#$gt, #$gb)'
      ..perspective = '100'
      ..perspectiveOriginY = '100%';
    for (String layerName in source['dynamic']['layers'].keys)
      new Layer(layerName, source['dynamic']['layers'][layerName]);
    querySelector('#streetLoading').style.opacity = '0';
    new Timer(new Duration(seconds: 1), () => querySelector('#streetLoading').hidden = true);
    });
  }
  
  clear() {
    _street_canvas.children.clear();
  }
  camera(int x, int y) {
    _street_canvas.style
      ..perspectiveOriginX = x.toString() + 'px'
      ..perspectiveOriginY = y.toString() + 'px';
  }
}

/* TODO
 * Perhaps it would be useful to create a Street.readable constructor
 * Then we could build in a way to get Json streets out of a Street object.
 */
