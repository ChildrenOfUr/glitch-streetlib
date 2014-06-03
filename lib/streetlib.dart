library streetlib;

import 'package:libld/libld.dart';
import 'dart:html';

part 'src/filter.dart';
part 'src/deco.dart';

class Street {
  Map source;
  Element canvas = querySelector('#street-canvas');
  
  Street(Asset streetAsset) {  
  // Check to see if the asset is loaded, if not, load it.
    if (jsonExtensions.contains('street') == false)    
      jsonExtensions.add('street');
    if (streetAsset.loaded == false)
      streetAsset.load().then((_) => _init(streetAsset.get()));
    else
      _init(streetAsset.get());
  }
  
  // Actually set up the new Street.
  _init(Map street) {
    
    this.source = street; // for external access
    // temp vars
    String gtop = street['gradient']['top'];
    String gbottom = street['gradient']['bottom'];
    
    canvas.id = street['label'];
    canvas.style
      ..position = 'absolute'
      ..top = '0'
      ..left = '0'
      ..width = (street['dynamic']['r'] + street['dynamic']['l'].abs()).toString() + 'px' // set width
      ..height = (street['dynamic']['b'] + street['dynamic']['t'].abs()).toString() + 'px' // set width
      ..background = '-webkit-linear-gradient(#$gtop, #$gbottom)'
      ..background = 'linear-gradient(#$gtop, #$gbottom)'
      ..perspectiveOriginY = '100%'
      ..perspective = '50'
      ..overflow = 'hidden';    
    
    // Populate our deco layers
    for (String layerName in street['dynamic']['layers'].keys) {
      DivElement layerElement = canvas.append(new DivElement());
      layerElement.id = layerName;
      
      Map layer = street['dynamic']['layers'][layerName];
      applyFilters(layerElement, layer);      
      // SIZE AND SCALE
      layerElement.style
        ..position = 'absolute'
        ..width = layer['w'].toString() + 'px'
        ..height = layer['h'].toString() + 'px'
        ..zIndex = layer['z'].toString()
        ..transform = 'translateZ(' + layer['z'].toString() + 'px)'
        ..top = '0'
        ..left = '0';        
      
      
      for (Map deco in layer['decos'])
        decoManager.spawn(deco, layer, layerElement, street['dynamic']['ground_y']);
    
      // Release references so they can be garabage collected.
      layerElement = null;
      gtop = null;
      gbottom = null;
    }   
  }
  
  // set the camera position
  camera(int x, int y) {
    canvas.style.perspectiveOriginX = (canvas.clientWidth/2 + x).toString() + 'px';
    canvas.style.left = (canvas.clientWidth/2 + x).toString() + 'px';
    canvas.style.perspectiveOriginY = (canvas.clientHeight/2 + y).toString() + 'px';
    canvas.style.top = (canvas.clientHeight/2 + y).toString() + 'px';    
  }  
}













